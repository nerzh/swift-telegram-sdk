// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to change the chosen reactions on a message. Service messages can't be reacted to. Automatically forwarded messages from a channel to its discussion group have the same available reactions as messages in the channel. Returns True on success.


/// Parameters container struct for `setMessageReaction` method
public struct TGSetMessageReactionParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Identifier of the target message. If the message belongs to a media group, the reaction is set to the first non-deleted message in the group instead.
    public var messageId: Int

    /// New list of reaction types to set on the message. Currently, as non-premium users, bots can set up to one reaction per message. A custom emoji reaction can be used if it is either already present on the message or explicitly allowed by chat administrators.
    public var reaction: [TGReactionType]?

    /// Pass True to set the reaction with a big animation
    public var isBig: Bool?

    /// Custom keys for coding/decoding `SetMessageReactionParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case reaction = "reaction"
            case isBig = "is_big"
    }

    public init(chatId: TGChatId, messageId: Int, reaction: [TGReactionType]? = nil, isBig: Bool? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.reaction = reaction
            self.isBig = isBig
    }
}


public extension TGBot {

/**
 Use this method to change the chosen reactions on a message. Service messages can't be reacted to. Automatically forwarded messages from a channel to its discussion group have the same available reactions as messages in the channel. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetMessageReactionParams](https://core.telegram.org/bots/api#setmessagereaction)
 
 - Parameters:
     - params: Parameters container, see `SetMessageReactionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setMessageReaction(params: TGSetMessageReactionParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setMessageReaction"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
