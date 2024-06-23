//
//  VaporInputFile.swift
//  
//
//  Created by Yakov Shapovalov on 27.06.2024.
//

import TelegramBotKit
import Vapor

extension TGInputFile: @retroactive MultipartPartConvertible {

    public var multipart: MultipartPart? {
        guard let multipartData = data.multipart else {
            return nil
        }

        var multipart = MultipartPart(body: multipartData.body)
        multipart.filename = self.fileName
        return multipart
    }

    public init?(multipart: MultipartPart) {
        guard
            let fileName = multipart.filename,
            let data = Data(multipart: multipart)
        else {
            return nil
        }
        self.init(
            filename: fileName,
            data: data,
            mimeType: multipart.headers["Content-Type"].first
        )
    }
}
