// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a checklist to create.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#inputchecklist)
 */

public final class TGInputChecklist: Codable {
  public enum CodingKeys: String, CodingKey {
    case title = "title"
    case parseMode = "parse_mode"
    case titleEntities = "title_entities"
    case tasks = "tasks"
    case othersCanAddTasks = "others_can_add_tasks"
    case othersCanMarkTasksAsDone = "others_can_mark_tasks_as_done"
  }

  
  /// Title of the checklist; 1-255 characters after entities parsing
  public var title: String
  
  /// Optional. Mode for parsing entities in the title. See formatting options for more details.
  public var parseMode: TGParseMode?
  
  /// Optional. List of special entities that appear in the title, which can be specified instead of parse_mode. Currently, only bold, italic, underline, strikethrough, spoiler, and custom_emoji entities are allowed.
  public var titleEntities: [TGMessageEntity]?
  
  /// List of 1-30 tasks in the checklist
  public var tasks: [TGInputChecklistTask]

  /// Optional. Pass True if other users can add tasks to the checklist
  public var othersCanAddTasks: Bool?
  
  /// Optional. Pass True if other users can mark tasks as done or not done in the checklist
  public var othersCanMarkTasksAsDone: Bool?
}
