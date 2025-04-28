// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "MiddlewareClientWithoutSQLCipher",
    products: [
        .library(name: "MiddlewareClientWithoutSQLCipher",
            targets: ["MiddlewareClientWithoutSQLCipher"])
    ],
    dependencies: [
        .package(path: "../SQLMiddleware")
    ],
    targets: [
        .target(name: "MiddlewareClientWithoutSQLCipher", dependencies: [
            .product(name: "SQLMiddleware", package: "SQLMiddleware")
        ]),
        .testTarget(name: "MiddlewareClientWithoutSQLCipherTests",
            dependencies: ["MiddlewareClientWithoutSQLCipher"])
    ]
)
