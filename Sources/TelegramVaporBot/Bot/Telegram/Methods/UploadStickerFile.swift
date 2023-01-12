// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to upload a .PNG file with a sticker for later use in createNewStickerSet and addStickerToSet methods (can be used multiple times). Returns the uploaded File on success.


/// Parameters container struct for `uploadStickerFile` method
public struct TGUploadStickerFileParams: Encodable {

    /// User identifier of sticker file owner
    public var userId: Int64

    /// PNG image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. More information on Sending Files »
    public var pngSticker: TGInputFile

    /// Custom keys for coding/decoding `UploadStickerFileParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case pngSticker = "png_sticker"
    }

    public init(userId: Int64, pngSticker: TGInputFile) {
            self.userId = userId
            self.pngSticker = pngSticker
    }
}


public extension TGBot {

/**
 Use this method to upload a .PNG file with a sticker for later use in createNewStickerSet and addStickerToSet methods (can be used multiple times). Returns the uploaded File on success.

 SeeAlso Telegram Bot API Reference:
 [UploadStickerFileParams](https://core.telegram.org/bots/api#uploadstickerfile)
 
 - Parameters:
     - params: Parameters container, see `UploadStickerFileParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGFile` type
 */
    @discardableResult
    func uploadStickerFile(params: TGUploadStickerFileParams) throws -> EventLoopFuture<TGFile> {
        let methodURL: URI = .init(string: getMethodURL("uploadStickerFile"))
        let future: EventLoopFuture<TGFile> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
