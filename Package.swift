// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-rfc-9053",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "RFC 9053", targets: ["RFC 9053"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-ietf/swift-rfc-9052.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "RFC 9053",
            dependencies: [
                .product(name: "RFC 9052", package: "swift-rfc-9052"),
            ]
        ),
        .testTarget(
            name: "RFC 9053 Tests",
            dependencies: [
                .target(name: "RFC 9053"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableUpcomingFeature("InferIsolatedConformances"),
            .enableExperimentalFeature("Lifetimes"),
            .treatAllWarnings(as: .error),
        ]
}
