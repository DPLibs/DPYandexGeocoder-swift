// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DPYandexGeocoder",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "DPYandexGeocoder",
            targets: ["DPYandexGeocoder"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/DPLibs/DPLogger-swift.git", from: "0.0.3")
    ],
    targets: [
        .target(
            name: "DPYandexGeocoder",
            dependencies: [
                .product(name: "DPLogger", package: "DPLogger-swift")
            ],
            path: "Sources"
        )
    ]
)
