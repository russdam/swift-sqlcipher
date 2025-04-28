import Testing
@testable import MiddlewareClientWithoutSQLCipher

@Test func testDatabaseIsSQLite() async throws {
    #expect(databaseVersion() == "SQLite3 3.43.2")
}
