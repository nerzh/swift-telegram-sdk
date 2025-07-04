// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a task in a checklist.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#checklisttasksdone)
 */

public final class TGChecklistTasksDone: Codable {
    public enum CodingKeys: String, CodingKey {
        case checklistMessage = "checklist_message"
        case markedAsDoneTaskIds = "marked_as_done_task_ids"
        case markedAsNotDoneTaskIds = "marked_as_not_done_task_ids"
    }

    /// Optional. Message containing the checklist whose tasks were marked as done or not done. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public var checklistMessage: TGMessage?

    /// Optional. Identifiers of the tasks that were marked as done
    public var markedAsDoneTaskIds: [Int64]?
    
    /// Optional. Identifiers of the tasks that were marked as not done
    public var markedAsNotDoneTaskIds: [Int64]?

    init(checklistMessage: TGMessage? = nil, markedAsDoneTaskIds: [Int64]? = nil, markedAsNotDoneTaskIds: [Int64]? = nil) {
        self.checklistMessage = checklistMessage
        self.markedAsDoneTaskIds = markedAsDoneTaskIds
        self.markedAsNotDoneTaskIds = markedAsNotDoneTaskIds
    }
}
