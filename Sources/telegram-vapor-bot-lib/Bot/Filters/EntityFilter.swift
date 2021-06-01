//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters messages to only allow those which have a `MessageEntity` where their type matches `type`.
public class EntityFilter: TGFilter {

    let entityTypes: Set<TGMessageEntityType>

    public init(types: [TGMessageEntityType]) {
        self.entityTypes = Set(types)
        super.init()
    }

    public var name: String = "entity"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let entities = message.entities else { return false }
        let incomingTypes = entities.map { $0.type }
        return !entityTypes.isDisjoint(with: incomingTypes)
    }
}

public extension TGFilter {
    static func entity(types: [TGMessageEntityType]) -> TGFilter {
        return EntityFilter(types: types)
    }
}
