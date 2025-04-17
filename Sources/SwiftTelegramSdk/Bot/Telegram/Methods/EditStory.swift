// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Edits a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success.


/// Parameters container struct for `editStory` method
public struct TGEditStoryParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Unique identifier of the story to edit
    public var storyId: Int

    /// Content of the story
    public var content: TGInputStoryContent

    /// Caption of the story, 0-2048 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the story caption. See formatting options for more details.
    public var parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// A JSON-serialized list of clickable areas to be shown on the story
    public var areas: [TGStoryArea]?

    /// Custom keys for coding/decoding `EditStoryParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case storyId = "story_id"
            case content = "content"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case areas = "areas"
    }

    public init(businessConnectionId: String, storyId: Int, content: TGInputStoryContent, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, areas: [TGStoryArea]? = nil) {
            self.businessConnectionId = businessConnectionId
            self.storyId = storyId
            self.content = content
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.areas = areas
    }
}


public extension TGBot {

/**
 Edits a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success.

 SeeAlso Telegram Bot API Reference:
 [EditStoryParams](https://core.telegram.org/bots/api#editstory)
 
 - Parameters:
     - params: Parameters container, see `EditStoryParams` struct
 - Throws: Throws on errors
 - Returns: `TGStory`
 */

    @discardableResult
    func editStory(params: TGEditStoryParams) async throws -> TGStory {
        guard let methodURL: URL = .init(string: getMethodURL("editStory")) else {
            throw BotError("Bad URL: \(getMethodURL("editStory"))")
        }
        let result: TGStory = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
