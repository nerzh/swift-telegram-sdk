// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the position of a clickable area within a story.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaPosition](https://core.telegram.org/bots/api#storyareaposition)
 **/
public final class TGStoryAreaPosition: Codable {

    /// Custom keys for coding/decoding `StoryAreaPosition` struct
    public enum CodingKeys: String, CodingKey {
        case xPercentage = "x_percentage"
        case yPercentage = "y_percentage"
        case widthPercentage = "width_percentage"
        case heightPercentage = "height_percentage"
        case rotationAngle = "rotation_angle"
        case cornerRadiusPercentage = "corner_radius_percentage"
    }

    /// The abscissa of the area's center, as a percentage of the media width
    public var xPercentage: Float

    /// The ordinate of the area's center, as a percentage of the media height
    public var yPercentage: Float

    /// The width of the area's rectangle, as a percentage of the media width
    public var widthPercentage: Float

    /// The height of the area's rectangle, as a percentage of the media height
    public var heightPercentage: Float

    /// The clockwise rotation angle of the rectangle, in degrees; 0-360
    public var rotationAngle: Float

    /// The radius of the rectangle corner rounding, as a percentage of the media width
    public var cornerRadiusPercentage: Float

    public init (xPercentage: Float, yPercentage: Float, widthPercentage: Float, heightPercentage: Float, rotationAngle: Float, cornerRadiusPercentage: Float) {
        self.xPercentage = xPercentage
        self.yPercentage = yPercentage
        self.widthPercentage = widthPercentage
        self.heightPercentage = heightPercentage
        self.rotationAngle = rotationAngle
        self.cornerRadiusPercentage = cornerRadiusPercentage
    }
}
