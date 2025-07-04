// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a task in a checklist.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#checklisttask)
 */

public final class TGChecklistTask: Codable {
    public enum CodingKeys: String, CodingKey {
        case id
        case text
        case textEntities = "text_entities"
        case completedByUser = "completed_by_user"
        case completionDate = "completion_date"
    }

    /// Unique identifier of the task
    public var id: Int64

    /// Text of the task
    public var text: String

    /// Optional. Special entities that appear in the task text
    public var textEntities: [TGMessageEntity]?

    /// Optional. User that completed the task; omitted if the task wasn't completed
    public var completedByUser: TGUser?

    /// Optional. Point in time (Unix timestamp) when the task was completed; 0 if the task wasn't completed
    public var completionDate: Int

    init(id: Int64, text: String, textEntities: [TGMessageEntity]? = nil, completedByUser: TGUser? = nil, completionDate: Int) {
        self.id = id
        self.text = text
        self.textEntities = textEntities
        self.completedByUser = completedByUser
        self.completionDate = completionDate
    }
}
