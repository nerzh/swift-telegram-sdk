//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Messages that contain `Document`
public class DocumentFilter: TGFilter {

    public var name: String = "document"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.document != nil
    }
}

public extension TGFilter {
    static var document: DocumentFilter { DocumentFilter() }
}
