// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Delete messages on behalf of a business account. Requires the can_delete_outgoing_messages business bot right to delete messages sent by the bot itself, or the can_delete_all_messages business bot right to delete any message. Returns True on success.


/// Parameters container struct for `deleteBusinessMessages` method
public struct TGDeleteBusinessMessagesParams: Encodable {

    /// Unique identifier of the business connection on behalf of which to delete the messages
    public var businessConnectionId: String

    /// A JSON-serialized list of 1-100 identifiers of messages to delete. All messages must be from the same chat. See deleteMessage for limitations on which messages can be deleted
    public var messageIds: [Int]

    /// Custom keys for coding/decoding `DeleteBusinessMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case messageIds = "message_ids"
    }

    public init(businessConnectionId: String, messageIds: [Int]) {
            self.businessConnectionId = businessConnectionId
            self.messageIds = messageIds
    }
}


public extension TGBot {

/**
 Delete messages on behalf of a business account. Requires the can_delete_outgoing_messages business bot right to delete messages sent by the bot itself, or the can_delete_all_messages business bot right to delete any message. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteBusinessMessagesParams](https://core.telegram.org/bots/api#deletebusinessmessages)
 
 - Parameters:
     - params: Parameters container, see `DeleteBusinessMessagesParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteBusinessMessages(params: TGDeleteBusinessMessagesParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteBusinessMessages")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteBusinessMessages"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
