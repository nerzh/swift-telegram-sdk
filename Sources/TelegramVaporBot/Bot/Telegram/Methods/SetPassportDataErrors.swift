// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.
/// Use this if the data submitted by the user doesn't satisfy the standards your service requires for any reason. For example, if a birthday date seems invalid, a submitted document is blurry, a scan shows evidence of tampering, etc. Supply some details in the error message to make sure the user knows how to correct the issues.


/// Parameters container struct for `setPassportDataErrors` method
public struct TGSetPassportDataErrorsParams: Encodable {

    /// User identifier
    public var userId: Int64

    /// A JSON-serialized array describing the errors
    public var errors: [TGPassportElementError]

    /// Custom keys for coding/decoding `SetPassportDataErrorsParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case errors = "errors"
    }

    public init(userId: Int64, errors: [TGPassportElementError]) {
            self.userId = userId
            self.errors = errors
    }
}


public extension TGBot {

/**
 Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.
 Use this if the data submitted by the user doesn't satisfy the standards your service requires for any reason. For example, if a birthday date seems invalid, a submitted document is blurry, a scan shows evidence of tampering, etc. Supply some details in the error message to make sure the user knows how to correct the issues.

 SeeAlso Telegram Bot API Reference:
 [SetPassportDataErrorsParams](https://core.telegram.org/bots/api#setpassportdataerrors)
 
 - Parameters:
     - params: Parameters container, see `SetPassportDataErrorsParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */

    @discardableResult
    func setPassportDataErrors(params: TGSetPassportDataErrorsParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("setPassportDataErrors"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
