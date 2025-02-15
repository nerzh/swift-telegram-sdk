// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Removes verification from a chat that is currently verified on behalf of the organization represented by the bot. Returns True on success.


/// Parameters container struct for `removeChatVerification` method
public struct TGRemoveChatVerificationParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `RemoveChatVerificationParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Removes verification from a chat that is currently verified on behalf of the organization represented by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [RemoveChatVerificationParams](https://core.telegram.org/bots/api#removechatverification)
 
 - Parameters:
     - params: Parameters container, see `RemoveChatVerificationParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func removeChatVerification(params: TGRemoveChatVerificationParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("removeChatVerification")) else {
            throw BotError("Bad URL: \(getMethodURL("removeChatVerification"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
