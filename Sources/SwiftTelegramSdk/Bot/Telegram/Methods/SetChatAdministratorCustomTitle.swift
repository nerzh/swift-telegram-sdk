// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success.


/// Parameters container struct for `setChatAdministratorCustomTitle` method
public struct TGSetChatAdministratorCustomTitleParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// New custom title for the administrator; 0-16 characters, emoji are not allowed
    public var customTitle: String

    /// Custom keys for coding/decoding `SetChatAdministratorCustomTitleParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case customTitle = "custom_title"
    }

    public init(chatId: TGChatId, userId: Int64, customTitle: String) {
            self.chatId = chatId
            self.userId = userId
            self.customTitle = customTitle
    }
}


public extension TGBot {

/**
 Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatAdministratorCustomTitleParams](https://core.telegram.org/bots/api#setchatadministratorcustomtitle)
 
 - Parameters:
     - params: Parameters container, see `SetChatAdministratorCustomTitleParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setChatAdministratorCustomTitle(params: TGSetChatAdministratorCustomTitleParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setChatAdministratorCustomTitle")) else {
            throw BotError("Bad URL: \(getMethodURL("setChatAdministratorCustomTitle"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
