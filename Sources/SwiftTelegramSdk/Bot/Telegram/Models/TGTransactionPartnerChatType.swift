// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a transaction with a chat.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerChat](https://core.telegram.org/bots/api#transactionpartnerchat)
 */

public enum TGTransactionPartnerChatType: String, Codable {
    case chat = "chat"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGTransactionPartnerChatType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}