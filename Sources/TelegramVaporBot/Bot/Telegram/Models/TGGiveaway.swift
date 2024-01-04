// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a message about a scheduled giveaway.

 SeeAlso Telegram Bot API Reference:
 [Giveaway](https://core.telegram.org/bots/api#giveaway)
 **/
public final class TGGiveaway: Codable {

    /// Custom keys for coding/decoding `Giveaway` struct
    public enum CodingKeys: String, CodingKey {
        case chats = "chats"
        case winnersSelectionDate = "winners_selection_date"
        case winnerCount = "winner_count"
        case onlyNewMembers = "only_new_members"
        case hasPublicWinners = "has_public_winners"
        case prizeDescription = "prize_description"
        case countryCodes = "country_codes"
        case premiumSubscriptionMonthCount = "premium_subscription_month_count"
    }

    /// The list of chats which the user must join to participate in the giveaway
    public var chats: [TGChat]

    /// Point in time (Unix timestamp) when winners of the giveaway will be selected
    public var winnersSelectionDate: Int

    /// The number of users which are supposed to be selected as winners of the giveaway
    public var winnerCount: Int

    /// Optional. True, if only users who join the chats after the giveaway started should be eligible to win
    public var onlyNewMembers: Bool?

    /// Optional. True, if the list of giveaway winners will be visible to everyone
    public var hasPublicWinners: Bool?

    /// Optional. Description of additional giveaway prize
    public var prizeDescription: String?

    /// Optional. A list of two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which eligible users for the giveaway must come. If empty, then all users can participate in the giveaway. Users with a phone number that was bought on Fragment can always participate in giveaways.
    public var countryCodes: [String]?

    /// Optional. The number of months the Telegram Premium subscription won from the giveaway will be active for
    public var premiumSubscriptionMonthCount: Int?

    public init (chats: [TGChat], winnersSelectionDate: Int, winnerCount: Int, onlyNewMembers: Bool? = nil, hasPublicWinners: Bool? = nil, prizeDescription: String? = nil, countryCodes: [String]? = nil, premiumSubscriptionMonthCount: Int? = nil) {
        self.chats = chats
        self.winnersSelectionDate = winnersSelectionDate
        self.winnerCount = winnerCount
        self.onlyNewMembers = onlyNewMembers
        self.hasPublicWinners = hasPublicWinners
        self.prizeDescription = prizeDescription
        self.countryCodes = countryCodes
        self.premiumSubscriptionMonthCount = premiumSubscriptionMonthCount
    }
}
