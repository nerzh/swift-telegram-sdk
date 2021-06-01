//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filter for any update, said "no filter"
public class AllFilter: TGFilter {
    public var name: String = "all"

    override
    public func filter(message: TGMessage) -> Bool {
        return true
    }
}

public extension TGFilter {
    static var all = AllFilter()
}
