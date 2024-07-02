//
//  InputFile.swift
//
//
//  Created by Oleh Hudeichuk on 28.05.2021.
//

import Foundation

public struct TGInputFile: Codable {
    var fileName: String
    var data: Data
    var mimeType: String?

    public init(filename: String, data: Data, mimeType: String? = nil) {
        self.data = data
        self.fileName = filename
        self.mimeType = mimeType
    }
}
