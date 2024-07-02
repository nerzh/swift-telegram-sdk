// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change the bot's description, which is shown in the chat with the bot if the chat is empty. Returns True on success.


/// Parameters container struct for `setMyDescription` method
public struct TGSetMyDescriptionParams: Encodable {

    /// New bot description; 0-512 characters. Pass an empty string to remove the dedicated description for the given language.
    public var description: String?

    /// A two-letter ISO 639-1 language code. If empty, the description will be applied to all users for whose language there is no dedicated description.
    public var languageCode: String?

    /// Custom keys for coding/decoding `SetMyDescriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case description = "description"
            case languageCode = "language_code"
    }

    public init(description: String? = nil, languageCode: String? = nil) {
            self.description = description
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to change the bot's description, which is shown in the chat with the bot if the chat is empty. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetMyDescriptionParams](https://core.telegram.org/bots/api#setmydescription)
 
 - Parameters:
     - params: Parameters container, see `SetMyDescriptionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setMyDescription(params: TGSetMyDescriptionParams? = nil) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setMyDescription")) else {
            throw BotError("Bad URL: \(getMethodURL("setMyDescription"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
