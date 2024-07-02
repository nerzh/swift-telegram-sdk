// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an audio file to be treated as music to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaAudio](https://core.telegram.org/bots/api#inputmediaaudio)
 */

public enum TGInputMediaAudioType: String, Codable {
    case audio = "audio"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaAudioType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}