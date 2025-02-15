// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Sends a gift to the given user or channel chat. The gift can't be converted to Telegram Stars by the receiver. Returns True on success.


/// Parameters container struct for `sendGift` method
public struct TGSendGiftParams: Encodable {

    /// Required if chat_id is not specified. Unique identifier of the target user who will receive the gift.
    public var userId: Int64?

    /// Required if user_id is not specified. Unique identifier for the chat or username of the channel (in the format @channelusername) that will receive the gift.
    public var chatId: TGChatId?

    /// Identifier of the gift
    public var giftId: String

    /// Pass True to pay for the gift upgrade from the bot's balance, thereby making the upgrade free for the receiver
    public var payForUpgrade: Bool?

    /// Text that will be shown along with the gift; 0-128 characters
    public var text: String?

    /// Mode for parsing entities in the text. See formatting options for more details. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, and “custom_emoji” are ignored.
    public var textParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the gift text. It can be specified instead of text_parse_mode. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, and “custom_emoji” are ignored.
    public var textEntities: [TGMessageEntity]?

    /// Custom keys for coding/decoding `SendGiftParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case chatId = "chat_id"
            case giftId = "gift_id"
            case payForUpgrade = "pay_for_upgrade"
            case text = "text"
            case textParseMode = "text_parse_mode"
            case textEntities = "text_entities"
    }

    public init(userId: Int64? = nil, chatId: TGChatId? = nil, giftId: String, payForUpgrade: Bool? = nil, text: String? = nil, textParseMode: TGParseMode? = nil, textEntities: [TGMessageEntity]? = nil) {
            self.userId = userId
            self.chatId = chatId
            self.giftId = giftId
            self.payForUpgrade = payForUpgrade
            self.text = text
            self.textParseMode = textParseMode
            self.textEntities = textEntities
    }
}


public extension TGBot {

/**
 Sends a gift to the given user or channel chat. The gift can't be converted to Telegram Stars by the receiver. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SendGiftParams](https://core.telegram.org/bots/api#sendgift)
 
 - Parameters:
     - params: Parameters container, see `SendGiftParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func sendGift(params: TGSendGiftParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("sendGift")) else {
            throw BotError("Bad URL: \(getMethodURL("sendGift"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
