// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AddaSharedModels",
    platforms: [
       .iOS(.v13),
       .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AddaSharedModels",
            targets: ["AddaSharedModels"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.67.1"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.4.0"),
        .package(url: "https://github.com/vapor/fluent-mongo-driver.git", from: "1.1.2"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.2.1"),
        
        // Route
        .package(url: "https://github.com/pointfreeco/vapor-routing.git", from: "0.1.2"),
        .package(url: "https://github.com/pointfreeco/swift-url-routing.git", from: "0.4.0"),
        .package(url: "https://github.com/OpenKitten/BSON.git", from: "7.0.0")
    
    ],
    targets: [
        .target(
            name: "AddaSharedModels",
            dependencies: [
                .product(
                    name: "Vapor",
                    package: "vapor",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "Fluent",
                    package: "fluent",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "FluentMongoDriver",
                    package: "fluent-mongo-driver",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "VaporRouting",
                    package: "vapor-routing",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                .product(
                    name: "JWT",
                    package: "jwt",
                    condition: .when(platforms: [.macOS, .linux])
                ),
                
                // IOS
                .product(
                    name: "URLRouting",
                    package: "swift-url-routing",
                    condition: .when(platforms: [.iOS])
                ),
                
                .product(
                    name: "BSON",
                    package: "BSON"
                )
                
            ]
        ),
        .testTarget(
            name: "AddaSharedModelsTests",
            dependencies: ["AddaSharedModels"]
        ),
    ]
)
