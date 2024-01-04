// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes the source of a chat boost. It can be one of
 ChatBoostSourcePremium
 ChatBoostSourceGiftCode
 ChatBoostSourceGiveaway

 SeeAlso Telegram Bot API Reference:
 [ChatBoostSource](https://core.telegram.org/bots/api#chatboostsource)
 **/
public enum TGChatBoostSource: Codable {
    case chatBoostSourcePremium(TGChatBoostSourcePremium)
    case chatBoostSourceGiftCode(TGChatBoostSourceGiftCode)
    case chatBoostSourceGiveaway(TGChatBoostSourceGiveaway)
}
