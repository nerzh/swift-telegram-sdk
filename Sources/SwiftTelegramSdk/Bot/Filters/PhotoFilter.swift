//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `[PhotoSize]`
public class PhotoFilter: TGFilter {

    public var name: String = "photo"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let photos = message.photo else { return false }
        return !photos.isEmpty
    }
}

public extension TGFilter {
    static var photo: PhotoFilter { PhotoFilter() }
}
