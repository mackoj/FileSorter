// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DateSorter",
    products: [
      .executable(name: "sorter", targets: ["DateSorter"])
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.5.0")),
      .package(url: "https://github.com/apple/swift-log", from: "1.4.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DateSorter",
          dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "Logging", package: "swift-log"),
          ]),
    ]
)
