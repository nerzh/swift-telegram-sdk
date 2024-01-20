// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object describes the bot's menu button in a private chat. It should be one of
 MenuButtonCommands
 MenuButtonWebApp
 MenuButtonDefault
 If a menu button other than MenuButtonDefault is set for a private chat, then it is applied in the chat. Otherwise the default menu button is applied. By default, the menu button opens the list of bot commands.

 SeeAlso Telegram Bot API Reference:
 [MenuButton](https://core.telegram.org/bots/api#menubutton)
 **/
public enum TGMenuButton: Codable {
    case menuButtonCommands(TGMenuButtonCommands)
    case menuButtonWebApp(TGMenuButtonWebApp)
    case menuButtonDefault(TGMenuButtonDefault)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGMenuButtonCommands.self) {
            self = .menuButtonCommands(value)
        } else if let value = try? container.decode(TGMenuButtonWebApp.self) {
            self = .menuButtonWebApp(value)
        } else if let value = try? container.decode(TGMenuButtonDefault.self) {
            self = .menuButtonDefault(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE MenuButton.")
        }
    }
}
