// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents an incoming update.
 At most one of the optional parameters can be present in any given update.

 SeeAlso Telegram Bot API Reference:
 [Update](https://core.telegram.org/bots/api#update)
 **/
public final class TGUpdate: Codable {

    /// Custom keys for coding/decoding `Update` struct
    public enum CodingKeys: String, CodingKey {
        case updateId = "update_id"
        case message = "message"
        case editedMessage = "edited_message"
        case channelPost = "channel_post"
        case editedChannelPost = "edited_channel_post"
        case businessConnection = "business_connection"
        case businessMessage = "business_message"
        case editedBusinessMessage = "edited_business_message"
        case deletedBusinessMessages = "deleted_business_messages"
        case messageReaction = "message_reaction"
        case messageReactionCount = "message_reaction_count"
        case inlineQuery = "inline_query"
        case chosenInlineResult = "chosen_inline_result"
        case callbackQuery = "callback_query"
        case shippingQuery = "shipping_query"
        case preCheckoutQuery = "pre_checkout_query"
        case poll = "poll"
        case pollAnswer = "poll_answer"
        case myChatMember = "my_chat_member"
        case chatMember = "chat_member"
        case chatJoinRequest = "chat_join_request"
        case chatBoost = "chat_boost"
        case removedChatBoost = "removed_chat_boost"
    }

    /// The update's unique identifier. Update identifiers start from a certain positive number and increase sequentially. This identifier becomes especially handy if you're using webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
    public var updateId: Int

    /// Optional. New incoming message of any kind - text, photo, sticker, etc.
    public var message: TGMessage?

    /// Optional. New version of a message that is known to the bot and was edited. This update may at times be triggered by changes to message fields that are either unavailable or not actively used by your bot.
    public var editedMessage: TGMessage?

    /// Optional. New incoming channel post of any kind - text, photo, sticker, etc.
    public var channelPost: TGMessage?

    /// Optional. New version of a channel post that is known to the bot and was edited. This update may at times be triggered by changes to message fields that are either unavailable or not actively used by your bot.
    public var editedChannelPost: TGMessage?

    /// Optional. The bot was connected to or disconnected from a business account, or a user edited an existing connection with the bot
    public var businessConnection: TGBusinessConnection?

    /// Optional. New non-service message from a connected business account
    public var businessMessage: TGMessage?

    /// Optional. New version of a message from a connected business account
    public var editedBusinessMessage: TGMessage?

    /// Optional. Messages were deleted from a connected business account
    public var deletedBusinessMessages: TGBusinessMessagesDeleted?

    /// Optional. A reaction to a message was changed by a user. The bot must be an administrator in the chat and must explicitly specify "message_reaction" in the list of allowed_updates to receive these updates. The update isn't received for reactions set by bots.
    public var messageReaction: TGMessageReactionUpdated?

    /// Optional. Reactions to a message with anonymous reactions were changed. The bot must be an administrator in the chat and must explicitly specify "message_reaction_count" in the list of allowed_updates to receive these updates. The updates are grouped and can be sent with delay up to a few minutes.
    public var messageReactionCount: TGMessageReactionCountUpdated?

    /// Optional. New incoming inline query
    public var inlineQuery: TGInlineQuery?

    /// Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
    public var chosenInlineResult: TGChosenInlineResult?

    /// Optional. New incoming callback query
    public var callbackQuery: TGCallbackQuery?

    /// Optional. New incoming shipping query. Only for invoices with flexible price
    public var shippingQuery: TGShippingQuery?

    /// Optional. New incoming pre-checkout query. Contains full information about checkout
    public var preCheckoutQuery: TGPreCheckoutQuery?

    /// Optional. New poll state. Bots receive only updates about manually stopped polls and polls, which are sent by the bot
    public var poll: TGPoll?

    /// Optional. A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.
    public var pollAnswer: TGPollAnswer?

    /// Optional. The bot's chat member status was updated in a chat. For private chats, this update is received only when the bot is blocked or unblocked by the user.
    public var myChatMember: TGChatMemberUpdated?

    /// Optional. A chat member's status was updated in a chat. The bot must be an administrator in the chat and must explicitly specify "chat_member" in the list of allowed_updates to receive these updates.
    public var chatMember: TGChatMemberUpdated?

    /// Optional. A request to join the chat has been sent. The bot must have the can_invite_users administrator right in the chat to receive these updates.
    public var chatJoinRequest: TGChatJoinRequest?

    /// Optional. A chat boost was added or changed. The bot must be an administrator in the chat to receive these updates.
    public var chatBoost: TGChatBoostUpdated?

    /// Optional. A boost was removed from a chat. The bot must be an administrator in the chat to receive these updates.
    public var removedChatBoost: TGChatBoostRemoved?

    public init (updateId: Int, message: TGMessage? = nil, editedMessage: TGMessage? = nil, channelPost: TGMessage? = nil, editedChannelPost: TGMessage? = nil, businessConnection: TGBusinessConnection? = nil, businessMessage: TGMessage? = nil, editedBusinessMessage: TGMessage? = nil, deletedBusinessMessages: TGBusinessMessagesDeleted? = nil, messageReaction: TGMessageReactionUpdated? = nil, messageReactionCount: TGMessageReactionCountUpdated? = nil, inlineQuery: TGInlineQuery? = nil, chosenInlineResult: TGChosenInlineResult? = nil, callbackQuery: TGCallbackQuery? = nil, shippingQuery: TGShippingQuery? = nil, preCheckoutQuery: TGPreCheckoutQuery? = nil, poll: TGPoll? = nil, pollAnswer: TGPollAnswer? = nil, myChatMember: TGChatMemberUpdated? = nil, chatMember: TGChatMemberUpdated? = nil, chatJoinRequest: TGChatJoinRequest? = nil, chatBoost: TGChatBoostUpdated? = nil, removedChatBoost: TGChatBoostRemoved? = nil) {
        self.updateId = updateId
        self.message = message
        self.editedMessage = editedMessage
        self.channelPost = channelPost
        self.editedChannelPost = editedChannelPost
        self.businessConnection = businessConnection
        self.businessMessage = businessMessage
        self.editedBusinessMessage = editedBusinessMessage
        self.deletedBusinessMessages = deletedBusinessMessages
        self.messageReaction = messageReaction
        self.messageReactionCount = messageReactionCount
        self.inlineQuery = inlineQuery
        self.chosenInlineResult = chosenInlineResult
        self.callbackQuery = callbackQuery
        self.shippingQuery = shippingQuery
        self.preCheckoutQuery = preCheckoutQuery
        self.poll = poll
        self.pollAnswer = pollAnswer
        self.myChatMember = myChatMember
        self.chatMember = chatMember
        self.chatJoinRequest = chatJoinRequest
        self.chatBoost = chatBoost
        self.removedChatBoost = removedChatBoost
    }
}
