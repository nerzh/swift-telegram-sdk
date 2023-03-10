// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to change the bot's short description, which is shown on the bot's profile page and is sent together with the link when users share the bot. Returns True on success.


/// Parameters container struct for `setMyShortDescription` method
public struct TGSetMyShortDescriptionParams: Encodable {

    /// New short description for the bot; 0-120 characters. Pass an empty string to remove the dedicated short description for the given language.
    public var shortDescription: String?

    /// A two-letter ISO 639-1 language code. If empty, the short description will be applied to all users for whose language there is no dedicated short description.
    public var languageCode: String?

    /// Custom keys for coding/decoding `SetMyShortDescriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case shortDescription = "short_description"
            case languageCode = "language_code"
    }

    public init(shortDescription: String? = nil, languageCode: String? = nil) {
            self.shortDescription = shortDescription
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to change the bot's short description, which is shown on the bot's profile page and is sent together with the link when users share the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetMyShortDescriptionParams](https://core.telegram.org/bots/api#setmyshortdescription)
 
 - Parameters:
     - params: Parameters container, see `SetMyShortDescriptionParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func setMyShortDescription(params: TGSetMyShortDescriptionParams? = nil) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setMyShortDescription"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
