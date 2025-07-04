// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a task in a checklist.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#checklisttasksdone)
 */

public final class TGChecklistTasksAdded: Codable {
    public enum CodingKeys: String, CodingKey {
        case checklistMessage = "checklist_message"
        case tasks
    }

    /// Optional. Message containing the checklist to which the tasks were added. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public var checklistMessage: TGMessage?

    /// List of tasks added to the checklist
    public var tasks: [TGChecklistTask]

    init(checklistMessage: TGMessage? = nil, tasks: [TGChecklistTask]) {
        self.checklistMessage = checklistMessage
        self.tasks = tasks
    }
}
