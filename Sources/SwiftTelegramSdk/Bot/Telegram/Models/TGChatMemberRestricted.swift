// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that is under certain restrictions in the chat. Supergroups only.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberRestricted](https://core.telegram.org/bots/api#chatmemberrestricted)
 **/
public final class TGChatMemberRestricted: Codable {

    /// Custom keys for coding/decoding `ChatMemberRestricted` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
        case isMember = "is_member"
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
        case untilDate = "until_date"
    }

    /// The member's status in the chat, always “restricted”
    public var status: String

    /// Information about the user
    public var user: TGUser

    /// True, if the user is a member of the chat at the moment of the request
    public var isMember: Bool

    /// True, if the user is allowed to send text messages, contacts, giveaways, giveaway winners, invoices, locations and venues
    public var canSendMessages: Bool

    /// True, if the user is allowed to send audios
    public var canSendAudios: Bool

    /// True, if the user is allowed to send documents
    public var canSendDocuments: Bool

    /// True, if the user is allowed to send photos
    public var canSendPhotos: Bool

    /// True, if the user is allowed to send videos
    public var canSendVideos: Bool

    /// True, if the user is allowed to send video notes
    public var canSendVideoNotes: Bool

    /// True, if the user is allowed to send voice notes
    public var canSendVoiceNotes: Bool

    /// True, if the user is allowed to send polls
    public var canSendPolls: Bool

    /// True, if the user is allowed to send animations, games, stickers and use inline bots
    public var canSendOtherMessages: Bool

    /// True, if the user is allowed to add web page previews to their messages
    public var canAddWebPagePreviews: Bool

    /// True, if the user is allowed to change the chat title, photo and other settings
    public var canChangeInfo: Bool

    /// True, if the user is allowed to invite new users to the chat
    public var canInviteUsers: Bool

    /// True, if the user is allowed to pin messages
    public var canPinMessages: Bool

    /// True, if the user is allowed to create forum topics
    public var canManageTopics: Bool

    /// Date when restrictions will be lifted for this user; Unix time. If 0, then the user is restricted forever
    public var untilDate: Int

    public init (status: String, user: TGUser, isMember: Bool, canSendMessages: Bool, canSendAudios: Bool, canSendDocuments: Bool, canSendPhotos: Bool, canSendVideos: Bool, canSendVideoNotes: Bool, canSendVoiceNotes: Bool, canSendPolls: Bool, canSendOtherMessages: Bool, canAddWebPagePreviews: Bool, canChangeInfo: Bool, canInviteUsers: Bool, canPinMessages: Bool, canManageTopics: Bool, untilDate: Int) {
        self.status = status
        self.user = user
        self.isMember = isMember
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
        self.untilDate = untilDate
    }
}
