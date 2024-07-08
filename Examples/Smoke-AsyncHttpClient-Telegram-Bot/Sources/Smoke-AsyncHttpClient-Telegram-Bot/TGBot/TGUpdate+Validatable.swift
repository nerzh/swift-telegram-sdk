//
//  TGUpdate+Validatable.swift
//  Smoke-AsyncHttpClient-bot-example
//
//  Created by Maxim Lanskoy on 07.07.2024.
//

import SmokeOperationsHTTP1
import SmokeOperations
import SwiftTelegramSdk

public struct EmptyQuery: Decodable {}
public struct EmptyPath: Decodable {}
public struct EmptyHeaders: Decodable {}

extension TGUpdate: ValidatableOperationHTTP1InputProtocol {
    public typealias QueryType = EmptyQuery
    public typealias PathType = EmptyPath
    public typealias BodyType = TGUpdate
    public typealias HeadersType = EmptyHeaders

    public static func compose(queryDecodableProvider: () throws -> EmptyQuery,
                               pathDecodableProvider: () throws -> EmptyPath,
                               bodyDecodableProvider: () throws -> TGUpdate,
                               headersDecodableProvider: () throws -> EmptyHeaders) throws -> TGUpdate {
        return try bodyDecodableProvider()
    }

    public func validate() throws {
        // Add any necessary validation logic here
    }
}
