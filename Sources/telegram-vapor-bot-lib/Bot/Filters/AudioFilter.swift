//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Audio`
public class AudioFilter: TGFilter {
    public var name: String = "audio"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.audio != nil
    }
}

public extension TGFilter {
    static var audio = AudioFilter()
}
