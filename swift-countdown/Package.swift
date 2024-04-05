// swift-tools-version:5.9
import PackageDescription
let package = Package(
    name: "maji-countdown",
    products: [
        .executable(name: "maji-countdown", targets: ["maji-countdown"])
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.18.0")
    ],
    targets: [
        .executableTarget(
            name: "maji-countdown",
            dependencies: [
                "maji-countdownLibrary",
                .product(name: "JavaScriptKit", package: "JavaScriptKit")
            ]),
        .target(
            name: "maji-countdownLibrary",
            dependencies: []),
        .testTarget(
            name: "maji-countdownLibraryTests",
            dependencies: ["maji-countdownLibrary"]),
    ]
)