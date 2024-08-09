// swift-tools-version: 5.8.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCUITestHelper",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .watchOS(.v9),
        .tvOS(.v16)
    ],
    products: [
        .library(
            name: "XCUITestHelper",
            targets: ["XCUITestHelper"])
    ],
    targets: [
        .target(
            name: "XCUITestHelper"),
        .testTarget(
            name: "XCUITestHelperTests",
            dependencies: ["XCUITestHelper"])
    ]
)
