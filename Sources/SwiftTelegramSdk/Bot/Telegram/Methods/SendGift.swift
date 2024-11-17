// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Sends a gift to the given user. The gift can't be converted to Telegram Stars by the user. Returns True on success.


/// Parameters container struct for `sendGift` method
public struct TGSendGiftParams: Encodable {

    /// Unique identifier of the target user that will receive the gift
    public var userId: Int64

    /// Identifier of the gift
    public var giftId: String

    /// Text that will be shown along with the gift; 0-255 characters
    public var text: String?

    /// Mode for parsing entities in the text. See formatting options for more details. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, and “custom_emoji” are ignored.
    public var textParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the gift text. It can be specified instead of text_parse_mode. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, and “custom_emoji” are ignored.
    public var textEntities: [TGMessageEntity]?

    /// Custom keys for coding/decoding `SendGiftParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case giftId = "gift_id"
            case text = "text"
            case textParseMode = "text_parse_mode"
            case textEntities = "text_entities"
    }

    public init(userId: Int64, giftId: String, text: String? = nil, textParseMode: TGParseMode? = nil, textEntities: [TGMessageEntity]? = nil) {
            self.userId = userId
            self.giftId = giftId
            self.text = text
            self.textParseMode = textParseMode
            self.textEntities = textEntities
    }
}


public extension TGBot {

/**
 Sends a gift to the given user. The gift can't be converted to Telegram Stars by the user. Returns True on success.

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
