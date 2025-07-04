// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about a message that is being replied to, which may come from another chat or forum topic.

 SeeAlso Telegram Bot API Reference:
 [ExternalReplyInfo](https://core.telegram.org/bots/api#externalreplyinfo)
 **/
public final class TGExternalReplyInfo: Codable {

    /// Custom keys for coding/decoding `ExternalReplyInfo` struct
    public enum CodingKeys: String, CodingKey {
        case origin = "origin"
        case chat = "chat"
        case messageId = "message_id"
        case linkPreviewOptions = "link_preview_options"
        case animation = "animation"
        case audio = "audio"
        case document = "document"
        case paidMedia = "paid_media"
        case photo = "photo"
        case sticker = "sticker"
        case story = "story"
        case video = "video"
        case videoNote = "video_note"
        case voice = "voice"
        case hasMediaSpoiler = "has_media_spoiler"
        case checklist
        case contact = "contact"
        case dice = "dice"
        case game = "game"
        case giveaway = "giveaway"
        case giveawayWinners = "giveaway_winners"
        case invoice = "invoice"
        case location = "location"
        case poll = "poll"
        case venue = "venue"
    }

    /// Origin of the message replied to by the given message
    public var origin: TGMessageOrigin

    /// Optional. Chat the original message belongs to. Available only if the chat is a supergroup or a channel.
    public var chat: TGChat?

    /// Optional. Unique message identifier inside the original chat. Available only if the original chat is a supergroup or a channel.
    public var messageId: Int?

    /// Optional. Options used for link preview generation for the original message, if it is a text message
    public var linkPreviewOptions: TGLinkPreviewOptions?

    /// Optional. Message is an animation, information about the animation
    public var animation: TGAnimation?

    /// Optional. Message is an audio file, information about the file
    public var audio: TGAudio?

    /// Optional. Message is a general file, information about the file
    public var document: TGDocument?

    /// Optional. Message contains paid media; information about the paid media
    public var paidMedia: TGPaidMediaInfo?

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

    /// Optional. True, if the message media is covered by a spoiler animation
    public var hasMediaSpoiler: Bool?

    /// Optional. Message is a checklist
    public var checklist: [TGChecklist]?

    /// Optional. Message is a shared contact, information about the contact
    public var contact: TGContact?

    /// Optional. Message is a dice with random value
    public var dice: TGDice?

    /// Optional. Message is a game, information about the game. More about games »
    public var game: TGGame?

    /// Optional. Message is a scheduled giveaway, information about the giveaway
    public var giveaway: TGGiveaway?

    /// Optional. A giveaway with public winners was completed
    public var giveawayWinners: TGGiveawayWinners?

    /// Optional. Message is an invoice for a payment, information about the invoice. More about payments »
    public var invoice: TGInvoice?

    /// Optional. Message is a shared location, information about the location
    public var location: TGLocation?

    /// Optional. Message is a native poll, information about the poll
    public var poll: TGPoll?

    /// Optional. Message is a venue, information about the venue
    public var venue: TGVenue?

    public init (origin: TGMessageOrigin, chat: TGChat? = nil, messageId: Int? = nil, linkPreviewOptions: TGLinkPreviewOptions? = nil, animation: TGAnimation? = nil, audio: TGAudio? = nil, document: TGDocument? = nil, paidMedia: TGPaidMediaInfo? = nil, photo: [TGPhotoSize]? = nil, sticker: TGSticker? = nil, story: TGStory? = nil, video: TGVideo? = nil, videoNote: TGVideoNote? = nil, voice: TGVoice? = nil, hasMediaSpoiler: Bool? = nil, checklist: [TGChecklist]? = nil, contact: TGContact? = nil, dice: TGDice? = nil, game: TGGame? = nil, giveaway: TGGiveaway? = nil, giveawayWinners: TGGiveawayWinners? = nil, invoice: TGInvoice? = nil, location: TGLocation? = nil, poll: TGPoll? = nil, venue: TGVenue? = nil) {
        self.origin = origin
        self.chat = chat
        self.messageId = messageId
        self.linkPreviewOptions = linkPreviewOptions
        self.animation = animation
        self.audio = audio
        self.document = document
        self.paidMedia = paidMedia
        self.photo = photo
        self.sticker = sticker
        self.story = story
        self.video = video
        self.videoNote = videoNote
        self.voice = voice
        self.hasMediaSpoiler = hasMediaSpoiler
        self.checklist = checklist
        self.contact = contact
        self.dice = dice
        self.game = game
        self.giveaway = giveaway
        self.giveawayWinners = giveawayWinners
        self.invoice = invoice
        self.location = location
        self.poll = poll
        self.venue = venue
    }
}
