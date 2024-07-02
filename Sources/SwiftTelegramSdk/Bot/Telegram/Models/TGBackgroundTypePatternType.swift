// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a PNG or TGV (gzipped subset of SVG with MIME type “application/x-tgwallpattern”) pattern to be combined with the background fill chosen by the user.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypePattern](https://core.telegram.org/bots/api#backgroundtypepattern)
 */

public enum TGBackgroundTypePatternType: String, Codable {
    case pattern = "pattern"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBackgroundTypePatternType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}