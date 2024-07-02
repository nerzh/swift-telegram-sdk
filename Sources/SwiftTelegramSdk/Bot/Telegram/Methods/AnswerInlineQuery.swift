// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send answers to an inline query. On success, True is returned.
/// No more than 50 results per query are allowed.


/// Parameters container struct for `answerInlineQuery` method
public struct TGAnswerInlineQueryParams: Encodable {

    /// Unique identifier for the answered query
    public var inlineQueryId: String

    /// A JSON-serialized array of results for the inline query
    public var results: [TGInlineQueryResult]

    /// The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
    public var cacheTime: Int?

    /// Pass True if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query.
    public var isPersonal: Bool?

    /// Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don't support pagination. Offset length can't exceed 64 bytes.
    public var nextOffset: String?

    /// A JSON-serialized object describing a button to be shown above inline query results
    public var button: TGInlineQueryResultsButton?

    /// Custom keys for coding/decoding `AnswerInlineQueryParams` struct
    public enum CodingKeys: String, CodingKey {
            case inlineQueryId = "inline_query_id"
            case results = "results"
            case cacheTime = "cache_time"
            case isPersonal = "is_personal"
            case nextOffset = "next_offset"
            case button = "button"
    }

    public init(inlineQueryId: String, results: [TGInlineQueryResult], cacheTime: Int? = nil, isPersonal: Bool? = nil, nextOffset: String? = nil, button: TGInlineQueryResultsButton? = nil) {
            self.inlineQueryId = inlineQueryId
            self.results = results
            self.cacheTime = cacheTime
            self.isPersonal = isPersonal
            self.nextOffset = nextOffset
            self.button = button
    }
}


public extension TGBot {

/**
 Use this method to send answers to an inline query. On success, True is returned.
 No more than 50 results per query are allowed.

 SeeAlso Telegram Bot API Reference:
 [AnswerInlineQueryParams](https://core.telegram.org/bots/api#answerinlinequery)
 
 - Parameters:
     - params: Parameters container, see `AnswerInlineQueryParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func answerInlineQuery(params: TGAnswerInlineQueryParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("answerInlineQuery")) else {
            throw BotError("Bad URL: \(getMethodURL("answerInlineQuery"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
