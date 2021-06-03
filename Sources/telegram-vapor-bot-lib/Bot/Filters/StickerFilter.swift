//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Sticker`
public class StickerFilter: TGFilter {

    public var name: String = "sticker"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.sticker != nil
    }
}

public extension TGFilter {
    static var sticker: StickerFilter { StickerFilter() }
}
