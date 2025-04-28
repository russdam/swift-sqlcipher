// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "SQLMiddleware",
    products: [
        .library(name: "SQLMiddleware", targets: ["SQLMiddleware"]),
    ],
    traits: [
        .trait(name: "SQLCipher", description: "Use the SQLCipher library rather than the vendored SQLite")
    ],
    dependencies: [
        .package(path: "../../..")
    ],
    targets: [
        .target(name: "SQLMiddleware", dependencies: [
            // target only depends on SQLCipher when the "SQLCipher" trait is activated by a dependent package
            // otherwise it will default to using the system "SQLite3" framework
            .product(name: "SQLCipher", package: "swift-sqlcipher", condition: .when(traits: ["SQLCipher"]))
        ])
    ]
)
