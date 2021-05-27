//
//  TelegramEncodables.swift
//  App
//
//  Created by Givi Pataridze on 07.04.2018.
//

import Foundation
import Vapor
//import TelegrammerMultipart
import struct NIO.ByteBufferAllocator

/// Represent Telegram type, which will be encoded as Json on sending to server
extension Encodable {
    func encodeBody() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

/// Represent Telegram type, which will be encoded as multipart/form-data on sending to server
protocol MultipartEncodable: Encodable {}

extension MultipartEncodable {
    func encodeBody(boundary: String) throws -> ByteBuffer {
        let encoder = FormDataEncoder()
        var buffer = ByteBufferAllocator().buffer(capacity: 0)
        try encoder.encode(self, boundary: boundary, into: &buffer)
        return buffer
    }
}
