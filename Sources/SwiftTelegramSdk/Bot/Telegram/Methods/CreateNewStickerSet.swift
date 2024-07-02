// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success.


/// Parameters container struct for `createNewStickerSet` method
public struct TGCreateNewStickerSetParams: Encodable {

    /// User identifier of created sticker set owner
    public var userId: Int64

    /// Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only English letters, digits and underscores. Must begin with a letter, can't contain consecutive underscores and must end in "_by_<bot_username>". <bot_username> is case insensitive. 1-64 characters.
    public var name: String

    /// Sticker set title, 1-64 characters
    public var title: String

    /// A JSON-serialized list of 1-50 initial stickers to be added to the sticker set
    public var stickers: [TGInputSticker]

    /// Type of stickers in the set, pass “regular”, “mask”, or “custom_emoji”. By default, a regular sticker set is created.
    public var stickerType: String?

    /// Pass True if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context; for custom emoji sticker sets only
    public var needsRepainting: Bool?

    /// Custom keys for coding/decoding `CreateNewStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case name = "name"
            case title = "title"
            case stickers = "stickers"
            case stickerType = "sticker_type"
            case needsRepainting = "needs_repainting"
    }

    public init(userId: Int64, name: String, title: String, stickers: [TGInputSticker], stickerType: String? = nil, needsRepainting: Bool? = nil) {
            self.userId = userId
            self.name = name
            self.title = title
            self.stickers = stickers
            self.stickerType = stickerType
            self.needsRepainting = needsRepainting
    }
}


public extension TGBot {

/**
 Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [CreateNewStickerSetParams](https://core.telegram.org/bots/api#createnewstickerset)
 
 - Parameters:
     - params: Parameters container, see `CreateNewStickerSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func createNewStickerSet(params: TGCreateNewStickerSetParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("createNewStickerSet")) else {
            throw BotError("Bad URL: \(getMethodURL("createNewStickerSet"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
