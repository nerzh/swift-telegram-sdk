// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Posts a story on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success.


/// Parameters container struct for `postStory` method
public struct TGPostStoryParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Content of the story
    public var content: TGInputStoryContent

    /// Period after which the story is moved to the archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400
    public var activePeriod: Int

    /// Caption of the story, 0-2048 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the story caption. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// A JSON-serialized list of clickable areas to be shown on the story
    public var areas: [TGStoryArea]?

    /// Pass True to keep the story accessible after it expires
    public var postToChatPage: Bool?

    /// Pass True if the content of the story must be protected from forwarding and screenshotting
    public var protectContent: Bool?

    /// Custom keys for coding/decoding `PostStoryParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case content = "content"
            case activePeriod = "active_period"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case areas = "areas"
            case postToChatPage = "post_to_chat_page"
            case protectContent = "protect_content"
    }

    public init(businessConnectionId: String, content: TGInputStoryContent, activePeriod: Int, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, areas: [TGStoryArea]? = nil, postToChatPage: Bool? = nil, protectContent: Bool? = nil) {
            self.businessConnectionId = businessConnectionId
            self.content = content
            self.activePeriod = activePeriod
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.areas = areas
            self.postToChatPage = postToChatPage
            self.protectContent = protectContent
    }
}


public extension TGBot {

/**
 Posts a story on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success.

 SeeAlso Telegram Bot API Reference:
 [PostStoryParams](https://core.telegram.org/bots/api#poststory)
 
 - Parameters:
     - params: Parameters container, see `PostStoryParams` struct
 - Throws: Throws on errors
 - Returns: `TGStory`
 */

    @discardableResult
    func postStory(params: TGPostStoryParams) async throws -> TGStory {
        guard let methodURL: URL = .init(string: getMethodURL("postStory")) else {
            throw BotError("Bad URL: \(getMethodURL("postStory"))")
        }
        let result: TGStory = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
