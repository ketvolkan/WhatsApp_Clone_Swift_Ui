// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "WhatsAppClone",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "WhatsAppClone",
            targets: ["WhatsAppClone"]
        )
    ],
    targets: [
        .executableTarget(
            name: "WhatsAppClone",
            path: ".",
            exclude: ["Package.swift", "README.md", "Screenshots"],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
