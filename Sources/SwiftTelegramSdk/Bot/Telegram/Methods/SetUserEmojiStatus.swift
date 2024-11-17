// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Changes the emoji status for a given user that previously allowed the bot to manage their emoji status via the Mini App method requestEmojiStatusAccess. Returns True on success.


/// Parameters container struct for `setUserEmojiStatus` method
public struct TGSetUserEmojiStatusParams: Encodable {

    /// Unique identifier of the target user
    public var userId: Int64

    /// Custom emoji identifier of the emoji status to set. Pass an empty string to remove the status.
    public var emojiStatusCustomEmojiId: String?

    /// Expiration date of the emoji status, if any
    public var emojiStatusExpirationDate: Int?

    /// Custom keys for coding/decoding `SetUserEmojiStatusParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case emojiStatusCustomEmojiId = "emoji_status_custom_emoji_id"
            case emojiStatusExpirationDate = "emoji_status_expiration_date"
    }

    public init(userId: Int64, emojiStatusCustomEmojiId: String? = nil, emojiStatusExpirationDate: Int? = nil) {
            self.userId = userId
            self.emojiStatusCustomEmojiId = emojiStatusCustomEmojiId
            self.emojiStatusExpirationDate = emojiStatusExpirationDate
    }
}


public extension TGBot {

/**
 Changes the emoji status for a given user that previously allowed the bot to manage their emoji status via the Mini App method requestEmojiStatusAccess. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetUserEmojiStatusParams](https://core.telegram.org/bots/api#setuseremojistatus)
 
 - Parameters:
     - params: Parameters container, see `SetUserEmojiStatusParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setUserEmojiStatus(params: TGSetUserEmojiStatusParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setUserEmojiStatus")) else {
            throw BotError("Bad URL: \(getMethodURL("setUserEmojiStatus"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
