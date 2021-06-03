//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters media messages to only allow those which have a `MessageEntity` where their type matches `type`.
public class CaptionEntityFilter: TGFilter {

    var entityType: TGMessageEntityType

    public init(type: TGMessageEntityType) {
        self.entityType = type
        super.init()
    }

    public var name: String = "caption_entity"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let entities = message.entities else { return false }
        return entities.contains(where: { (entity) -> Bool in
            return entity.type == entityType
        })
    }
}

public extension TGFilter {
    static func captionEntity(type: TGMessageEntityType) -> CaptionEntityFilter {
        return CaptionEntityFilter(type: type)
    }
}
