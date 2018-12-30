import Leaf
import Vapor
import FluentPostgreSQL

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    try services.register(LeafProvider())
    try services.register(FluentPostgreSQLProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Use Leaf for rendering views
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)

    /// PostgreSQL configurations.
    // T0D0: Move PostgreSQL configuration values to a .env.example
    let postgresConfig = PostgreSQLDatabaseConfig(hostname: "localhost",
                                                  port: 5432,
                                                  username: "rodrigopaschoaletto",
                                                  database: "zaptalkvapor",
                                                  password: nil,
                                                  transport: .cleartext)
    let postgres = PostgreSQLDatabase(config: postgresConfig)
    var databases = DatabaseConfig()
    databases.add(database: postgres, as: .psql)

    /// Database Migrations
    var migrations = MigrationConfig()
    migrations.add(model: Driver.self, database: .psql)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    services.register(databases)
    services.register(migrations)
}
