import Vapor
import TelegramVaporBot

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let evetnLoop: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount * 4)
let app: Application = .init(env, Application.EventLoopGroupProvider.shared(evetnLoop))
let TGBOT: TGBotConnection = .init()

defer { app.shutdown() }
try await configure(app)
try app.run()
