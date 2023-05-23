// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to change the bot's name. Returns True on success.


/// Parameters container struct for `setMyName` method
public struct TGSetMyNameParams: Encodable {

    /// New bot name; 0-64 characters. Pass an empty string to remove the dedicated name for the given language.
    public var name: String?

    /// A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose language there is no dedicated name.
    public var languageCode: String?

    /// Custom keys for coding/decoding `SetMyNameParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
            case languageCode = "language_code"
    }

    public init(name: String? = nil, languageCode: String? = nil) {
            self.name = name
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to change the bot's name. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetMyNameParams](https://core.telegram.org/bots/api#setmyname)
 
 - Parameters:
     - params: Parameters container, see `SetMyNameParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setMyName(params: TGSetMyNameParams? = nil) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setMyName"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
