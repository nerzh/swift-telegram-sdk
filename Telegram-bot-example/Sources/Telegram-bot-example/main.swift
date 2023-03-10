import Vapor
import TelegramVaporBot

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let evetnLoop: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount * 4)
let app: Application = .init(env, Application.EventLoopGroupProvider.shared(evetnLoop))
var TGBotConnection: TGConnectionPrtcl!

defer { app.shutdown() }
try configure(app)
try app.run()
