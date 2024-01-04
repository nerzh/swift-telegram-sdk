// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send a native poll. On success, the sent Message is returned.


/// Parameters container struct for `sendPoll` method
public struct TGSendPollParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Poll question, 1-300 characters
    public var question: String

    /// A JSON-serialized list of answer options, 2-10 strings 1-100 characters each
    public var options: [String]

    /// True, if the poll needs to be anonymous, defaults to True
    public var isAnonymous: Bool?

    /// Poll type, “quiz” or “regular”, defaults to “regular”
    public var type: String?

    /// True, if the poll allows multiple answers, ignored for polls in quiz mode, defaults to False
    public var allowsMultipleAnswers: Bool?

    /// 0-based identifier of the correct answer option, required for polls in quiz mode
    public var correctOptionId: Int?

    /// Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters with at most 2 line feeds after entities parsing
    public var explanation: String?

    /// Mode for parsing entities in the explanation. See formatting options for more details.
    public var explanationParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the poll explanation, which can be specified instead of parse_mode
    public var explanationEntities: [TGMessageEntity]?

    /// Amount of time in seconds the poll will be active after creation, 5-600. Can't be used together with close_date.
    public var openPeriod: Int?

    /// Point in time (Unix timestamp) when the poll will be automatically closed. Must be at least 5 and no more than 600 seconds in the future. Can't be used together with open_period.
    public var closeDate: Int?

    /// Pass True if the poll needs to be immediately closed. This can be useful for poll preview.
    public var isClosed: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// Description of the message to reply to
    public var replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendPollParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case question = "question"
            case options = "options"
            case isAnonymous = "is_anonymous"
            case type = "type"
            case allowsMultipleAnswers = "allows_multiple_answers"
            case correctOptionId = "correct_option_id"
            case explanation = "explanation"
            case explanationParseMode = "explanation_parse_mode"
            case explanationEntities = "explanation_entities"
            case openPeriod = "open_period"
            case closeDate = "close_date"
            case isClosed = "is_closed"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, question: String, options: [String], isAnonymous: Bool? = nil, type: String? = nil, allowsMultipleAnswers: Bool? = nil, correctOptionId: Int? = nil, explanation: String? = nil, explanationParseMode: TGParseMode? = nil, explanationEntities: [TGMessageEntity]? = nil, openPeriod: Int? = nil, closeDate: Int? = nil, isClosed: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.question = question
            self.options = options
            self.isAnonymous = isAnonymous
            self.type = type
            self.allowsMultipleAnswers = allowsMultipleAnswers
            self.correctOptionId = correctOptionId
            self.explanation = explanation
            self.explanationParseMode = explanationParseMode
            self.explanationEntities = explanationEntities
            self.openPeriod = openPeriod
            self.closeDate = closeDate
            self.isClosed = isClosed
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send a native poll. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendPollParams](https://core.telegram.org/bots/api#sendpoll)
 
 - Parameters:
     - params: Parameters container, see `SendPollParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendPoll(params: TGSendPollParams) async throws -> TGMessage {
        let methodURL: URI = .init(string: getMethodURL("sendPoll"))
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
