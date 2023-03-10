// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the rights of an administrator in a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatAdministratorRights](https://core.telegram.org/bots/api#chatadministratorrights)
 */
public final class TGChatAdministratorRights: Codable {

    /// Custom keys for coding/decoding `ChatAdministratorRights` struct
    public enum CodingKeys: String, CodingKey {
        case isAnonymous = "is_anonymous"
        case canManageChat = "can_manage_chat"
        case canDeleteMessages = "can_delete_messages"
        case canManageVideoChats = "can_manage_video_chats"
        case canRestrictMembers = "can_restrict_members"
        case canPromoteMembers = "can_promote_members"
        case canChangeInfo = "can_change_info"
        case canInviteUsers = "can_invite_users"
        case canPostMessages = "can_post_messages"
        case canEditMessages = "can_edit_messages"
        case canPinMessages = "can_pin_messages"
        case canManageTopics = "can_manage_topics"
    }

    /// True, if the user's presence in the chat is hidden
    public var isAnonymous: Bool

    /// True, if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other administrator privilege
    public var canManageChat: Bool

    /// True, if the administrator can delete messages of other users
    public var canDeleteMessages: Bool

    /// True, if the administrator can manage video chats
    public var canManageVideoChats: Bool

    /// True, if the administrator can restrict, ban or unban chat members
    public var canRestrictMembers: Bool

    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    public var canPromoteMembers: Bool

    /// True, if the user is allowed to change the chat title, photo and other settings
    public var canChangeInfo: Bool

    /// True, if the user is allowed to invite new users to the chat
    public var canInviteUsers: Bool

    /// Optional. True, if the administrator can post in the channel; channels only
    public var canPostMessages: Bool?

    /// Optional. True, if the administrator can edit messages of other users and can pin messages; channels only
    public var canEditMessages: Bool?

    /// Optional. True, if the user is allowed to pin messages; groups and supergroups only
    public var canPinMessages: Bool?

    /// Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
    public var canManageTopics: Bool?

    public init (isAnonymous: Bool, canManageChat: Bool, canDeleteMessages: Bool, canManageVideoChats: Bool, canRestrictMembers: Bool, canPromoteMembers: Bool, canChangeInfo: Bool, canInviteUsers: Bool, canPostMessages: Bool? = nil, canEditMessages: Bool? = nil, canPinMessages: Bool? = nil, canManageTopics: Bool? = nil) {
        self.isAnonymous = isAnonymous
        self.canManageChat = canManageChat
        self.canDeleteMessages = canDeleteMessages
        self.canManageVideoChats = canManageVideoChats
        self.canRestrictMembers = canRestrictMembers
        self.canPromoteMembers = canPromoteMembers
        self.canChangeInfo = canChangeInfo
        self.canInviteUsers = canInviteUsers
        self.canPostMessages = canPostMessages
        self.canEditMessages = canEditMessages
        self.canPinMessages = canPinMessages
        self.canManageTopics = canManageTopics
    }
}
