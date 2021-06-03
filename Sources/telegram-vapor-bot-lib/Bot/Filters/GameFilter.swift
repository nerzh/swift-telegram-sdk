//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Game`
public class GameFilter: TGFilter {

    public var name: String = "forwarded"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.game != nil
    }
}

public extension TGFilter {
    static var game: GameFilter { GameFilter() }
}
