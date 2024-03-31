// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
/// Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload_photo. The user will see a “sending photo” status for the bot.
/// We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.


/// Parameters container struct for `sendChatAction` method
public struct TGSendChatActionParams: Encodable {

    /// Unique identifier of the business connection on behalf of which the action will be sent
    public var businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread; for supergroups only
    public var messageThreadId: Int?

    /// Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_voice or upload_voice for voice notes, upload_document for general files, choose_sticker for stickers, find_location for location data, record_video_note or upload_video_note for video notes.
    public var action: String

    /// Custom keys for coding/decoding `SendChatActionParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case action = "action"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageThreadId: Int? = nil, action: String) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.action = action
    }
}


public extension TGBot {

/**
 Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
 Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload_photo. The user will see a “sending photo” status for the bot.
 We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.

 SeeAlso Telegram Bot API Reference:
 [SendChatActionParams](https://core.telegram.org/bots/api#sendchataction)
 
 - Parameters:
     - params: Parameters container, see `SendChatActionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func sendChatAction(params: TGSendChatActionParams) async throws -> Bool {
        let methodURL: URI = .init(string: getMethodURL("sendChatAction"))
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
