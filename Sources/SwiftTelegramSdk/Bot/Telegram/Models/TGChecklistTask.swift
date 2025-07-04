// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a task in a checklist.

 SeeAlso Telegram Bot API Reference:
 [ChecklistTask](https://core.telegram.org/bots/api#checklisttask)
 **/
public final class TGChecklistTask: Codable {

    /// Custom keys for coding/decoding `ChecklistTask` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case text = "text"
        case textEntities = "text_entities"
        case completedByUser = "completed_by_user"
        case completionDate = "completion_date"
    }

    /// Unique identifier of the task
    public var id: Int

    /// Text of the task
    public var text: String

    /// Optional. Special entities that appear in the task text
    public var textEntities: [TGMessageEntity]?

    /// Optional. User that completed the task; omitted if the task wasn't completed
    public var completedByUser: TGUser?

    /// Optional. Point in time (Unix timestamp) when the task was completed; 0 if the task wasn't completed
    public var completionDate: Int?

    public init (id: Int, text: String, textEntities: [TGMessageEntity]? = nil, completedByUser: TGUser? = nil, completionDate: Int? = nil) {
        self.id = id
        self.text = text
        self.textEntities = textEntities
        self.completedByUser = completedByUser
        self.completionDate = completionDate
    }
}
