// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "monki-map-model",
	defaultLocalization: "en",
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
