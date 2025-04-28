// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "MiddlewareClientWithSQLCipher",
    products: [
        .library(name: "MiddlewareClientWithSQLCipher",
            targets: ["MiddlewareClientWithSQLCipher"])
    ],
    dependencies: [
        .package(path: "../SQLMiddleware", traits: ["SQLCipher"])
    ],
    targets: [
        .target(name: "MiddlewareClientWithSQLCipher", dependencies: [
            .product(name: "SQLMiddleware", package: "SQLMiddleware")
        ]),
        .testTarget(name: "MiddlewareClientWithSQLCipherTests",
            dependencies: ["MiddlewareClientWithSQLCipher"])
    ]
)
