//
//  BotError
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import Foundation

public class BotError: TGErrorCommon {
    
    public var title: String = ""
    
    public enum `Type`: String, Decodable {
        case `internal`
        case network
        case server
    }

    public let type: Type
    public let description: String
    public var reason: String
    
    public required init() {
        self.type = .internal
        self.description = "\(Self.self)"
        self.reason = "\(Self.self)"
    }
    
    public required init(reason: String) {
        self.reason = reason
        self.type = .internal
        self.description = "\(Self.self)"
    }
    
    public required init(_ reason: String) {
        self.reason = reason
        self.type = .internal
        self.description = "\(Self.self)"
    }
    
    public required init(_ error: Error) {
        self.reason = error.localizedDescription
        self.type = .internal
        self.description = "\(Self.self)"
    }
    
    public init(type: Type, description: String = "<No description provided>", reason: String = "<No reason provided>") {
        self.type = type
        self.description = description
        self.reason = reason
    }

    public var localizedDescription: String {
        return """

        >>>Type: \(type)
        >>>Description: \(description)
        >>>Reason: \(reason)

        """
    }
}
