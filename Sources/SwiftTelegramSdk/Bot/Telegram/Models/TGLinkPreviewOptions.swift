// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the options used for link preview generation.

 SeeAlso Telegram Bot API Reference:
 [LinkPreviewOptions](https://core.telegram.org/bots/api#linkpreviewoptions)
 **/
public final class TGLinkPreviewOptions: Codable {

    /// Custom keys for coding/decoding `LinkPreviewOptions` struct
    public enum CodingKeys: String, CodingKey {
        case isDisabled = "is_disabled"
        case url = "url"
        case preferSmallMedia = "prefer_small_media"
        case preferLargeMedia = "prefer_large_media"
        case showAboveText = "show_above_text"
    }

    /// Optional. True, if the link preview is disabled
    public var isDisabled: Bool?

    /// Optional. URL to use for the link preview. If empty, then the first URL found in the message text will be used
    public var url: String?

    /// Optional. True, if the media in the link preview is supposed to be shrunk; ignored if the URL isn't explicitly specified or media size change isn't supported for the preview
    public var preferSmallMedia: Bool?

    /// Optional. True, if the media in the link preview is supposed to be enlarged; ignored if the URL isn't explicitly specified or media size change isn't supported for the preview
    public var preferLargeMedia: Bool?

    /// Optional. True, if the link preview must be shown above the message text; otherwise, the link preview will be shown below the message text
    public var showAboveText: Bool?

    public init (isDisabled: Bool? = nil, url: String? = nil, preferSmallMedia: Bool? = nil, preferLargeMedia: Bool? = nil, showAboveText: Bool? = nil) {
        self.isDisabled = isDisabled
        self.url = url
        self.preferSmallMedia = preferSmallMedia
        self.preferLargeMedia = preferLargeMedia
        self.showAboveText = showAboveText
    }
}
