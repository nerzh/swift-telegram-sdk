// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the current value of the bot's menu button in a private chat, or the default menu button. Returns MenuButton on success.


/// Parameters container struct for `getChatMenuButton` method
public struct TGGetChatMenuButtonParams: Encodable {

    /// Unique identifier for the target private chat. If not specified, default bot's menu button will be returned
    public var chatId: Int64?

    /// Custom keys for coding/decoding `GetChatMenuButtonParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: Int64? = nil) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to get the current value of the bot's menu button in a private chat, or the default menu button. Returns MenuButton on success.

 SeeAlso Telegram Bot API Reference:
 [GetChatMenuButtonParams](https://core.telegram.org/bots/api#getchatmenubutton)
 
 - Parameters:
     - params: Parameters container, see `GetChatMenuButtonParams` struct
 - Throws: Throws on errors
 - Returns: `TGMenuButton`
 */

    @discardableResult
    func getChatMenuButton(params: TGGetChatMenuButtonParams? = nil) async throws -> TGMenuButton {
        guard let methodURL: URL = .init(string: getMethodURL("getChatMenuButton")) else {
            throw BotError("Bad URL: \(getMethodURL("getChatMenuButton"))")
        }
        let result: TGMenuButton = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
