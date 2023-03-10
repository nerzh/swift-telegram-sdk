// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get the current bot description for the given user language. Returns BotDescription on success.


/// Parameters container struct for `getMyDescription` method
public struct TGGetMyDescriptionParams: Encodable {

    /// A two-letter ISO 639-1 language code or an empty string
    public var languageCode: String?

    /// Custom keys for coding/decoding `GetMyDescriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case languageCode = "language_code"
    }

    public init(languageCode: String? = nil) {
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to get the current bot description for the given user language. Returns BotDescription on success.

 SeeAlso Telegram Bot API Reference:
 [GetMyDescriptionParams](https://core.telegram.org/bots/api#getmydescription)
 
 - Parameters:
     - params: Parameters container, see `GetMyDescriptionParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGBotDescription` type
 */

    @discardableResult
    func getMyDescription(params: TGGetMyDescriptionParams? = nil) async throws -> TGBotDescription {
        let methodURL: URI = .init(string: getMethodURL("getMyDescription"))
        let result: TGBotDescription = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
