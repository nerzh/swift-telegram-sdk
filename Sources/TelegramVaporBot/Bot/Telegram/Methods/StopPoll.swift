// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.


/// Parameters container struct for `stopPoll` method
public struct TGStopPollParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Identifier of the original message with the poll
    public var messageId: Int

    /// A JSON-serialized object for a new message inline keyboard.
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `StopPollParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageId: Int, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.

 SeeAlso Telegram Bot API Reference:
 [StopPollParams](https://core.telegram.org/bots/api#stoppoll)
 
 - Parameters:
     - params: Parameters container, see `StopPollParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGPoll` type
 */

    @discardableResult
    func stopPoll(params: TGStopPollParams) async throws -> TGPoll {
        let methodURL: URI = .init(string: getMethodURL("stopPoll"))
        let result: TGPoll = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
