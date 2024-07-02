// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a service message about the completion of a giveaway without public winners.

 SeeAlso Telegram Bot API Reference:
 [GiveawayCompleted](https://core.telegram.org/bots/api#giveawaycompleted)
 **/
public final class TGGiveawayCompleted: Codable {

    /// Custom keys for coding/decoding `GiveawayCompleted` struct
    public enum CodingKeys: String, CodingKey {
        case winnerCount = "winner_count"
        case unclaimedPrizeCount = "unclaimed_prize_count"
        case giveawayMessage = "giveaway_message"
    }

    /// Number of winners in the giveaway
    public var winnerCount: Int

    /// Optional. Number of undistributed prizes
    public var unclaimedPrizeCount: Int?

    /// Optional. Message with the giveaway that was completed, if it wasn't deleted
    public var giveawayMessage: TGMessage?

    public init (winnerCount: Int, unclaimedPrizeCount: Int? = nil, giveawayMessage: TGMessage? = nil) {
        self.winnerCount = winnerCount
        self.unclaimedPrizeCount = unclaimedPrizeCount
        self.giveawayMessage = giveawayMessage
    }
}
