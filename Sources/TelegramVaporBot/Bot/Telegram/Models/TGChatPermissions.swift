// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes actions that a non-administrator user is allowed to take in a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatPermissions](https://core.telegram.org/bots/api#chatpermissions)
 */
public final class TGChatPermissions: Codable {

    /// Custom keys for coding/decoding `ChatPermissions` struct
    public enum CodingKeys: String, CodingKey {
        case canSendMessages = "can_send_messages"
        case canSendAudios = "can_send_audios"
        case canSendDocuments = "can_send_documents"
        case canSendPhotos = "can_send_photos"
        case canSendVideos = "can_send_videos"
        case canSendVideoNotes = "can_send_video_notes"
        case canSendVoiceNotes = "can_send_voice_notes"
        case canSendPolls = "can_send_polls"
        case canSendOtherMessages = "can_send_other_messages"
        case canAddWebPagePreviews = "can_add_web_page_previews"
        case canChangeInfo = "can_change_info"
        case canInviteUsers = "can_invite_users"
        case canPinMessages = "can_pin_messages"
        case canManageTopics = "can_manage_topics"
    }

    /// Optional. True, if the user is allowed to send text messages, contacts, invoices, locations and venues
    public var canSendMessages: Bool?

    /// Optional. True, if the user is allowed to send audios
    public var canSendAudios: Bool?

    /// Optional. True, if the user is allowed to send documents
    public var canSendDocuments: Bool?

    /// Optional. True, if the user is allowed to send photos
    public var canSendPhotos: Bool?

    /// Optional. True, if the user is allowed to send videos
    public var canSendVideos: Bool?

    /// Optional. True, if the user is allowed to send video notes
    public var canSendVideoNotes: Bool?

    /// Optional. True, if the user is allowed to send voice notes
    public var canSendVoiceNotes: Bool?

    /// Optional. True, if the user is allowed to send polls
    public var canSendPolls: Bool?

    /// Optional. True, if the user is allowed to send animations, games, stickers and use inline bots
    public var canSendOtherMessages: Bool?

    /// Optional. True, if the user is allowed to add web page previews to their messages
    public var canAddWebPagePreviews: Bool?

    /// Optional. True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
    public var canChangeInfo: Bool?

    /// Optional. True, if the user is allowed to invite new users to the chat
    public var canInviteUsers: Bool?

    /// Optional. True, if the user is allowed to pin messages. Ignored in public supergroups
    public var canPinMessages: Bool?

    /// Optional. True, if the user is allowed to create forum topics. If omitted defaults to the value of can_pin_messages
    public var canManageTopics: Bool?

    public init (canSendMessages: Bool? = nil, canSendAudios: Bool? = nil, canSendDocuments: Bool? = nil, canSendPhotos: Bool? = nil, canSendVideos: Bool? = nil, canSendVideoNotes: Bool? = nil, canSendVoiceNotes: Bool? = nil, canSendPolls: Bool? = nil, canSendOtherMessages: Bool? = nil, canAddWebPagePreviews: Bool? = nil, canChangeInfo: Bool? = nil, canInviteUsers: Bool? = nil, canPinMessages: Bool? = nil, canManageTopics: Bool? = nil) {
        self.canSendMessages = canSendMessages
        self.canSendAudios = canSendAudios
        self.canSendDocuments = canSendDocuments
        self.canSendPhotos = canSendPhotos
        self.canSendVideos = canSendVideos
        self.canSendVideoNotes = canSendVideoNotes
        self.canSendVoiceNotes = canSendVoiceNotes
        self.canSendPolls = canSendPolls
        self.canSendOtherMessages = canSendOtherMessages
        self.canAddWebPagePreviews = canAddWebPagePreviews
        self.canChangeInfo = canChangeInfo
        self.canInviteUsers = canInviteUsers
        self.canPinMessages = canPinMessages
        self.canManageTopics = canManageTopics
    }
}
