// swift-tools-version:5.9
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
        // Route
        .package(url: "https://github.com/pointfreeco/swift-url-routing.git", from: "0.6.0"),
        .package(url: "https://github.com/OpenKitten/BSON.git", from: "7.0.0")
    
    ],
    targets: [
        .target(
            name: "AddaSharedModels",
            dependencies: [
                .product(name: "URLRouting", package: "swift-url-routing"),
                .product(name: "BSON", package: "BSON")
            ]
        )
    ]
)
