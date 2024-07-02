// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents changes in the status of a chat member.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberUpdated](https://core.telegram.org/bots/api#chatmemberupdated)
 **/
public final class TGChatMemberUpdated: Codable {

    /// Custom keys for coding/decoding `ChatMemberUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case from = "from"
        case date = "date"
        case oldChatMember = "old_chat_member"
        case newChatMember = "new_chat_member"
        case inviteLink = "invite_link"
        case viaJoinRequest = "via_join_request"
        case viaChatFolderInviteLink = "via_chat_folder_invite_link"
    }

    /// Chat the user belongs to
    public var chat: TGChat

    /// Performer of the action, which resulted in the change
    public var from: TGUser

    /// Date the change was done in Unix time
    public var date: Int

    /// Previous information about the chat member
    public var oldChatMember: TGChatMember

    /// New information about the chat member
    public var newChatMember: TGChatMember

    /// Optional. Chat invite link, which was used by the user to join the chat; for joining by invite link events only.
    public var inviteLink: TGChatInviteLink?

    /// Optional. True, if the user joined the chat after sending a direct join request without using an invite link and being approved by an administrator
    public var viaJoinRequest: Bool?

    /// Optional. True, if the user joined the chat via a chat folder invite link
    public var viaChatFolderInviteLink: Bool?

    public init (chat: TGChat, from: TGUser, date: Int, oldChatMember: TGChatMember, newChatMember: TGChatMember, inviteLink: TGChatInviteLink? = nil, viaJoinRequest: Bool? = nil, viaChatFolderInviteLink: Bool? = nil) {
        self.chat = chat
        self.from = from
        self.date = date
        self.oldChatMember = oldChatMember
        self.newChatMember = newChatMember
        self.inviteLink = inviteLink
        self.viaJoinRequest = viaJoinRequest
        self.viaChatFolderInviteLink = viaChatFolderInviteLink
    }
}
