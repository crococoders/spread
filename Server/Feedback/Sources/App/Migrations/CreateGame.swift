import Fluent

struct CreateGame: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("games")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("games").delete()
    }
}
