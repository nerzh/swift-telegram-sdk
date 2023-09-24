// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a message.

 SeeAlso Telegram Bot API Reference:
 [Message](https://core.telegram.org/bots/api#message)
 */
public final class TGMessage: Codable {

    /// Custom keys for coding/decoding `Message` struct
    public enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
        case messageThreadId = "message_thread_id"
        case from = "from"
        case senderChat = "sender_chat"
        case date = "date"
        case chat = "chat"
        case forwardFrom = "forward_from"
        case forwardFromChat = "forward_from_chat"
        case forwardFromMessageId = "forward_from_message_id"
        case forwardSignature = "forward_signature"
        case forwardSenderName = "forward_sender_name"
        case forwardDate = "forward_date"
        case isTopicMessage = "is_topic_message"
        case isAutomaticForward = "is_automatic_forward"
        case replyToMessage = "reply_to_message"
        case viaBot = "via_bot"
        case editDate = "edit_date"
        case hasProtectedContent = "has_protected_content"
        case mediaGroupId = "media_group_id"
        case authorSignature = "author_signature"
        case text = "text"
        case entities = "entities"
        case animation = "animation"
        case audio = "audio"
        case document = "document"
        case photo = "photo"
        case sticker = "sticker"
        case story = "story"
        case video = "video"
        case videoNote = "video_note"
        case voice = "voice"
        case caption = "caption"
        case captionEntities = "caption_entities"
        case hasMediaSpoiler = "has_media_spoiler"
        case contact = "contact"
        case dice = "dice"
        case game = "game"
        case poll = "poll"
        case venue = "venue"
        case location = "location"
        case newChatMembers = "new_chat_members"
        case leftChatMember = "left_chat_member"
        case newChatTitle = "new_chat_title"
        case newChatPhoto = "new_chat_photo"
        case deleteChatPhoto = "delete_chat_photo"
        case groupChatCreated = "group_chat_created"
        case supergroupChatCreated = "supergroup_chat_created"
        case channelChatCreated = "channel_chat_created"
        case messageAutoDeleteTimerChanged = "message_auto_delete_timer_changed"
        case migrateToChatId = "migrate_to_chat_id"
        case migrateFromChatId = "migrate_from_chat_id"
        case pinnedMessage = "pinned_message"
        case invoice = "invoice"
        case successfulPayment = "successful_payment"
        case userShared = "user_shared"
        case chatShared = "chat_shared"
        case connectedWebsite = "connected_website"
        case writeAccessAllowed = "write_access_allowed"
        case passportData = "passport_data"
        case proximityAlertTriggered = "proximity_alert_triggered"
        case forumTopicCreated = "forum_topic_created"
        case forumTopicEdited = "forum_topic_edited"
        case forumTopicClosed = "forum_topic_closed"
        case forumTopicReopened = "forum_topic_reopened"
        case generalForumTopicHidden = "general_forum_topic_hidden"
        case generalForumTopicUnhidden = "general_forum_topic_unhidden"
        case videoChatScheduled = "video_chat_scheduled"
        case videoChatStarted = "video_chat_started"
        case videoChatEnded = "video_chat_ended"
        case videoChatParticipantsInvited = "video_chat_participants_invited"
        case webAppData = "web_app_data"
        case replyMarkup = "reply_markup"
    }

    /// Unique message identifier inside this chat
    public var messageId: Int

    /// Optional. Unique identifier of a message thread to which the message belongs; for supergroups only
    public var messageThreadId: Int?

    /// Optional. Sender of the message; empty for messages sent to channels. For backward compatibility, the field contains a fake sender user in non-channel chats, if the message was sent on behalf of a chat.
    public var from: TGUser?

    /// Optional. Sender of the message, sent on behalf of a chat. For example, the channel itself for channel posts, the supergroup itself for messages from anonymous group administrators, the linked channel for messages automatically forwarded to the discussion group. For backward compatibility, the field from contains a fake sender user in non-channel chats, if the message was sent on behalf of a chat.
    public var senderChat: TGChat?

    /// Date the message was sent in Unix time
    public var date: Int

    /// Conversation the message belongs to
    public var chat: TGChat

    /// Optional. For forwarded messages, sender of the original message
    public var forwardFrom: TGUser?

    /// Optional. For messages forwarded from channels or from anonymous administrators, information about the original sender chat
    public var forwardFromChat: TGChat?

    /// Optional. For messages forwarded from channels, identifier of the original message in the channel
    public var forwardFromMessageId: Int?

    /// Optional. For forwarded messages that were originally sent in channels or by an anonymous chat administrator, signature of the message sender if present
    public var forwardSignature: String?

    /// Optional. Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages
    public var forwardSenderName: String?

    /// Optional. For forwarded messages, date the original message was sent in Unix time
    public var forwardDate: Int?

    /// Optional. True, if the message is sent to a forum topic
    public var isTopicMessage: Bool?

    /// Optional. True, if the message is a channel post that was automatically forwarded to the connected discussion group
    public var isAutomaticForward: Bool?

    /// Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    public var replyToMessage: TGMessage?

    /// Optional. Bot through which the message was sent
    public var viaBot: TGUser?

    /// Optional. Date the message was last edited in Unix time
    public var editDate: Int?

    /// Optional. True, if the message can't be forwarded
    public var hasProtectedContent: Bool?

    /// Optional. The unique identifier of a media message group this message belongs to
    public var mediaGroupId: String?

    /// Optional. Signature of the post author for messages in channels, or the custom title of an anonymous group administrator
    public var authorSignature: String?

    /// Optional. For text messages, the actual UTF-8 text of the message
    public var text: String?

    /// Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    public var entities: [TGMessageEntity]?

    /// Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set
    public var animation: TGAnimation?

    /// Optional. Message is an audio file, information about the file
    public var audio: TGAudio?

    /// Optional. Message is a general file, information about the file
    public var document: TGDocument?

    /// Optional. Message is a photo, available sizes of the photo
    public var photo: [TGPhotoSize]?

    /// Optional. Message is a sticker, information about the sticker
    public var sticker: TGSticker?

    /// Optional. Message is a forwarded story
    public var story: TGStory?

    /// Optional. Message is a video, information about the video
    public var video: TGVideo?

    /// Optional. Message is a video note, information about the video message
    public var videoNote: TGVideoNote?

    /// Optional. Message is a voice message, information about the file
    public var voice: TGVoice?

    /// Optional. Caption for the animation, audio, document, photo, video or voice
    public var caption: String?

    /// Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
    public var captionEntities: [TGMessageEntity]?

    /// Optional. True, if the message media is covered by a spoiler animation
    public var hasMediaSpoiler: Bool?

    /// Optional. Message is a shared contact, information about the contact
    public var contact: TGContact?

    /// Optional. Message is a dice with random value
    public var dice: TGDice?

    /// Optional. Message is a game, information about the game. More about games »
    public var game: TGGame?

    /// Optional. Message is a native poll, information about the poll
    public var poll: TGPoll?

    /// Optional. Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set
    public var venue: TGVenue?

    /// Optional. Message is a shared location, information about the location
    public var location: TGLocation?

    /// Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    public var newChatMembers: [TGUser]?

    /// Optional. A member was removed from the group, information about them (this member may be the bot itself)
    public var leftChatMember: TGUser?

    /// Optional. A chat title was changed to this value
    public var newChatTitle: String?

    /// Optional. A chat photo was change to this value
    public var newChatPhoto: [TGPhotoSize]?

    /// Optional. Service message: the chat photo was deleted
    public var deleteChatPhoto: Bool?

    /// Optional. Service message: the group has been created
    public var groupChatCreated: Bool?

    /// Optional. Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    public var supergroupChatCreated: Bool?

    /// Optional. Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    public var channelChatCreated: Bool?

    /// Optional. Service message: auto-delete timer settings changed in the chat
    public var messageAutoDeleteTimerChanged: TGMessageAutoDeleteTimerChanged?

    /// Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public var migrateToChatId: Int64?

    /// Optional. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public var migrateFromChatId: Int64?

    /// Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
    public var pinnedMessage: TGMessage?

    /// Optional. Message is an invoice for a payment, information about the invoice. More about payments »
    public var invoice: TGInvoice?

    /// Optional. Message is a service message about a successful payment, information about the payment. More about payments »
    public var successfulPayment: TGSuccessfulPayment?

    /// Optional. Service message: a user was shared with the bot
    public var userShared: TGUserShared?

    /// Optional. Service message: a chat was shared with the bot
    public var chatShared: TGChatShared?

    /// Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
    public var connectedWebsite: String?

    /// Optional. Service message: the user allowed the bot to write messages after adding it to the attachment or side menu, launching a Web App from a link, or accepting an explicit request from a Web App sent by the method requestWriteAccess
    public var writeAccessAllowed: TGWriteAccessAllowed?

    /// Optional. Telegram Passport data
    public var passportData: TGPassportData?

    /// Optional. Service message. A user in the chat triggered another user's proximity alert while sharing Live Location.
    public var proximityAlertTriggered: TGProximityAlertTriggered?

    /// Optional. Service message: forum topic created
    public var forumTopicCreated: TGForumTopicCreated?

    /// Optional. Service message: forum topic edited
    public var forumTopicEdited: TGForumTopicEdited?

    /// Optional. Service message: forum topic closed
    public var forumTopicClosed: TGForumTopicClosed?

    /// Optional. Service message: forum topic reopened
    public var forumTopicReopened: TGForumTopicReopened?

    /// Optional. Service message: the 'General' forum topic hidden
    public var generalForumTopicHidden: TGGeneralForumTopicHidden?

    /// Optional. Service message: the 'General' forum topic unhidden
    public var generalForumTopicUnhidden: TGGeneralForumTopicUnhidden?

    /// Optional. Service message: video chat scheduled
    public var videoChatScheduled: TGVideoChatScheduled?

    /// Optional. Service message: video chat started
    public var videoChatStarted: TGVideoChatStarted?

    /// Optional. Service message: video chat ended
    public var videoChatEnded: TGVideoChatEnded?

    /// Optional. Service message: new participants invited to a video chat
    public var videoChatParticipantsInvited: TGVideoChatParticipantsInvited?

    /// Optional. Service message: data sent by a Web App
    public var webAppData: TGWebAppData?

    /// Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
    public var replyMarkup: TGInlineKeyboardMarkup?

    public init (messageId: Int, messageThreadId: Int? = nil, from: TGUser? = nil, senderChat: TGChat? = nil, date: Int, chat: TGChat, forwardFrom: TGUser? = nil, forwardFromChat: TGChat? = nil, forwardFromMessageId: Int? = nil, forwardSignature: String? = nil, forwardSenderName: String? = nil, forwardDate: Int? = nil, isTopicMessage: Bool? = nil, isAutomaticForward: Bool? = nil, replyToMessage: TGMessage? = nil, viaBot: TGUser? = nil, editDate: Int? = nil, hasProtectedContent: Bool? = nil, mediaGroupId: String? = nil, authorSignature: String? = nil, text: String? = nil, entities: [TGMessageEntity]? = nil, animation: TGAnimation? = nil, audio: TGAudio? = nil, document: TGDocument? = nil, photo: [TGPhotoSize]? = nil, sticker: TGSticker? = nil, story: TGStory? = nil, video: TGVideo? = nil, videoNote: TGVideoNote? = nil, voice: TGVoice? = nil, caption: String? = nil, captionEntities: [TGMessageEntity]? = nil, hasMediaSpoiler: Bool? = nil, contact: TGContact? = nil, dice: TGDice? = nil, game: TGGame? = nil, poll: TGPoll? = nil, venue: TGVenue? = nil, location: TGLocation? = nil, newChatMembers: [TGUser]? = nil, leftChatMember: TGUser? = nil, newChatTitle: String? = nil, newChatPhoto: [TGPhotoSize]? = nil, deleteChatPhoto: Bool? = nil, groupChatCreated: Bool? = nil, supergroupChatCreated: Bool? = nil, channelChatCreated: Bool? = nil, messageAutoDeleteTimerChanged: TGMessageAutoDeleteTimerChanged? = nil, migrateToChatId: Int64? = nil, migrateFromChatId: Int64? = nil, pinnedMessage: TGMessage? = nil, invoice: TGInvoice? = nil, successfulPayment: TGSuccessfulPayment? = nil, userShared: TGUserShared? = nil, chatShared: TGChatShared? = nil, connectedWebsite: String? = nil, writeAccessAllowed: TGWriteAccessAllowed? = nil, passportData: TGPassportData? = nil, proximityAlertTriggered: TGProximityAlertTriggered? = nil, forumTopicCreated: TGForumTopicCreated? = nil, forumTopicEdited: TGForumTopicEdited? = nil, forumTopicClosed: TGForumTopicClosed? = nil, forumTopicReopened: TGForumTopicReopened? = nil, generalForumTopicHidden: TGGeneralForumTopicHidden? = nil, generalForumTopicUnhidden: TGGeneralForumTopicUnhidden? = nil, videoChatScheduled: TGVideoChatScheduled? = nil, videoChatStarted: TGVideoChatStarted? = nil, videoChatEnded: TGVideoChatEnded? = nil, videoChatParticipantsInvited: TGVideoChatParticipantsInvited? = nil, webAppData: TGWebAppData? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
        self.messageId = messageId
        self.messageThreadId = messageThreadId
        self.from = from
        self.senderChat = senderChat
        self.date = date
        self.chat = chat
        self.forwardFrom = forwardFrom
        self.forwardFromChat = forwardFromChat
        self.forwardFromMessageId = forwardFromMessageId
        self.forwardSignature = forwardSignature
        self.forwardSenderName = forwardSenderName
        self.forwardDate = forwardDate
        self.isTopicMessage = isTopicMessage
        self.isAutomaticForward = isAutomaticForward
        self.replyToMessage = replyToMessage
        self.viaBot = viaBot
        self.editDate = editDate
        self.hasProtectedContent = hasProtectedContent
        self.mediaGroupId = mediaGroupId
        self.authorSignature = authorSignature
        self.text = text
        self.entities = entities
        self.animation = animation
        self.audio = audio
        self.document = document
        self.photo = photo
        self.sticker = sticker
        self.story = story
        self.video = video
        self.videoNote = videoNote
        self.voice = voice
        self.caption = caption
        self.captionEntities = captionEntities
        self.hasMediaSpoiler = hasMediaSpoiler
        self.contact = contact
        self.dice = dice
        self.game = game
        self.poll = poll
        self.venue = venue
        self.location = location
        self.newChatMembers = newChatMembers
        self.leftChatMember = leftChatMember
        self.newChatTitle = newChatTitle
        self.newChatPhoto = newChatPhoto
        self.deleteChatPhoto = deleteChatPhoto
        self.groupChatCreated = groupChatCreated
        self.supergroupChatCreated = supergroupChatCreated
        self.channelChatCreated = channelChatCreated
        self.messageAutoDeleteTimerChanged = messageAutoDeleteTimerChanged
        self.migrateToChatId = migrateToChatId
        self.migrateFromChatId = migrateFromChatId
        self.pinnedMessage = pinnedMessage
        self.invoice = invoice
        self.successfulPayment = successfulPayment
        self.userShared = userShared
        self.chatShared = chatShared
        self.connectedWebsite = connectedWebsite
        self.writeAccessAllowed = writeAccessAllowed
        self.passportData = passportData
        self.proximityAlertTriggered = proximityAlertTriggered
        self.forumTopicCreated = forumTopicCreated
        self.forumTopicEdited = forumTopicEdited
        self.forumTopicClosed = forumTopicClosed
        self.forumTopicReopened = forumTopicReopened
        self.generalForumTopicHidden = generalForumTopicHidden
        self.generalForumTopicUnhidden = generalForumTopicUnhidden
        self.videoChatScheduled = videoChatScheduled
        self.videoChatStarted = videoChatStarted
        self.videoChatEnded = videoChatEnded
        self.videoChatParticipantsInvited = videoChatParticipantsInvited
        self.webAppData = webAppData
        self.replyMarkup = replyMarkup
    }
}
