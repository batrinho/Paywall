// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Paywall",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Paywall",
            targets: ["Paywall"]),
    ],
    dependencies: [
        .package(url: "https://github.com/batrinho/Domain.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Paywall",
            dependencies: [
                "Domain"
            ]),
        .testTarget(
            name: "PaywallTests",
            dependencies: ["Paywall"]),
    ]
)
