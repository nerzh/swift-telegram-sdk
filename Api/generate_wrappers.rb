#!/usr/bin/env ruby

require 'rubygems'
require 'byebug'
require 'bundler/setup'
Bundler.require(:default)

require 'fileutils'

HTML_FILE = 'tg-api.html'
LIB_FOLDER_NAME = 'TelegramVaporBot'
API_DIR = "../Sources/#{LIB_FOLDER_NAME}/Bot/Telegram"
LIB_DIR = "../Sources/#{LIB_FOLDER_NAME}"
API_FILE = 'tg-api.txt'

TYPE_HEADER = <<EOT
// Telegram-vapor-bot - Telegram Bot Swift SDK.

EOT

METHOD_HEADER = <<EOT
// Telegram-vapor-bot - Telegram Bot Swift SDK.

EOT

ONE   = "    "
TWO   = "        "
THREE = "            "
FOUR  = "                "
PREFIX_LIB = "TG"

MODELS_DIR_NAME = "Models"
METHODS_DIR_NAME = 'Methods'

class Api

  def write_model_to_file(node, &block)
    type_name = node.text
    FileUtils.mkpath "#{API_DIR}/#{MODELS_DIR_NAME}"
    File.open("#{API_DIR}/#{MODELS_DIR_NAME}/#{PREFIX_LIB}#{type_name}.swift", "wb") do | out |
      type_name, variables_block, model_content = generate_model_file(node, false, &block)
      out.write model_content
    end
  end

  def generate_model_file(node, skip_fucking_telegram_any_type)
    current_node = node
    type_name = current_node.text
    current_node = current_node.next_element
    description = fetch_description(current_node)
    
    out = ""
    out << TYPE_HEADER
    if type_name == "MaskPosition"
      out << "import Vapor\n\n"
    end
    out << "/**\n"
    description.each_line do |line|
      out << " #{line.strip}\n"
    end
    out << "\n"
    out << " SeeAlso Telegram Bot API Reference:\n"
    out << " [#{type_name}](https://core.telegram.org/bots/api\##{type_name.downcase})\n"
    out << " **/\n"

    keys_block = ""
    vars_block = ""
    init_params_block = ""
    init_block = ""

    current_node = get_table_node(current_node)

    current_node.search('tr').each do |node|
      td = node.search('td')
      next unless !(td[0].nil? || td[0] == 0) && (td[0].text != 'Field' && td[0].text != 'Parameters')

      var_name = td[0].text
      var_type = td[1].text
      var_desc = td[2].text
      var_optional = var_desc.start_with? "Optional"
      
      correct_var_type = convert_type(var_name, var_desc, var_type, type_name, var_optional)
      correct_var_type_init = correct_var_type[-1] == "?" ? correct_var_type + " = nil" : correct_var_type
      var_name_camel = var_name.camel_case_lower

      keys_block << "#{TWO}case #{var_name_camel} = \"#{var_name}\"\n"
            
      var_desc.each_line do |line|
        vars_block << "#{ONE}/// #{line.strip}\n"
      end
            
      vars_block << "#{ONE}public var #{var_name_camel}: #{correct_var_type}\n\n"
      init_params_block << "#{var_name_camel}: #{correct_var_type_init}, "
      init_block << "#{TWO}self.#{var_name_camel} = #{var_name_camel}\n"

      # TRY TO GENERATE A CUSTOM TYPE LIKE ENUM OF STRING VALUES etc.
      generate_custom_model_if_needed(type_name, var_name, var_type, var_desc, description)
    end

    if block_given?
      model_blocks = yield
      keys_block = model_blocks[:keys_block]
      vars_block = model_blocks[:vars_block]
      init_params_block = model_blocks[:init_params_block]
      init_block = model_blocks[:init_block]
    end

    var_protocol = "Codable"
    
    if fucking_telegram_any_type?(description)
      return [type_name, vars_block, ''] if skip_fucking_telegram_any_type
      content = generate_fucking_telegram_any_type(type_name, var_protocol, description)
      out << content
    else
      out <<  "public final class #{PREFIX_LIB}#{type_name}: #{var_protocol} {\n\n"
    
      if keys_block != ""
        out << "#{ONE}/// Custom keys for coding/decoding `#{type_name}` struct\n"\
        "#{ONE}public enum CodingKeys: String, CodingKey {\n"\
        "#{keys_block}"\
        "#{ONE}}\n"\
        "\n"\
        "#{vars_block}"\
        "#{ONE}public init (#{init_params_block.chomp(', ')}) {\n"\
        "#{init_block}"\
        "#{ONE}}\n"
      end
      out << "}\n"
    end

    [type_name, vars_block, out]
  end

  def fucking_telegram_any_type?(description)
    description[/\s+can\s+be\s+one\s+of/] || 
    description[/\s+may\s+be\s+one\s+of/] || 
    description[/\s+should\s+be\s+one\s+of/] ||
    description[/scopes\s+are\s+supported:/] ||
    description[/\d+\s+types:\n/] ||
    description[/supported:\n/]
  end

  def fucking_telegram_any_type_name(line)
    line[/^\w+$/]
  end

  def generate_fucking_telegram_any_type(type_name, var_protocol, description)
    out = ''
    out << "public enum #{PREFIX_LIB}#{type_name}: #{var_protocol} {\n"
    start_trigger = false
    description.each_line do |line|
      if fucking_telegram_any_type?(line)
        start_trigger = true
        next
      end
      if start_trigger
        case_type_name = fucking_telegram_any_type_name(line.strip)
        unless case_type_name
          start_trigger = false
          next
        end
        case_name = case_type_name.clone
        case_name[0] = case_name[0].downcase
        out << "#{ONE}case #{case_name}(#{PREFIX_LIB}#{case_type_name})\n"
      end
    end
    out << "\n"
    out << "#{ONE}public init(from decoder: Decoder) throws {\n"
    out << "#{TWO}let container = try decoder.singleValueContainer()\n#{TWO}"
    start_trigger = false
    else_trigger = false
    description.each_line do |line|
      if fucking_telegram_any_type?(line)
        start_trigger = true
        next
      end
      if start_trigger
        case_type_name = fucking_telegram_any_type_name(line.strip)
        unless case_type_name
          start_trigger = false
          next
        end
        case_name = case_type_name.clone
        case_name[0] = case_name[0].downcase
        # out << "#{ONE}case #{case_name}(#{PREFIX_LIB}#{case_type_name})\n"
        e_l_s_e = else_trigger ? " else " : ""
        else_trigger = true
        out << "#{e_l_s_e}if let value = try? container.decode(#{PREFIX_LIB}#{case_type_name}.self) {\n"
        out << "#{THREE}self = .#{case_name}(value)\n"
        out << "#{TWO}}"
      end
    end
    out << " else {\n"
    out << "#{THREE}throw BotError(\"Failed! Can't decode ANY_TYPE #{type_name}.\")\n"
    out << "#{TWO}}\n"
    out << "#{ONE}}\n\n"
    
    out << "#{ONE}public func encode(to encoder: Encoder) throws {\n"
    out << "#{TWO}var container = encoder.singleValueContainer()\n"
    out << "#{TWO}switch self {\n"
    start_trigger = false
    description.each_line do |line|
      if fucking_telegram_any_type?(line)
        start_trigger = true
        next
      end
      if start_trigger
        case_type_name = fucking_telegram_any_type_name(line.strip)
        unless case_type_name
          start_trigger = false
          next
        end
        case_name = case_type_name.clone
        case_name[0] = case_name[0].downcase
        out << "#{TWO}case let .#{case_name}(value):\n"
        out << "#{THREE}try container.encode(value)\n"
      end
    end
    out << "#{TWO}}\n"
    out << "#{ONE}}\n"
    out << "}\n"

    out
  end

  def write_method_to_file(node)
    FileUtils.mkpath "#{API_DIR}/#{METHODS_DIR_NAME}"

    current_node = node
    method_name = current_node.text
    methods_signature = ''
    File.open("#{API_DIR}/#{METHODS_DIR_NAME}/#{method_name.capitalize_first}.swift", "wb") do | out |
      content, methods_signature = generate_method(node)
      out.write content
    end

    methods_signature
  end

  def generate_method(node)
    current_node = node
    methods_signature = ""
    method_name = current_node.text
    out = ""
    out << METHOD_HEADER
    out << "import Vapor\n\n"

    current_node = current_node.next_element
    description = fetch_description(current_node)
    current_node = get_table_node(current_node)

    result_type = deduce_result_type(description)
    result_type = make_swift_type_name('', result_type)

    codable_params_struct = ""
    codable_params_enum = ""
    
    out << "/// DESCRIPTION:\n/// #{description.gsub(/\n/, "\n/// ")}\n\n\n"

    anchor = method_name.downcase

    vars_desc = ""
    all_params = ""
    all_enums = ""
    init_params_body = ""
    init_params = ""
    
    has_obligatory_params = false
    has_upload_type = false
    
    current_node.search('tr').each do |node|
      td = node.search('td')
      next unless !(td[0].nil? || td[0] == 0) && (td[0].text != 'Parameters')

      var_name = td[0].text
      var_type = td[1].text
      var_optional = td[2].text.strip != 'Yes'
      var_desc = td[3].text
      
      if !has_obligatory_params
        if !var_optional
          has_obligatory_params = true
        end
      end

      swift_type_name = make_swift_type_name(var_name, var_type)
      
      if swift_type_name == "#{PREFIX_LIB}FileInfo" || swift_type_name == "#{PREFIX_LIB}InputFile"
        has_upload_type = true
      end
      
      all_params << make_request_parameter(method_name, swift_type_name, var_name, var_type, var_optional, var_desc)
      all_enums << make_request_value(method_name, swift_type_name, var_name, var_type, var_optional, var_desc)
      init_params << make_init_params(method_name, swift_type_name, var_name, var_type, var_optional, var_desc)
      init_params_body << make_init_body(method_name, swift_type_name, var_name, var_type, var_optional, var_desc)

      if vars_desc.empty?
        vars_desc += "    /// - Parameters:\n"
      end
      vars_desc +=   "    ///     - #{var_name}: "
      first_line = true
      var_desc.each_line do |line|
        stripped = line.strip
        next unless !stripped.empty?
        if first_line
          first_line = false
        else
          vars_desc += '    ///       '
        end
        vars_desc +=   "#{line.strip}\n"\
      end
    end

    method_name_capitalized = method_name.dup
    method_name_capitalized = "#{method_name_capitalized.capitalize_first}Params"

    body_param = ""

    #Generate description
    method_description = ""
    method_description << "/**\n"
    
    description.each_line do |line|
        method_description << " #{line.strip}\n"
    end
    
    method_description << "\n"
    method_description << " SeeAlso Telegram Bot API Reference:\n"
    method_description << " [#{method_name_capitalized}](https://core.telegram.org/bots/api\##{anchor})\n"
    method_description << " \n"
    method_description << " - Parameters:\n"
    method_description << "#{ONE} - params: Parameters container, see `#{method_name_capitalized}` struct\n"
    method_description << " - Throws: Throws on errors\n"
    method_description << " - Returns: `#{result_type}`\n"
    method_description << " */\n"


    async_method_content = ""
    if all_params.empty?
      # generate method
      out << "\n"
      out << "public extension #{PREFIX_LIB}Bot {\n"
      out << method_description

      # async method section
      async_method_content << "#{ONE}@discardableResult\n"
      async_method_content << "#{ONE}func #{method_name}() async throws -> #{result_type}"

      methods_signature << "\n\n#{async_method_content.gsub(/ = nil/, '')}"
      async_method_content << " {\n"
    else
      # generate output type
      encodable_type = "Encodable"
    
      # if has_upload_type
      #   encodable_type = "Encodable"
      # end
      out << "/// Parameters container struct for `#{method_name}` method\n"
      out << "public struct #{PREFIX_LIB}#{method_name_capitalized}: #{encodable_type} {\n\n"
      out << "#{all_params}"
      out << "#{ONE}/// Custom keys for coding/decoding `#{method_name_capitalized}` struct\n"
      out << "#{ONE}public enum CodingKeys: String, CodingKey {\n"
      out << "#{all_enums}"
      out << "#{ONE}}\n"
      out << "\n"
      out << "#{ONE}public init(#{init_params.chomp(', ')}) {\n"
      out << "#{init_params_body}"
      out << "#{ONE}}\n"
      out << "}\n"
      out << "\n"
      if has_obligatory_params
        params_block = "(params: #{PREFIX_LIB}#{method_name_capitalized})"
      else
        params_block = "(params: #{PREFIX_LIB}#{method_name_capitalized}? = nil)"
      end
      
      out << "\n"
      out << "public extension #{PREFIX_LIB}Bot {\n"
      out << "\n"
      out << method_description

      # async method section
      async_method_content << "#{ONE}@discardableResult\n"
      async_method_content << "#{ONE}func #{method_name}#{params_block} async throws -> #{result_type}"

      methods_signature << "\n\n#{async_method_content.gsub(/ = nil/, '')}"
      async_method_content << " {\n"
    end

    async_method_content << "#{TWO}let methodURL: URI = .init(string: getMethodURL(\"#{method_name}\"))\n"
    if all_params.empty?
      async_method_content << "#{TWO}let result: #{result_type} = try await tgClient.post(methodURL)\n"
    else
      async_method_content << "#{TWO}let result: #{result_type} = try await tgClient.post(methodURL, params: params, as: nil)\n"
    end

    async_method_content << "#{TWO}return result\n"
    async_method_content << "#{ONE}}\n"
    async_method_content << "}\n"

    out << "\n#{async_method_content}"

    [out, methods_signature]
  end

  def write_bot_protocol_to_file(signatures)
    protocol = METHOD_HEADER
    protocol << "import Vapor\n\n"
    protocol << "public protocol #{PREFIX_LIB}BotPrtcl {\n\n"
    protocol << "#{ONE}var app: Vapor.Application { get }\n"
    protocol << "#{ONE}var botId: String { get }\n"
    protocol << "#{ONE}var tgURI: URI { get }\n"
    protocol << "#{ONE}var tgClient: TGClientPrtcl { get }\n"
    protocol << "#{ONE}static var log: Logger { get }\n\n"
    signatures.each { |signature| protocol << "#{signature}\n\n" }
    protocol << "}\n\n"

    File.open("#{LIB_DIR}/Bot/#{PREFIX_LIB}BotPrtcl.swift", "wb") do | out |
      out.write protocol
    end
  end

  def write_chat_member_model_type_to_file
    html = File.open(HTML_FILE, "rb").read
    doc = Nokogiri::HTML(html)

    doc.css("br").each { |node| node.replace("\n") }
    
    keys_block = []
    vars_block = []
    init_params_block = []
    init_block = []

    doc.search("h4").each do |node|
      title = node.text.strip
      next unless title.split.count == 1

      if [
          'ChatMemberOwner',
          'ChatMemberAdministrator',
          'ChatMemberMember',
          'ChatMemberRestricted',
          'ChatMemberLeft',
          'ChatMemberBanned'
         ].include?(title)
      then
        type_name = node.text
        current_node = node.next_element
        current_node = get_table_node(current_node)
        current_node.search('tr').each do |node|
          td = node.search('td')
          next unless !(td[0].nil? || td[0] == 0) && (td[0].text != 'Field' && td[0].text != 'Parameters')

          var_name = td[0].text
          var_type = td[1].text
          var_desc = td[2].text
          var_optional = var_desc.start_with? "Optional"
          
          correct_var_type = convert_type(var_name, var_desc, var_type, type_name, var_optional)
          correct_var_type_init = correct_var_type
          var_name_camel = var_name.camel_case_lower

          keys_block << "#{TWO}case #{var_name_camel} = \"#{var_name}\"\n"
                
          var_desc.each_line do |line|
            vars_block << "#{ONE}/// #{line.strip}\n"
          end
          
          if var_name_camel == 'user' || var_name_camel == 'status'
            vars_block << "#{ONE}public var #{var_name_camel}: #{correct_var_type}\n\n"
          else
            vars_block << "#{ONE}public var #{var_name_camel}: #{correct_var_type[/\?$/] ? correct_var_type : "#{correct_var_type}?"}\n\n"
          end

          if var_name_camel == 'user' || var_name_camel == 'status'
            init_params_block << "#{var_name_camel}: #{correct_var_type_init}, "
          else
            init_params_block << "#{var_name_camel}: #{correct_var_type_init[/\?$/] ? correct_var_type_init : "#{correct_var_type_init}?"}, "
          end

          init_block << "#{TWO}self.#{var_name_camel} = #{var_name_camel}\n"
        end
      end
    end

    keys_block = keys_block.uniq!&.join('') || ''
    vars_block = vars_block.uniq!&.join('') || ''
    init_params_block = init_params_block.uniq!&.join('') || ''
    init_block = init_block.uniq!&.join('') || ''

    doc.search("h4").each do |node|
      title = node.text.strip
      next unless title.split.count == 1

      if title == 'ChatMember'
        write_model_to_file(node) do
          {
            keys_block: keys_block,
            vars_block: vars_block,
            init_params_block: init_params_block,
            init_block: init_block
          }
        end
      end
    end
  end





  private

  def generate_custom_model_if_needed(type_name, var_name, var_type, custom_type_description, type_description)
    if var_name == 'type'
      if var_type.upcase == 'String'.upcase
        if !search_cases_for_enum_type_of_variable_with_type_name(custom_type_description).empty?
          generate_enum_type(type_name, custom_type_description, type_description)
        end
      end
    end
  end

  def generate_enum_type(type_name, custom_type_description, type_description)
    custom_type_name = "#{PREFIX_LIB}#{type_name}Type"
    FileUtils.mkpath "#{API_DIR}/#{MODELS_DIR_NAME}"
    File.open("#{API_DIR}/#{MODELS_DIR_NAME}/#{custom_type_name}.swift", "wb") do | out |
      out.write TYPE_HEADER
      out.write "/**\n"
      type_description.each_line do |line|
        out.write " #{line.strip}\n"
      end
      out.write "\n"
      out.write " SeeAlso Telegram Bot API Reference:\n"
      out.write " [#{type_name}](https://core.telegram.org/bots/api\##{type_name.downcase})\n"
      out.write " */\n\n"
      
      out.write "public enum #{custom_type_name}: String, Codable {\n"
      descr = custom_type_description
      regexp = /(“.+?”|".+?")/
      while descr[regexp] do
        enum_case = $1
        enum_case.gsub!(/(“|”|")/, '')
        descr.sub!(regexp, '')
        reserved_names = ['private', 'public']
        case_name = "#{enum_case.camel_case_lower}"
        if reserved_names.include?(enum_case)
          case_name = "`#{enum_case.camel_case_lower}`"
        end
        case_value = enum_case
        out.write "#{ONE}case #{case_name} = \"#{case_value}\"\n"
      end
      out.write "#{ONE}case undefined\n"
      out.write "\n"
      out.write "#{ONE}public init(from decoder: Decoder) throws {\n"
      out.write "#{TWO}let value = try decoder.singleValueContainer().decode(String.self)\n"
      out.write "#{TWO}guard let type = #{custom_type_name}(rawValue: value) else {\n"
      out.write "#{THREE}self = .undefined\n"
      out.write "#{THREE}return\n"
      out.write "#{TWO}}\n"
      out.write "#{TWO}self = type\n"
      out.write "#{ONE}}\n"
      out.write "}"
    end
  end
  # Some of the variables have more convenient manually created helper methods,
  # rename the original strings to something else
  def make_getter_name(type_name, var_name, var_type, var_desc)
  	case [type_name, var_name]
  	#when ['Chat', 'type']
  	#    return 'type_string'
  	when ["#{PREFIX_LIB}ChatMember", 'status']
  		return 'status_string'
  	else
  		if var_name == 'type' && var_type == 'String'
  			return 'type_string'
  		elsif var_name.include?('date') && var_desc.include?('Unix time')
  			return var_name + '_unix'
  		end
  		return var_name
  	end
  end

  private def search_cases_for_enum_type_of_variable_with_type_name(var_description)
    var_desc = var_description.clone
    result_types = []
    if var_desc[/must be\s+(.+)/]
      case_name = $1
      result_types << case_name
      return result_types
    end

    while var_desc[/^[\s\S]+?“([^”]+)”/]
      case_name = $1
      result_types << case_name
      var_desc.sub!(/^[\s\S]+?“[^”]+”/, "")
    end
    return result_types
  end

  def convert_type(var_name, var_desc, var_type, type_name, var_optional)
    if var_name == 'type'
      if var_type.upcase == 'String'.upcase
        if !search_cases_for_enum_type_of_variable_with_type_name(var_desc).empty?
          return "#{PREFIX_LIB}#{type_name}Type"
        end
      end
    end
    
    case [var_type, var_optional]
    when ['Integer or String', true]
      return "#{PREFIX_LIB}ChatId?" if var_name.include?('chat_id')
      return 'String?'
    when ['Integer or String', false]
      return "#{PREFIX_LIB}ChatId" if var_name.include?('chat_id')
      return 'String'
    when ['String', true]
      return "String?"
    when ['String', false]
      return "String"
    when ['InputFile or String', true]
      return "#{PREFIX_LIB}FileInfo?"
    when ['InputFile or String', false]
      return "#{PREFIX_LIB}FileInfo"
    when ['Integer', true]
      is64bit = var_name.include?("user_id") || 
                var_name.include?("chat_id") || 
                var_desc.include?("64 bit integer") ||
                (type_name == 'User' && var_name == 'id') ||
                (type_name == 'Chat' && var_name == 'id')
      suffix = is64bit ? '64' : ''
      return "Int#{suffix}?"
    when ['Integer', false]
      is64bit = var_name.include?("user_id") ||
                var_name.include?("chat_id") ||
                var_desc.include?("64 bit integer") ||
                (type_name == 'User' && var_name == 'id') ||
                (type_name == 'Chat' && var_name == 'id')
      suffix = is64bit ? '64' : ''
      return "Int#{suffix}"
    when ['Float number', true], ['Float', true]
      return "Float?"
    when ['Float number', false], ['Float', false]
      return "Float"
    when ['Boolean', true], ['True', true]
      return "Bool?"
    when ['Boolean', false], ['True', false]
      if var_type == 'True'
        return "Bool = true"
      else 
        return "Bool"
      end
    else
      two_d_array_prefix = 'Array of Array of '
      array_prefix = 'Array of '
      if var_type.start_with?(two_d_array_prefix)
        var_type.slice! two_d_array_prefix
        var_type = "#{PREFIX_LIB}#{var_type}" if !swift_type?(var_type)
        # Present optional arrays as empty arrays
        if var_optional
          return "[[#{var_type}]]?"
        else
          return "[[#{var_type}]]"
        end
      elsif var_type.start_with?(array_prefix)
        var_type.slice! array_prefix
        if var_type == 'Integer'
            var_type = 'Int'
        end

        var_type = "#{PREFIX_LIB}#{var_type}" if !swift_type?(var_type)
        # Present optional arrays as empty arrays
        if var_optional
          return "[#{var_type}]?"
        else
          return "[#{var_type}]"
        end
      else
        var_type = "#{PREFIX_LIB}#{var_type}" if !swift_type?(var_type)

        if var_optional
          return "#{var_type}?"
        else
          return "#{var_type}"
        end
      end
    end
  end

  def make_request_parameter(request_name, swift_type_name, var_name, var_type, var_optional, var_desc)
    parameters = ""
    var_desc.each_line do |line|
      parameters << "#{ONE}/// #{line.strip}\n"
    end
    parameters << "#{ONE}public var #{var_name.camel_case_lower}: #{swift_type_name}#{var_optional ? '?' : ''}\n\n"
    return parameters
  end

  def make_request_value(request_name, swift_type_name, var_name, var_type, var_optional, var_desc)
  	return "#{THREE}case #{var_name.camel_case_lower} = \"#{var_name}\"\n"
  end

  def make_init_params(request_name, swift_type_name, var_name, var_type, var_optional, var_desc)
  	optional = var_optional ? "? = nil" : ""
  	return "#{var_name.camel_case_lower}: #{swift_type_name}#{optional}, "
  end

  def make_init_body(request_name, swift_type_name, var_name, var_type, var_optional, var_desc)
  	var_name_cameled = var_name.camel_case_lower
  	return "#{THREE}self.#{var_name_cameled} = #{var_name_cameled}\n"
  end

  def deduce_result_type(description)
    type_name = description[/Returns.+as (.+) on/, 1]
    return type_name unless type_name.nil?
    
    type_name = description[/Returns.+(Array of\s+\w+)/, 1]
    (return type_name) unless type_name.nil?

    type_name = description[/On success, an (.+)s that were sent is returned/, 1]
    return type_name unless type_name.nil?

    type_name = description[/On success, an (array of\s+\w+?)\s.+/, 1]
    (return type_name) unless type_name.nil?

  	type_name = description[/invite link as (.+) on success/, 1]
  	return type_name unless type_name.nil?
  	
  	type_name = description[/(\w+) with the final results is returned/, 1]
  	return type_name unless type_name.nil?
  	
  	type_name = description[/An (.+) objects is returned/, 1]
  	return type_name unless type_name.nil?

  	type_name = description[/returns an (.+) objects/, 1]
  	return type_name unless type_name.nil?
      
    type_name = description[/returns a (\w+) object/, 1]
    return type_name unless type_name.nil?

  	type_name = description[/in form of a (.+) object/, 1]
  	return type_name unless type_name.nil?

  	type_name = description[/, a (.+) object is returned/, 1]
  	return type_name unless type_name.nil?

  	type_name = description[/(\w+) is returned, otherwise True is returned/, 1]
  	return "#{type_name}OrBoolean" unless type_name.nil?

  	type_name = description[/(\w+) is returned/, 1]
  	return type_name unless type_name.nil?

  	type_name = description[/Returns a (.+) object/, 1]
  	return type_name unless type_name.nil?

  	type_name = description[/Returns the uploaded (.+) on success./, 1]
  	return type_name unless type_name.nil?

    type_name = description[/Returns the (.+) of the sent message/, 1]
    return type_name unless type_name.nil?

  	type_name = description[/Returns (.+) on/, 1]
  	return type_name unless type_name.nil?
  	
  	type_name = description[/invite link as (.+) on success/, 1]
  	return type_name unless type_name.nil?

  	return 'Boolean'
  end

  def make_swift_type_name(var_name, var_type)
    array_prefix = 'Array of '
    if var_type[/#{array_prefix}/i]
      var_type.sub!(/#{array_prefix}/i, '')
      var_type.strip!
      return "[#{PREFIX_LIB}InputMedia]" if var_type[/InputMedia/]
      return "[#{make_swift_type_name(var_name, var_type)}]"
    end

    case var_type
    when 'Boolean', 'True'
      return 'Bool'
    when 'Integer'
      if var_name.include?('user_id') || var_name.include?('chat_id')
        return 'Int64'
      else
        return 'Int'
      end
    when 'Float number'
      return 'Float'
    when 'Integer or String'
      return "#{PREFIX_LIB}ChatId" if var_name.include?('chat_id')
      return 'String'
    when 'InputFile or String'
      return "#{PREFIX_LIB}FileInfo"
    when 'InlineKeyboardMarkup or ReplyKeyboardMarkup or ReplyKeyboardRemove or ForceReply'
      return "#{PREFIX_LIB}ReplyMarkup"
    when 'MessageOrBoolean'
      return "#{PREFIX_LIB}MessageOrBool"
    when 'Messages'
      return "[#{PREFIX_LIB}Message]"
    when 'String'
      return "#{PREFIX_LIB}ParseMode" if var_name.include?('parse_mode')
      return 'String'
    end

    if swift_type?(var_type)
      return var_type
    else
      return "#{PREFIX_LIB}#{var_type}"
    end
  end

  def fetch_description(current_node)
  	description = ''
  	while !current_node.nil? && current_node.name != 'table' && current_node.name != 'h4' do
  		text = current_node.text.strip

  		if description.length != 0
  			description += "\n"
  		end
  		description += text
  		current_node = current_node.next_element
  	end
  	return description
  end

  def get_table_node(current_node)
    while !current_node.nil? && current_node.name != 'table' && current_node.name != 'h4' do
      current_node = current_node.next_element
    end
    current_node
  end
end


class String

  def camel_case_lower
    self.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
  end

  def camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map{|e| e.capitalize}.join
  end

  def capitalize_first!
    result = self
    result[0] = result[0].upcase
    return result
  end

  def capitalize_first
    result = self.dup
    result[0] = result[0].upcase
    return result
  end
end

def swift_type?(type_name)
  swift_types = [
    'Int',
    'Int64',
    'Float',
    'String',
    'Bool'
  ]
  swift_types.include?(type_name)
end



class Api

  def main
  	STDOUT.sync = true

    FileUtils.rm_rf("#{API_DIR}/#{METHODS_DIR_NAME}")
    FileUtils.rm_rf("#{API_DIR}/#{MODELS_DIR_NAME}")
		html = File.open(HTML_FILE, "rb").read
		doc = Nokogiri::HTML(html)

		doc.css("br").each { |node| node.replace("\n") }
		
    methods_signatures_for_bot_protocol = []
		doc.search("h4").each do |node|
			title = node.text.strip
			next unless title.split.count == 1

			# These types are complex and created manually:
			next unless ![
        'InputFile'
      ].include?(title)

			kind = (title.chars.first == title.chars.first.upcase) ? :type : :method

			if kind == :type
        write_model_to_file(node)
			else
        method_signature = write_method_to_file(node)
        methods_signatures_for_bot_protocol << method_signature
			end
		end

    write_bot_protocol_to_file(methods_signatures_for_bot_protocol)
    write_chat_member_model_type_to_file()
	end

	puts 'Finished'
end



# START

if $0 == __FILE__
	if File.new(__FILE__).flock(File::LOCK_EX | File::LOCK_NB)
		Api.new.main
	else
		raise 'Another instance of this program is running'
	end
end