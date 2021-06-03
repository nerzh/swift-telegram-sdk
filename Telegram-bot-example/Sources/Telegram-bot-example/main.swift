import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let evetnLoop: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount * 4)
let app: Application = .init(env, Application.EventLoopGroupProvider.shared(evetnLoop))

defer { app.shutdown() }
try configure(app)
try app.run()
