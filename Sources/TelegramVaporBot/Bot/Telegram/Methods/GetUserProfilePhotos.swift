// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.


/// Parameters container struct for `getUserProfilePhotos` method
public struct TGGetUserProfilePhotosParams: Encodable {

    /// Unique identifier of the target user
    public var userId: Int64

    /// Sequential number of the first photo to be returned. By default, all photos are returned.
    public var offset: Int?

    /// Limits the number of photos to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    public var limit: Int?

    /// Custom keys for coding/decoding `GetUserProfilePhotosParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case offset = "offset"
            case limit = "limit"
    }

    public init(userId: Int64, offset: Int? = nil, limit: Int? = nil) {
            self.userId = userId
            self.offset = offset
            self.limit = limit
    }
}


public extension TGBot {

/**
 Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.

 SeeAlso Telegram Bot API Reference:
 [GetUserProfilePhotosParams](https://core.telegram.org/bots/api#getuserprofilephotos)
 
 - Parameters:
     - params: Parameters container, see `GetUserProfilePhotosParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGUserProfilePhotos` type
 */
    @discardableResult
    func getUserProfilePhotos(params: TGGetUserProfilePhotosParams) throws -> EventLoopFuture<TGUserProfilePhotos> {
        let methodURL: URI = .init(string: getMethodURL("getUserProfilePhotos"))
        let future: EventLoopFuture<TGUserProfilePhotos> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }

    @discardableResult
    func getUserProfilePhotos(params: TGGetUserProfilePhotosParams) async throws -> TGUserProfilePhotos {
        let methodURL: URI = .init(string: getMethodURL("getUserProfilePhotos"))
        let result: TGUserProfilePhotos = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
