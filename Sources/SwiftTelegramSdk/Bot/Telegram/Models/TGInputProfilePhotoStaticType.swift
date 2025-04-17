// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A static profile photo in the .JPG format.

 SeeAlso Telegram Bot API Reference:
 [InputProfilePhotoStatic](https://core.telegram.org/bots/api#inputprofilephotostatic)
 */

public enum TGInputProfilePhotoStaticType: String, Codable {
    case `static` = "static"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputProfilePhotoStaticType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}