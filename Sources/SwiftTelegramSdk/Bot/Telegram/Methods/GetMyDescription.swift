// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

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
 - Returns: `TGBotDescription`
 */

    @discardableResult
    func getMyDescription(params: TGGetMyDescriptionParams? = nil) async throws -> TGBotDescription {
        guard let methodURL: URL = .init(string: getMethodURL("getMyDescription")) else {
            throw BotError("Bad URL: \(getMethodURL("getMyDescription"))")
        }
        let result: TGBotDescription = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
