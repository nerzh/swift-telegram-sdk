//
//  InputFile.swift
//
//
//  Created by Oleh Hudeichuk on 28.05.2021.
//

import Foundation
import Vapor

public struct TGInputFile: Encodable {
    var filename: String
    var data: Data
    var mimeType: String?

    public init(filename: String, data: Data, mimeType: String? = nil) {
        self.data = data
        self.filename = filename
        self.mimeType = mimeType
    }
}


extension TGInputFile: MultipartPartConvertible {

    public var multipart: MultipartPart? {
        guard let multipartData = data.multipart else {
            return nil
        }

        var multipart = MultipartPart(body: multipartData.body)
        multipart.filename = self.filename
        return multipart
    }

    public init?(multipart: MultipartPart) {
        guard
            let filename = multipart.filename,
            let data = Data(multipart: multipart)
        else {
            return nil
        }
        self.filename = filename
        self.data = data
        self.mimeType = multipart.headers["Content-Type"].first
    }
}
