// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The message was originally sent by a known user.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginUser](https://core.telegram.org/bots/api#messageoriginuser)
 */

public enum TGMessageOriginUserType: String, Codable {
    case user = "user"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMessageOriginUserType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}