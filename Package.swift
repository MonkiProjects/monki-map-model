// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "monki-map-model",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.macOS(.v10_10)
	],
	products: [
		.library(
			name: "MonkiMapModel",
			targets: ["MonkiMapModel"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/MonkiProjects/monki-projects-model.git", .branch("master")),
	],
	targets: [
		.target(
			name: "MonkiMapModel",
			dependencies: [
				.product(name: "MonkiProjectsModel", package: "monki-projects-model"),
			],
			resources: [
				.process("Resources/Strings"),
			]
		),
		.testTarget(
			name: "MonkiMapModelTests",
			dependencies: ["MonkiMapModel"]
		),
	]
)
