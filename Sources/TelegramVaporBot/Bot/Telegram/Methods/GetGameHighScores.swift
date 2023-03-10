// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.
/// This method will currently return scores for the target user, plus two of their closest neighbors on each side. Will also return the top three users if the user and their neighbors are not among them. Please note that this behavior is subject to change.


/// Parameters container struct for `getGameHighScores` method
public struct TGGetGameHighScoresParams: Encodable {

    /// Target user id
    public var userId: Int64

    /// Required if inline_message_id is not specified. Unique identifier for the target chat
    public var chatId: Int64?

    /// Required if inline_message_id is not specified. Identifier of the sent message
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public var inlineMessageId: String?

    /// Custom keys for coding/decoding `GetGameHighScoresParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
    }

    public init(userId: Int64, chatId: Int64? = nil, messageId: Int? = nil, inlineMessageId: String? = nil) {
            self.userId = userId
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
    }
}


public extension TGBot {

/**
 Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.
 This method will currently return scores for the target user, plus two of their closest neighbors on each side. Will also return the top three users if the user and their neighbors are not among them. Please note that this behavior is subject to change.

 SeeAlso Telegram Bot API Reference:
 [GetGameHighScoresParams](https://core.telegram.org/bots/api#getgamehighscores)
 
 - Parameters:
     - params: Parameters container, see `GetGameHighScoresParams` struct
 - Throws: Throws on errors
 - Returns: `[TGGameHighScore]`
 */

    @discardableResult
    func getGameHighScores(params: TGGetGameHighScoresParams) async throws -> [TGGameHighScore] {
        let methodURL: URI = .init(string: getMethodURL("getGameHighScores"))
        let result: [TGGameHighScore] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
