// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Marks incoming message as read on behalf of a business account. Requires the can_read_messages business bot right. Returns True on success.


/// Parameters container struct for `readBusinessMessage` method
public struct TGReadBusinessMessageParams: Encodable {

    /// Unique identifier of the business connection on behalf of which to read the message
    public var businessConnectionId: String

    /// Unique identifier of the chat in which the message was received. The chat must have been active in the last 24 hours.
    public var chatId: Int64

    /// Unique identifier of the message to mark as read
    public var messageId: Int

    /// Custom keys for coding/decoding `ReadBusinessMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
    }

    public init(businessConnectionId: String, chatId: Int64, messageId: Int) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
    }
}


public extension TGBot {

/**
 Marks incoming message as read on behalf of a business account. Requires the can_read_messages business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [ReadBusinessMessageParams](https://core.telegram.org/bots/api#readbusinessmessage)
 
 - Parameters:
     - params: Parameters container, see `ReadBusinessMessageParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func readBusinessMessage(params: TGReadBusinessMessageParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("readBusinessMessage")) else {
            throw BotError("Bad URL: \(getMethodURL("readBusinessMessage"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
