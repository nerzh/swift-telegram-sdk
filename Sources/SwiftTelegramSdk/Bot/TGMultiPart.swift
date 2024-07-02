//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation
import Logging

// MARK: Extension NSMutableData
extension NSMutableData {

    func appendString(_ string: String) throws {
        guard let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            throw BotError(reason: "Can Not Convert String: \(string) to Data")
        }
        append(data)
    }
}

public protocol NetSessionFilePrtcl {

    var fileName: String { get set }
    var data: Data { get set }
    var mimeType: String? { get set }
}

// MARK: - FileContainer

/// временный объект для хранения файлов
///
/// по-сути обертка над словарем, чтобы в checkValue этим не заниматься
private struct FileContainer {
    
    let fileName: String
    let data: Data
    let mimeType: String?
    
    init?(dictionary: [String: Any]) {
        guard let fileName = dictionary["fileName"] as? String else {
            return nil
        }
        
        guard let data = dictionary["data"] as? String else {
            return nil
        }
        
        guard let rawData = Data(base64Encoded: data) else {
            return nil
        }
        
        let mimeType = dictionary["dictionary"] as? String
        
        self.fileName = fileName
        self.data = rawData
        self.mimeType = mimeType
    }
}

// MARK: - Multipart

public class NetMultipartData {
    public var body            : NSMutableData = NSMutableData()
    private var _boundary      : String        = ""
    private var boundaryPrefix : String        = ""
    private var finishBoundary : String        = ""
    private var log: Logger
    public var boundary : String {
        set {
            _boundary      = newValue
            boundaryPrefix = "--\(newValue)\r\n"
            finishBoundary = "--\(self.boundary)--"
        }
        get { return _boundary }
    }

    public init(log: Logger) {
        self.log = log
        boundary = "Boundary-\(UUID().uuidString)"
    }

    public init(boundary: String, log: Logger) {
        self.log = log
        self.boundary = boundary
    }

    public func append(_ name: String, _ value: Any) throws {
        try body.appendString(boundaryPrefix)
        try body.appendString("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        try body.appendString("\(value)\r\n")
    }

    public func appendFile(_ name: String, _ data: Data, _ fileName: String, mimeType: String) throws {
        try body.appendString(boundaryPrefix)
        try body.appendString("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n")
        try body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        try body.appendString("\r\n")
    }

    public func finalizeBodyAndGetData() throws -> NSMutableData {
        try finalizeBody()
        return body
    }

    private func finalizeBody() throws {
        if !body.isEmpty {
            try body.appendString(finishBoundary)
        }
    }

    public func toTelegramMultipartData(_ anyObject: Dictionary<String, Any>) throws -> NSMutableData {
        func checkValue(_ parentName: String, _ anyObject: Any) throws {
            if let array = anyObject as? Array<Any> {
                do {
                    let data = try JSONSerialization.data(withJSONObject: array, options: [])
                    let json = String(decoding: data, as: UTF8.self)
                    try append(parentName, json)
                } catch {
                    log.critical("\(error.logMessage)")
                }
            } else if let dictionary = anyObject as? Dictionary<String, Any> {
                if let file = FileContainer(dictionary: dictionary) {
                    try appendFile(parentName,
                               file.data,
                               file.fileName,
                               mimeType: file.mimeType ?? "")
                } else if parentName.isEmpty {
                    for key in dictionary.keys {
                        let newNodeName = "\(key)"
                        try checkValue(newNodeName, dictionary[key]!)
                    }
                } else {
                    do {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                        let json = String(decoding: data, as: UTF8.self)
                        try append(parentName, json)
                    } catch {
                        log.critical("\(error.logMessage)")
                    }
                }
            } else {
                try append(parentName, anyObject)
            }
        }

        try checkValue("", anyObject as Any)
        return try finalizeBodyAndGetData()
    }
}

public extension Encodable {

    func toMultiPartFormData(log: Logger) throws -> (body: NSMutableData, boundary: String) {
        let encodedData = try JSONEncoder().encode(self)
        guard let dictironary: [String : Any] = try JSONSerialization.jsonObject(with: encodedData, options: []) as? [String : Any] else {
            throw BotError(reason: "Not encode to dictionary \(Self.self)")
        }
        let multipart: NetMultipartData = .init(log: log)

        return (body: try multipart.toTelegramMultipartData(dictironary), boundary: multipart.boundary)
    }
}
