// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a service message about new members invited to a video chat.

 SeeAlso Telegram Bot API Reference:
 [VideoChatParticipantsInvited](https://core.telegram.org/bots/api#videochatparticipantsinvited)
 */
public final class TGVideoChatParticipantsInvited: Codable {

    /// Custom keys for coding/decoding `VideoChatParticipantsInvited` struct
    public enum CodingKeys: String, CodingKey {
        case users = "users"
    }

    /// New members that were invited to the video chat
    public var users: [TGUser]

    public init (users: [TGUser]) {
        self.users = users
    }
}
