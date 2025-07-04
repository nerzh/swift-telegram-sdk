// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a task to add to a checklist.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#inputchecklisttask)
 */

public final class TGInputChecklistTask: Codable {
    public enum CodingKeys: String, CodingKey {
        case id
        case text
        case parseMode = "parse_mode"
        case textEntities = "text_entities"
    }

    /// Unique identifier of the task; must be positive and unique among all task identifiers currently present in the checklist
    public var id: Int64
    
    /// Text of the task; 1-100 characters after entities parsing
    public var text: String
    
    /// Optional. Mode for parsing entities in the text. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// Optional. List of special entities that appear in the text, which can be specified instead of parse_mode. Currently, only bold, italic, underline, strikethrough, spoiler, and custom_emoji entities are allowed.
    public var textEntities: [TGMessageEntity]?

    init(id: Int64, text: String, parseMode: TGParseMode? = nil, textEntities: [TGMessageEntity]? = nil) {
        self.id = id
        self.text = text
        self.parseMode = parseMode
        self.textEntities = textEntities
    }
}
