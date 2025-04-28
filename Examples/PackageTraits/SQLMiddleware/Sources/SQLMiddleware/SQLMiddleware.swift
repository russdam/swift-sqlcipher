#if canImport(SQLCipher)
import SQLCipher
#else
import SQLite3
#endif

public func middlewareDatabaseType() -> String? {
    #if canImport(SQLCipher)
    let dbtype = "SQLCipher"
    let sql = "PRAGMA cipher_version;"
    #else
    let dbtype = "SQLite3"
    let sql = "SELECT sqlite_version();"
    #endif
    let version = queryString(sql: sql)
    return "\(dbtype) \(version ?? "unknown")"
}

public func queryString(sql: String, databasePath: String = ":memory:") -> String? {
    var db: OpaquePointer?
    var result: String?
    
    if sqlite3_open(databasePath, &db) == SQLITE_OK {
        defer { sqlite3_close(db) }
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, sql, -1, &statement, nil) == SQLITE_OK {
            defer { sqlite3_finalize(statement) }
            if sqlite3_step(statement) == SQLITE_ROW {
                if let cString = sqlite3_column_text(statement, 0) {
                    result = String(cString: cString)
                }
            }
        }
    }
 
    return result   
}

