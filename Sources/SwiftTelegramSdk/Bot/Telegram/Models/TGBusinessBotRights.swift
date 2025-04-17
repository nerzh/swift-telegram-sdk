// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the rights of a business bot.

 SeeAlso Telegram Bot API Reference:
 [BusinessBotRights](https://core.telegram.org/bots/api#businessbotrights)
 **/
public final class TGBusinessBotRights: Codable {

    /// Custom keys for coding/decoding `BusinessBotRights` struct
    public enum CodingKeys: String, CodingKey {
        case canReply = "can_reply"
        case canReadMessages = "can_read_messages"
        case canDeleteOutgoingMessages = "can_delete_outgoing_messages"
        case canDeleteAllMessages = "can_delete_all_messages"
        case canEditName = "can_edit_name"
        case canEditBio = "can_edit_bio"
        case canEditProfilePhoto = "can_edit_profile_photo"
        case canEditUsername = "can_edit_username"
        case canChangeGiftSettings = "can_change_gift_settings"
        case canViewGiftsAndStars = "can_view_gifts_and_stars"
        case canConvertGiftsToStars = "can_convert_gifts_to_stars"
        case canTransferAndUpgradeGifts = "can_transfer_and_upgrade_gifts"
        case canTransferStars = "can_transfer_stars"
        case canManageStories = "can_manage_stories"
    }

    /// Optional. True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours
    public var canReply: Bool?

    /// Optional. True, if the bot can mark incoming private messages as read
    public var canReadMessages: Bool?

    /// Optional. True, if the bot can delete messages sent by the bot
    public var canDeleteOutgoingMessages: Bool?

    /// Optional. True, if the bot can delete all private messages in managed chats
    public var canDeleteAllMessages: Bool?

    /// Optional. True, if the bot can edit the first and last name of the business account
    public var canEditName: Bool?

    /// Optional. True, if the bot can edit the bio of the business account
    public var canEditBio: Bool?

    /// Optional. True, if the bot can edit the profile photo of the business account
    public var canEditProfilePhoto: Bool?

    /// Optional. True, if the bot can edit the username of the business account
    public var canEditUsername: Bool?

    /// Optional. True, if the bot can change the privacy settings pertaining to gifts for the business account
    public var canChangeGiftSettings: Bool?

    /// Optional. True, if the bot can view gifts and the amount of Telegram Stars owned by the business account
    public var canViewGiftsAndStars: Bool?

    /// Optional. True, if the bot can convert regular gifts owned by the business account to Telegram Stars
    public var canConvertGiftsToStars: Bool?

    /// Optional. True, if the bot can transfer and upgrade gifts owned by the business account
    public var canTransferAndUpgradeGifts: Bool?

    /// Optional. True, if the bot can transfer Telegram Stars received by the business account to its own account, or use them to upgrade and transfer gifts
    public var canTransferStars: Bool?

    /// Optional. True, if the bot can post, edit and delete stories on behalf of the business account
    public var canManageStories: Bool?

    public init (canReply: Bool? = nil, canReadMessages: Bool? = nil, canDeleteOutgoingMessages: Bool? = nil, canDeleteAllMessages: Bool? = nil, canEditName: Bool? = nil, canEditBio: Bool? = nil, canEditProfilePhoto: Bool? = nil, canEditUsername: Bool? = nil, canChangeGiftSettings: Bool? = nil, canViewGiftsAndStars: Bool? = nil, canConvertGiftsToStars: Bool? = nil, canTransferAndUpgradeGifts: Bool? = nil, canTransferStars: Bool? = nil, canManageStories: Bool? = nil) {
        self.canReply = canReply
        self.canReadMessages = canReadMessages
        self.canDeleteOutgoingMessages = canDeleteOutgoingMessages
        self.canDeleteAllMessages = canDeleteAllMessages
        self.canEditName = canEditName
        self.canEditBio = canEditBio
        self.canEditProfilePhoto = canEditProfilePhoto
        self.canEditUsername = canEditUsername
        self.canChangeGiftSettings = canChangeGiftSettings
        self.canViewGiftsAndStars = canViewGiftsAndStars
        self.canConvertGiftsToStars = canConvertGiftsToStars
        self.canTransferAndUpgradeGifts = canTransferAndUpgradeGifts
        self.canTransferStars = canTransferStars
        self.canManageStories = canManageStories
    }
}
