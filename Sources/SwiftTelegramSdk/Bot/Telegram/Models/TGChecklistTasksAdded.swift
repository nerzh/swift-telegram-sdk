// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about tasks added to a checklist.

 SeeAlso Telegram Bot API Reference:
 [ChecklistTasksAdded](https://core.telegram.org/bots/api#checklisttasksadded)
 **/
public final class TGChecklistTasksAdded: Codable {

    /// Custom keys for coding/decoding `ChecklistTasksAdded` struct
    public enum CodingKeys: String, CodingKey {
        case checklistMessage = "checklist_message"
        case tasks = "tasks"
    }

    /// Optional. Message containing the checklist to which the tasks were added. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public var checklistMessage: TGMessage?

    /// List of tasks added to the checklist
    public var tasks: [TGChecklistTask]

    public init (checklistMessage: TGMessage? = nil, tasks: [TGChecklistTask]) {
        self.checklistMessage = checklistMessage
        self.tasks = tasks
    }
}
