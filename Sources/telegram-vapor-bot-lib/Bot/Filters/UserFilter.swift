//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters messages to allow only those which are from specified user ID.
public class UserFilter: TGFilter {

    var userIds: Set<Int64>?
    var usernames: Set<String>?

    /**
     Init filter with user id
     */
    public init(userId: Int64) {
        self.userIds = Set<Int64>([userId])
        super.init()
    }

    /**
      Init filter which username to allow through.
     
      Note: Which username to allow through. If username starts with ‘@’ symbol, it will be ignored.
     */
    public init(username: String) {
        self.usernames = Set<String>([username])
        super.init()
    }

    /**
     Init filter with user ids
     */
    public init(userIds: [Int64]) {
        self.userIds = Set(userIds)
        super.init()
    }

    /**
     Init filter which usernames to allow through.
     
     Note: If username starts with ‘@’ symbol, it will be ignored.
     */
    public init(usernames: [String]) {
        self.usernames = Set(usernames)
        super.init()
    }

    /**
     Init filter with user id or user name
     
     Note: If username starts with ‘@’ symbol, it will be ignored.
     */
    public init(userIds: [Int64], usernames: [String]) {
        self.userIds = Set(userIds)
        self.usernames = Set(usernames)
        super.init()
    }
    
//    required init(lhs: TGFilter, rhs: TGFilter, op: Operation) {
//        super.init(lhs: lhs, rhs: rhs, op: op)
//    }
    
    public var name: String = "user"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let user = message.from else { return false }

        if let ids = userIds,
            !ids.contains(user.id) {
            return false
        }

        if let names = usernames,
            let username = user.username,
            !names.contains(username) {
            return false
        }

        return true
    }
}

public extension TGFilter {
    static func user(userId: Int64) -> TGFilter {
        return UserFilter(userId: userId)
    }

    static func user(username: String) -> TGFilter {
        return UserFilter(username: username)
    }

    static func user(userIds: [Int64]) -> TGFilter {
        return UserFilter(userIds: userIds)
    }

    static func user(usernames: [String]) -> TGFilter {
        return UserFilter(usernames: usernames)
    }

    static func user(userIds: [Int64], usernames: [String]) -> TGFilter {
        return UserFilter(userIds: userIds, usernames: usernames)
    }
}
