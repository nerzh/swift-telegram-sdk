// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Deletes a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns True on success.


/// Parameters container struct for `deleteStory` method
public struct TGDeleteStoryParams: Encodable {

    /// Unique identifier of the business connection
    public var businessConnectionId: String

    /// Unique identifier of the story to delete
    public var storyId: Int

    /// Custom keys for coding/decoding `DeleteStoryParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case storyId = "story_id"
    }

    public init(businessConnectionId: String, storyId: Int) {
            self.businessConnectionId = businessConnectionId
            self.storyId = storyId
    }
}


public extension TGBot {

/**
 Deletes a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteStoryParams](https://core.telegram.org/bots/api#deletestory)
 
 - Parameters:
     - params: Parameters container, see `DeleteStoryParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteStory(params: TGDeleteStoryParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteStory")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteStory"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
