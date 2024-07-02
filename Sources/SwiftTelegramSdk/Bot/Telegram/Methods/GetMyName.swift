// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the current bot name for the given user language. Returns BotName on success.


/// Parameters container struct for `getMyName` method
public struct TGGetMyNameParams: Encodable {

    /// A two-letter ISO 639-1 language code or an empty string
    public var languageCode: String?

    /// Custom keys for coding/decoding `GetMyNameParams` struct
    public enum CodingKeys: String, CodingKey {
            case languageCode = "language_code"
    }

    public init(languageCode: String? = nil) {
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to get the current bot name for the given user language. Returns BotName on success.

 SeeAlso Telegram Bot API Reference:
 [GetMyNameParams](https://core.telegram.org/bots/api#getmyname)
 
 - Parameters:
     - params: Parameters container, see `GetMyNameParams` struct
 - Throws: Throws on errors
 - Returns: `TGBotName`
 */

    @discardableResult
    func getMyName(params: TGGetMyNameParams? = nil) async throws -> TGBotName {
        guard let methodURL: URL = .init(string: getMethodURL("getMyName")) else {
            throw BotError("Bad URL: \(getMethodURL("getMyName"))")
        }
        let result: TGBotName = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
