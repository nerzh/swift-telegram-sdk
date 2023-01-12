//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Location`
public class LocationFilter: TGFilter {

    public var name: String = "location"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.location != nil
    }
}

public extension TGFilter {
    static var location: LocationFilter { LocationFilter() }
}
