// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an MP3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultAudio](https://core.telegram.org/bots/api#inlinequeryresultaudio)
 */

public enum TGInlineQueryResultAudioType: String, Codable {
    case audio = "audio"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultAudioType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}