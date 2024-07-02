//
//  TelegramContainer.swift
//  App
//
//  Created by Givi Pataridze on 25.02.2018.
//

/// This object represents a Telegram server response container.
public struct TGTelegramContainer<T: Decodable>: Decodable {

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case result = "result"
        case description = "description"
        case errorCode = "error_code"
        case parameters = "parameters"
    }

    public var ok: Bool
    public var result: T?
    public var description: String?
    public var errorCode: Int?
    public var parameters: TGResponseParameters?

    public init (ok: Bool, result: T?, description: String?, errorCode: Int?, parameters: TGResponseParameters?) {
        self.ok = ok
        self.result = result
        self.description = description
        self.errorCode = errorCode
        self.parameters = parameters
    }
}
