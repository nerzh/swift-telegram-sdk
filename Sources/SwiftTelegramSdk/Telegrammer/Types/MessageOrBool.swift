//
//  MessageOrBool.swift
//  App
//
//  Created by Givi Pataridze on 28.02.2018.
//

/// Sometimes bot methods returns objects On success, otherwise returns False
public enum TGMessageOrBool: Codable {
    case message(TGMessage)
    case bool(Bool)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value):
            try container.encode(value)
        case .message(let message):
            try container.encode(message)
        }
    }

    public init(from decoder: Decoder) throws {
        if let value = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .bool(value)
        } else {
            let message = try decoder.singleValueContainer().decode(TGMessage.self)
            self = .message(message)
        }
    }
}
