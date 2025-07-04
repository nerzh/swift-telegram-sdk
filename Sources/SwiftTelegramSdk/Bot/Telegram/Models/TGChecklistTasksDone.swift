// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about checklist tasks marked as done or not done.

 SeeAlso Telegram Bot API Reference:
 [ChecklistTasksDone](https://core.telegram.org/bots/api#checklisttasksdone)
 **/
public final class TGChecklistTasksDone: Codable {

    /// Custom keys for coding/decoding `ChecklistTasksDone` struct
    public enum CodingKeys: String, CodingKey {
        case checklistMessage = "checklist_message"
        case markedAsDoneTaskIds = "marked_as_done_task_ids"
        case markedAsNotDoneTaskIds = "marked_as_not_done_task_ids"
    }

    /// Optional. Message containing the checklist whose tasks were marked as done or not done. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public var checklistMessage: TGMessage?

    /// Optional. Identifiers of the tasks that were marked as done
    public var markedAsDoneTaskIds: [Int]?

    /// Optional. Identifiers of the tasks that were marked as not done
    public var markedAsNotDoneTaskIds: [Int]?

    public init (checklistMessage: TGMessage? = nil, markedAsDoneTaskIds: [Int]? = nil, markedAsNotDoneTaskIds: [Int]? = nil) {
        self.checklistMessage = checklistMessage
        self.markedAsDoneTaskIds = markedAsDoneTaskIds
        self.markedAsNotDoneTaskIds = markedAsNotDoneTaskIds
    }
}
