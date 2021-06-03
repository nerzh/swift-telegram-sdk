//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters messages to allow only those which are from specified chat ID.
public class ChatFilter: TGFilter {

    var chatId: Int64
    var username: String?

    public init(chatId: Int64, username: String? = nil) {
        self.chatId = chatId
        self.username = username
        super.init()
    }

    public var name: String = "chat"

    override
    public func filter(message: TGMessage) -> Bool {
        guard message.chat.id == chatId else { return false }
        guard let desiredUsername = username else { return true }
        guard let incomingUsername = message.chat.username else { return true }
        return desiredUsername == incomingUsername
    }
}

public extension TGFilter {
    static func chat(chatId: Int64, username: String? = nil) -> ChatFilter {
        return ChatFilter(chatId: chatId, username: username)
    }
}
