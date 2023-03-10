//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

public class TGFilter {

    public enum Operation {
        case and
        case or
        case not
    }

    public typealias Compound = (lhs: TGFilter, rhs: TGFilter, op: Operation)

    private var compoundFilter: Compound? = nil

    public init() {}
    
    init(lhs: TGFilter, rhs: TGFilter, op: Operation) {
        compoundFilter = (lhs: lhs, rhs: rhs, op: op)
    }

    public func check(_ mess: TGMessage) -> Bool {
        if let filter = compoundFilter {
            switch filter.op {
            case .and:
                return (filter.lhs).check(mess) && (filter.rhs).check(mess)
            case .or:
                return (filter.lhs).check(mess) || (filter.rhs).check(mess)
            case .not:
                return !(filter.rhs).check(mess)
            }
        } else {
            return self.filter(message: mess)
        }
    }

    public func filter(message: TGMessage) -> Bool {
        return false
    }

    public static func &&(lhs: TGFilter, rhs: TGFilter) -> TGFilter {
        return TGFilter(lhs: lhs, rhs: rhs, op: .and)
    }

    public static func ||(lhs: TGFilter, rhs: TGFilter) -> TGFilter {
        return TGFilter(lhs: lhs, rhs: rhs, op: .or)
    }

    public static prefix func !(filter: TGFilter) -> TGFilter {
        return TGFilter(lhs: filter, rhs: filter, op: .not)
    }
}
