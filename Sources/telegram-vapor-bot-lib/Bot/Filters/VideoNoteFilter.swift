//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `VideoNote`
public class VideoNoteFilter: TGFilter {

    public var name: String = "video_note"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.videoNote != nil
    }
}

public extension TGFilter {
    static var videoNote = VideoNoteFilter()
}
