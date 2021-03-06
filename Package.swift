// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FileSorter",
  products: [
    .executable(name: "sorter", targets: ["FileSorter"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.5.0")),
    .package(url: "https://github.com/apple/swift-log", from: "1.4.2"),
  ],
  targets: [
    .target(
      name: "FileSorter",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "Logging", package: "swift-log"),
      ]),
  ]
)
