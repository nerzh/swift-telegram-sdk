// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The message was originally sent by an unknown user.

 SeeAlso Telegram Bot API Reference:
 [MessageOriginHiddenUser](https://core.telegram.org/bots/api#messageoriginhiddenuser)
 */

public enum TGMessageOriginHiddenUserType: String, Codable {
    case hiddenUser = "hidden_user"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGMessageOriginHiddenUserType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}