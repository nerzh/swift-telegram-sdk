// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An animated profile photo in the MPEG4 format.

 SeeAlso Telegram Bot API Reference:
 [InputProfilePhotoAnimated](https://core.telegram.org/bots/api#inputprofilephotoanimated)
 */

public enum TGInputProfilePhotoAnimatedType: String, Codable {
    case animated = "animated"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputProfilePhotoAnimatedType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}