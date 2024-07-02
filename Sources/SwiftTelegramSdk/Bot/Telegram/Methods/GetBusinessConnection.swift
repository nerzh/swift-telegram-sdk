// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get information about the connection of the bot with a business account. Returns a BusinessConnection object on success.


/// Parameters container struct for `getBusinessConnection` method
public struct TGGetBusinessConnectionParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Custom keys for coding/decoding `GetBusinessConnectionParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
    }

    public init(businessConnectionId: String) {
            self.businessConnectionId = businessConnectionId
    }
}


public extension TGBot {

/**
 Use this method to get information about the connection of the bot with a business account. Returns a BusinessConnection object on success.

 SeeAlso Telegram Bot API Reference:
 [GetBusinessConnectionParams](https://core.telegram.org/bots/api#getbusinessconnection)
 
 - Parameters:
     - params: Parameters container, see `GetBusinessConnectionParams` struct
 - Throws: Throws on errors
 - Returns: `TGBusinessConnection`
 */

    @discardableResult
    func getBusinessConnection(params: TGGetBusinessConnectionParams) async throws -> TGBusinessConnection {
        let methodURL: URI = .init(string: getMethodURL("getBusinessConnection"))
        let result: TGBusinessConnection = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
