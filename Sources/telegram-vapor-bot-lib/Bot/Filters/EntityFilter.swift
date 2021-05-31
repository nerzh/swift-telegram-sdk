//
//  EntityFilter.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import Foundation

/// Filters messages to only allow those which have a `MessageEntity` where their type matches `type`.
public struct EntityFilter: Filter {

    let entityTypes: Set<TGMessageEntityType>

    public init(types: [TGMessageEntityType]) {
        self.entityTypes = Set(types)
    }

    public var name: String = "entity"

    public func filter(message: TGMessage) -> Bool {
        guard let entities = message.entities else { return false }
        let incomingTypes = entities.map { $0.type }
        return !entityTypes.isDisjoint(with: incomingTypes)
    }
}

public extension Filters {
    static func entity(types: [TGMessageEntityType]) -> Filters {
        return Filters(filter: EntityFilter(types: types))
    }
}
