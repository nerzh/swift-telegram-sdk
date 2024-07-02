// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the current list of the bot's commands for the given scope and user language. Returns an Array of BotCommand objects. If commands aren't set, an empty list is returned.


/// Parameters container struct for `getMyCommands` method
public struct TGGetMyCommandsParams: Encodable {

    /// A JSON-serialized object, describing scope of users. Defaults to BotCommandScopeDefault.
    public var scope: TGBotCommandScope?

    /// A two-letter ISO 639-1 language code or an empty string
    public var languageCode: String?

    /// Custom keys for coding/decoding `GetMyCommandsParams` struct
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
 Use this method to get the current list of the bot's commands for the given scope and user language. Returns an Array of BotCommand objects. If commands aren't set, an empty list is returned.

 SeeAlso Telegram Bot API Reference:
 [GetMyCommandsParams](https://core.telegram.org/bots/api#getmycommands)
 
 - Parameters:
     - params: Parameters container, see `GetMyCommandsParams` struct
 - Throws: Throws on errors
 - Returns: `[TGBotCommand]`
 */

    @discardableResult
    func getMyCommands(params: TGGetMyCommandsParams? = nil) async throws -> [TGBotCommand] {
        guard let methodURL: URL = .init(string: getMethodURL("getMyCommands")) else {
            throw BotError("Bad URL: \(getMethodURL("getMyCommands"))")
        }
        let result: [TGBotCommand] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
