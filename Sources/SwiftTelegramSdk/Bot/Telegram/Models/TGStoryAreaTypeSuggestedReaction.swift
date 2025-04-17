// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a suggested reaction. Currently, a story can have up to 5 suggested reaction areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeSuggestedReaction](https://core.telegram.org/bots/api#storyareatypesuggestedreaction)
 **/
public final class TGStoryAreaTypeSuggestedReaction: Codable {

    /// Custom keys for coding/decoding `StoryAreaTypeSuggestedReaction` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case reactionType = "reaction_type"
        case isDark = "is_dark"
        case isFlipped = "is_flipped"
    }

    /// Type of the area, always “suggested_reaction”
    public var type: TGStoryAreaTypeSuggestedReactionType

    /// Type of the reaction
    public var reactionType: TGReactionType

    /// Optional. Pass True if the reaction area has a dark background
    public var isDark: Bool?

    /// Optional. Pass True if reaction area corner is flipped
    public var isFlipped: Bool?

    public init (type: TGStoryAreaTypeSuggestedReactionType, reactionType: TGReactionType, isDark: Bool? = nil, isFlipped: Bool? = nil) {
        self.type = type
        self.reactionType = reactionType
        self.isDark = isDark
        self.isFlipped = isFlipped
    }
}
