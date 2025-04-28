import Testing
@testable import MiddlewareClientWithSQLCipher

@Test func testDatabaseIsSQLCipher() async throws {
    #expect(databaseVerison() == "SQLCipher 4.8.0 community")
}
