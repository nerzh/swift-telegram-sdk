// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the colors of the backdrop of a unique gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftBackdropColors](https://core.telegram.org/bots/api#uniquegiftbackdropcolors)
 **/
public final class TGUniqueGiftBackdropColors: Codable {

    /// Custom keys for coding/decoding `UniqueGiftBackdropColors` struct
    public enum CodingKeys: String, CodingKey {
        case centerColor = "center_color"
        case edgeColor = "edge_color"
        case symbolColor = "symbol_color"
        case textColor = "text_color"
    }

    /// The color in the center of the backdrop in RGB format
    public var centerColor: Int

    /// The color on the edges of the backdrop in RGB format
    public var edgeColor: Int

    /// The color to be applied to the symbol in RGB format
    public var symbolColor: Int

    /// The color for the text on the backdrop in RGB format
    public var textColor: Int

    public init (centerColor: Int, edgeColor: Int, symbolColor: Int, textColor: Int) {
        self.centerColor = centerColor
        self.edgeColor = edgeColor
        self.symbolColor = symbolColor
        self.textColor = textColor
    }
}
