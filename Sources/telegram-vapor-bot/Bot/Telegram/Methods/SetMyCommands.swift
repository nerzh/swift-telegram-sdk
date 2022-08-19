// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to change the list of the bot's commands. See https://core.telegram.org/bots#commands for more details about bot commands. Returns True on success.


/// Parameters container struct for `setMyCommands` method
public struct TGSetMyCommandsParams: Encodable {

    /// A JSON-serialized list of bot commands to be set as the list of the bot's commands. At most 100 commands can be specified.
    public var commands: [TGBotCommand]

    /// A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    public var scope: TGBotCommandScope?

    /// A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands
    public var languageCode: String?

    /// Custom keys for coding/decoding `SetMyCommandsParams` struct
    public enum CodingKeys: String, CodingKey {
            case commands = "commands"
            case scope = "scope"
            case languageCode = "language_code"
    }

    public init(commands: [TGBotCommand], scope: TGBotCommandScope? = nil, languageCode: String? = nil) {
            self.commands = commands
            self.scope = scope
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to change the list of the bot's commands. See https://core.telegram.org/bots#commands for more details about bot commands. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetMyCommandsParams](https://core.telegram.org/bots/api#setmycommands)
 
 - Parameters:
     - params: Parameters container, see `SetMyCommandsParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func setMyCommands(params: TGSetMyCommandsParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setMyCommands"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
