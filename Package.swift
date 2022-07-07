// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AddaSharedModels",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AddaSharedModels",
            targets: ["AddaSharedModels"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.62.1"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.4.0"),
        .package(url: "https://github.com/vapor/fluent-mongo-driver.git", from: "1.1.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AddaSharedModels",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentMongoDriver", package: "fluent-mongo-driver"),
                .product(name: "Vapor", package: "vapor")
            ]),
        .testTarget(
            name: "AddaSharedModelsTests",
            dependencies: ["AddaSharedModels"]),
    ]
)
