//
//  String+Helper.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 22.04.2018.
//

import Foundation
import Logging
import SwiftRegularExpression
#if canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#endif

public extension String {

    static func random(ofLength length: Int) -> String {
        return random(minimumLength: length, maximumLength: length)
    }

    static func random(minimumLength min: Int, maximumLength max: Int) -> String {
        return random(
            withCharactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
            minimumLength: min,
            maximumLength: max
        )
    }

    static func random(withCharactersInString string: String, ofLength length: Int) -> String {
        return random(
            withCharactersInString: string,
            minimumLength: length,
            maximumLength: length
        )
    }

    static func random(
        withCharactersInString string: String,
        minimumLength min: Int,
        maximumLength max: Int
    ) -> String {
        guard min > 0 && max >= min else {
            return ""
        }

        let length: Int = (min < max) ? .random(min...max) : max
        var randomString = ""

        (1...length).forEach { _ in
            let randomIndex: Int = .random(0..<string.count)
            let c = string.index(string.startIndex, offsetBy: randomIndex)
            randomString += String(string[c])
        }

        return randomString
    }
}

public extension Int {
    static func random(_ range: Range<Int>) -> Int {
        return random(range.lowerBound, range.upperBound - 1)
    }

    static func random(_ range: ClosedRange<Int>) -> Int {
        return random(range.lowerBound, range.upperBound)
    }

    static func random(_ lower: Int = 0, _ upper: Int = 100) -> Int {
        #if canImport(Glibc)
        return Int(Glibc.random() % (upper - lower + 1))
        #elseif canImport(Musl)
        return Int(Musl.random() % (upper - lower + 1))
        #else
        return Int(arc4random_uniform(UInt32(upper - lower + 1)))
        #endif
    }
}

public extension String {
    func matchRegexp(pattern: String) -> Bool {
        self.regexp(pattern).keys.count > 0
    }
}

public extension String {
    var logMessage: Logger.Message {
        return Logger.Message(stringLiteral: self)
    }
}
