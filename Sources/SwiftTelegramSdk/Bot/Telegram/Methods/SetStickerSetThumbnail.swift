// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set the thumbnail of a regular or mask sticker set. The format of the thumbnail file must match the format of the stickers in the set. Returns True on success.


/// Parameters container struct for `setStickerSetThumbnail` method
public struct TGSetStickerSetThumbnailParams: Encodable {

    /// Sticker set name
    public var name: String

    /// User identifier of the sticker set owner
    public var userId: Int64

    /// A .WEBP or .PNG image with the thumbnail, must be up to 128 kilobytes in size and have a width and height of exactly 100px, or a .TGS animation with a thumbnail up to 32 kilobytes in size (see https://core.telegram.org/stickers#animation-requirements for animated sticker technical requirements), or a WEBM video with the thumbnail up to 32 kilobytes in size; see https://core.telegram.org/stickers#video-requirements for video sticker technical requirements. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files ». Animated and video sticker set thumbnails can't be uploaded via HTTP URL. If omitted, then the thumbnail is dropped and the first sticker is used as the thumbnail.
    public var thumbnail: TGFileInfo?

    /// Format of the thumbnail, must be one of “static” for a .WEBP or .PNG image, “animated” for a .TGS animation, or “video” for a WEBM video
    public var format: String

    /// Custom keys for coding/decoding `SetStickerSetThumbnailParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
            case userId = "user_id"
            case thumbnail = "thumbnail"
            case format = "format"
    }

    public init(name: String, userId: Int64, thumbnail: TGFileInfo? = nil, format: String) {
            self.name = name
            self.userId = userId
            self.thumbnail = thumbnail
            self.format = format
    }
}


public extension TGBot {

/**
 Use this method to set the thumbnail of a regular or mask sticker set. The format of the thumbnail file must match the format of the stickers in the set. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetStickerSetThumbnailParams](https://core.telegram.org/bots/api#setstickersetthumbnail)
 
 - Parameters:
     - params: Parameters container, see `SetStickerSetThumbnailParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setStickerSetThumbnail(params: TGSetStickerSetThumbnailParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setStickerSetThumbnail")) else {
            throw BotError("Bad URL: \(getMethodURL("setStickerSetThumbnail"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
