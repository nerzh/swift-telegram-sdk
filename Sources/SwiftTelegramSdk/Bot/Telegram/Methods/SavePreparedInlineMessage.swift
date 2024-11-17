// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Stores a message that can be sent by a user of a Mini App. Returns a PreparedInlineMessage object.


/// Parameters container struct for `savePreparedInlineMessage` method
public struct TGSavePreparedInlineMessageParams: Encodable {

    /// Unique identifier of the target user that can use the prepared message
    public var userId: Int64

    /// A JSON-serialized object describing the message to be sent
    public var result: TGInlineQueryResult

    /// Pass True if the message can be sent to private chats with users
    public var allowUserChats: Bool?

    /// Pass True if the message can be sent to private chats with bots
    public var allowBotChats: Bool?

    /// Pass True if the message can be sent to group and supergroup chats
    public var allowGroupChats: Bool?

    /// Pass True if the message can be sent to channel chats
    public var allowChannelChats: Bool?

    /// Custom keys for coding/decoding `SavePreparedInlineMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case result = "result"
            case allowUserChats = "allow_user_chats"
            case allowBotChats = "allow_bot_chats"
            case allowGroupChats = "allow_group_chats"
            case allowChannelChats = "allow_channel_chats"
    }

    public init(userId: Int64, result: TGInlineQueryResult, allowUserChats: Bool? = nil, allowBotChats: Bool? = nil, allowGroupChats: Bool? = nil, allowChannelChats: Bool? = nil) {
            self.userId = userId
            self.result = result
            self.allowUserChats = allowUserChats
            self.allowBotChats = allowBotChats
            self.allowGroupChats = allowGroupChats
            self.allowChannelChats = allowChannelChats
    }
}


public extension TGBot {

/**
 Stores a message that can be sent by a user of a Mini App. Returns a PreparedInlineMessage object.

 SeeAlso Telegram Bot API Reference:
 [SavePreparedInlineMessageParams](https://core.telegram.org/bots/api#savepreparedinlinemessage)
 
 - Parameters:
     - params: Parameters container, see `SavePreparedInlineMessageParams` struct
 - Throws: Throws on errors
 - Returns: `TGPreparedInlineMessage`
 */

    @discardableResult
    func savePreparedInlineMessage(params: TGSavePreparedInlineMessageParams) async throws -> TGPreparedInlineMessage {
        guard let methodURL: URL = .init(string: getMethodURL("savePreparedInlineMessage")) else {
            throw BotError("Bad URL: \(getMethodURL("savePreparedInlineMessage"))")
        }
        let result: TGPreparedInlineMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
