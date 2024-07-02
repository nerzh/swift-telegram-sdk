// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.


/// Parameters container struct for `getFile` method
public struct TGGetFileParams: Encodable {

    /// File identifier to get information about
    public var fileId: String

    /// Custom keys for coding/decoding `GetFileParams` struct
    public enum CodingKeys: String, CodingKey {
            case fileId = "file_id"
    }

    public init(fileId: String) {
            self.fileId = fileId
    }
}


public extension TGBot {

/**
 Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.

 SeeAlso Telegram Bot API Reference:
 [GetFileParams](https://core.telegram.org/bots/api#getfile)
 
 - Parameters:
     - params: Parameters container, see `GetFileParams` struct
 - Throws: Throws on errors
 - Returns: `TGFile`
 */

    @discardableResult
    func getFile(params: TGGetFileParams) async throws -> TGFile {
        guard let methodURL: URL = .init(string: getMethodURL("getFile")) else {
            throw BotError("Bad URL: \(getMethodURL("getFile"))")
        }
        let result: TGFile = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
