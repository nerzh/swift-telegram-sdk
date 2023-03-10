//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Vanue`
public class VenueFilter: TGFilter {

    public var name: String = "venue"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.venue != nil
    }
}

public extension TGFilter {
    static var venue: VenueFilter { VenueFilter() }
}
