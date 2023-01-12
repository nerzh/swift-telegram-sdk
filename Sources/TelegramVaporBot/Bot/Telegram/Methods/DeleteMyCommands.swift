// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success.


/// Parameters container struct for `deleteMyCommands` method
public struct TGDeleteMyCommandsParams: Encodable {

    /// A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    public var scope: TGBotCommandScope?

    /// A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands
    public var languageCode: String?

    /// Custom keys for coding/decoding `DeleteMyCommandsParams` struct
    public enum CodingKeys: String, CodingKey {
            case scope = "scope"
            case languageCode = "language_code"
    }

    public init(scope: TGBotCommandScope? = nil, languageCode: String? = nil) {
            self.scope = scope
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteMyCommandsParams](https://core.telegram.org/bots/api#deletemycommands)
 
 - Parameters:
     - params: Parameters container, see `DeleteMyCommandsParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func deleteMyCommands(params: TGDeleteMyCommandsParams? = nil) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("deleteMyCommands"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
