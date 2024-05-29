// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to an article or web page.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultArticle](https://core.telegram.org/bots/api#inlinequeryresultarticle)
 */

public enum TGInlineQueryResultArticleType: String, Codable {
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultArticleType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}