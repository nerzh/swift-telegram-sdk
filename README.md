# telegram-vapor-bot-lib

### Usage

create folder with your handlers **TGHandlers/DefaultBotHandlers.swift**
```swift
import Vapor
import telegram_vapor_bot_lib

final class DefaultBotHandlers {

    static func addHandlers(app: Vapor.Application, bot: TGBotPrtcl) {
        defaultHandler(app: app, bot: bot)
        commandPingHandler(app: app, bot: bot)
    }

    private static func defaultHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGMessageHandler(filters: (.all && !.command.names(["/ping"]))) { update, bot in
            try update.message?.reply(text: "Success", bot: bot)
        }
        bot.connection.dispatcher.add(handler)
    }

    private static func commandPingHandler(app: Vapor.Application, bot: TGBotPrtcl) {
        let handler = TGCommandHandler(commands: ["/ping"]) { update, bot in
            try update.message?.reply(text: "pong", bot: bot)
        }
        bot.connection.dispatcher.add(handler)
    }
}

```

vapor **configure.swift**

```swift
/// let connection: TGConnectionPrtcl = TGLongPollingConnection()
let connection: TGConnectionPrtcl = TGWebHookConnection(webHookURL: "https://your_domain/some_webhook_route")
TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
try TGBot.shared.start()
DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)
```

vapor **routes.swift**

```swift
import Vapor
import telegram_vapor_bot_lib


func routes(_ app: Application) throws {

    app.post("some_webhook_route") { (request) -> String in
        do {
            let update: TGUpdate = try request.content.decode(TGUpdate.self)
            try TGBot.shared.connection.dispatcher.process([update])
        } catch {
            log.error(error.logMessage)
        }

        return "ok"
    }
}
```


