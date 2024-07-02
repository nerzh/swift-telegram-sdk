// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get up-to-date information about the chat. Returns a ChatFullInfo object on success.


/// Parameters container struct for `getChat` method
public struct TGGetChatParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `GetChatParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to get up-to-date information about the chat. Returns a ChatFullInfo object on success.

 SeeAlso Telegram Bot API Reference:
 [GetChatParams](https://core.telegram.org/bots/api#getchat)
 
 - Parameters:
     - params: Parameters container, see `GetChatParams` struct
 - Throws: Throws on errors
 - Returns: `TGChatFullInfo`
 */

    @discardableResult
    func getChat(params: TGGetChatParams) async throws -> TGChatFullInfo {
        guard let methodURL: URL = .init(string: getMethodURL("getChat")) else {
            throw BotError("Bad URL: \(getMethodURL("getChat"))")
        }
        let result: TGChatFullInfo = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
