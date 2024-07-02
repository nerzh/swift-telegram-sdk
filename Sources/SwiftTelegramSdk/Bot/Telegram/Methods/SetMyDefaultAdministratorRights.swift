// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels. These rights will be suggested to users, but they are free to modify the list before adding the bot. Returns True on success.


/// Parameters container struct for `setMyDefaultAdministratorRights` method
public struct TGSetMyDefaultAdministratorRightsParams: Encodable {

    /// A JSON-serialized object describing new default administrator rights. If not specified, the default administrator rights will be cleared.
    public var rights: TGChatAdministratorRights?

    /// Pass True to change the default administrator rights of the bot in channels. Otherwise, the default administrator rights of the bot for groups and supergroups will be changed.
    public var forChannels: Bool?

    /// Custom keys for coding/decoding `SetMyDefaultAdministratorRightsParams` struct
    public enum CodingKeys: String, CodingKey {
            case rights = "rights"
            case forChannels = "for_channels"
    }

    public init(rights: TGChatAdministratorRights? = nil, forChannels: Bool? = nil) {
            self.rights = rights
            self.forChannels = forChannels
    }
}


public extension TGBot {

/**
 Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels. These rights will be suggested to users, but they are free to modify the list before adding the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetMyDefaultAdministratorRightsParams](https://core.telegram.org/bots/api#setmydefaultadministratorrights)
 
 - Parameters:
     - params: Parameters container, see `SetMyDefaultAdministratorRightsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setMyDefaultAdministratorRights(params: TGSetMyDefaultAdministratorRightsParams? = nil) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setMyDefaultAdministratorRights")) else {
            throw BotError("Bad URL: \(getMethodURL("setMyDefaultAdministratorRights"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
