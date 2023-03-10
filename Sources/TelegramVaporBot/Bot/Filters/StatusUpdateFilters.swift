//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/**
 Subset struct for messages containing a status update.
 
 Use these filters like: `StatusUpdateFilters.newChatMembers` etc.
 */
public struct StatusUpdateFilters {
    /// Messages that contain Message.groupChatCreated, Message.supergroupChatCreated or Message.channelChatCreated
    public static var chatCreated: ChatCreatedFilter { return ChatCreatedFilter() }

    /// Messages that contain Message.deleteChatPhoto
    public static var deleteChatPhoto: DeleteChatPhotoFilter { return DeleteChatPhotoFilter() }

    /// Messages that contain Message.leftChatMember
    public static var leftChatMember: LeftChatMemberFilter { return LeftChatMemberFilter() }

    /// Messages that contain Message.migrateFromChatId
    public static var migrate: MigrateFilter { return MigrateFilter() }

    /// Messages that contain Message.newChatMembers
    public static var newChatMembers: NewChatMembersFilter { return NewChatMembersFilter() }

    /// Messages that contain Message.newChatPhoto
    public static var newChatPhoto: NewChatPhotoFilter { return NewChatPhotoFilter() }

    /// Messages that contain Message.newChatTitle
    public static var newChatTitle: NewChatTitleFilter { return NewChatTitleFilter() }

    /// Messages that contain Message.pinnedMessage
    public static var pinnedMessage: PinnedMessageFilter { return PinnedMessageFilter() }
}

/// Messages that contain Message.groupChatCreated, Message.supergroupChatCreated or Message.channelChatCreated
public class ChatCreatedFilter: TGFilter {

    public var name: String = "chat_created"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.channelChatCreated != nil ||
            message.supergroupChatCreated != nil ||
            message.channelChatCreated != nil
    }
}

/// Messages that contain Message.deleteChatPhoto
public class DeleteChatPhotoFilter: TGFilter {

    public var name: String = "delete_chat_photo"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.deleteChatPhoto != nil
    }
}

/// Messages that contain Message.leftChatMember
public class LeftChatMemberFilter: TGFilter {

    public var name: String = "left_chat_member"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.leftChatMember != nil
    }
}

/// Messages that contain Message.migrateFromChatId
public class MigrateFilter: TGFilter {

    public var name: String = "migrate"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.migrateFromChatId != nil ||
            message.migrateToChatId != nil
    }
}

/// Messages that contain Message.newChatMembers
public class NewChatMembersFilter: TGFilter {

    public var name: String = "new_chat_members"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.newChatMembers != nil
    }
}

/// Messages that contain Message.newChatPhoto
public class NewChatPhotoFilter: TGFilter {

    public var name: String = "new_chat_photo"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let photos = message.newChatPhoto else { return false }
        return !photos.isEmpty
    }
}

/// Messages that contain Message.newChatTitle
public class NewChatTitleFilter: TGFilter {

    public var name: String = "new_chat_title"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.newChatTitle != nil
    }
}

/// Messages that contain Message.pinnedMessage
public class PinnedMessageFilter: TGFilter {

    public var name: String = "pinned_message"

    override
    public func filter(message: TGMessage) -> Bool {
        return message.pinnedMessage != nil
    }
}
