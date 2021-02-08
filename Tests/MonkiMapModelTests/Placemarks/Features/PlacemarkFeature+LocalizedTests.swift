//
//  PlacemarkFeature+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkFeatureLocalizedTests: XCTestCase {
	
	typealias Properties = Placemark.Properties
	typealias Feature = Properties.Feature
	
	// MARK: - Valid Domain
	
	private let translations: [Locale: [Feature: String]] = [
		.en: [
			.unknown: "Unknown",
			.smallWall: "Small Wall",
			.mediumWall: "Medium Wall",
			.bigWall: "Big Wall",
			.railing: "Railing",
			.stairs: "Stairs",
			.bar: "Bar",
			.parallelBars: "Parallel Bars",
			.ladder: "Ladder",
			.grass: "Grass",
			.sand: "Sand",
			.water: "Water",
			.tree: "Tree",
			.treeTrunk: "Tree Trunk",
			.smallRocks: "Small Rocks",
			.mediumRocks: "Medium Rocks",
			.bigRocks: "Big Rocks",
			.trampoline: "Trampoline",
			.foamPit: "Foam Pit",
			.airbag: "Airbag",
			.ninjaWarriorArea: "Ninja Warrior Area",
			.ninjaWarriorWall: "Ninja Warrior Wall",
			.chaseTagSetup: "Chase Tag Setup",
			.oneFloor: "1 Floor",
			.twoFloors: "2 Floors",
			.threeFloors: "3 Floors",
			.fourFloors: "4 Floors",
			.fiveFloors: "5 Floors",
			.sixFloors: "6 Floors",
			.sevenFloors: "7 Floors",
			.moreThanSevenFloors: "7+ Floors",
			.bench: "Bench",
		],
		.fr: [
			.unknown: "Inconnu",
			.smallWall: "Petit mur",
			.mediumWall: "Mur moyen",
			.bigWall: "Grand mur",
			.railing: "Barrière",
			.stairs: "Escalier",
			.bar: "Barre",
			.parallelBars: "Barres parallèles",
			.ladder: "Échelle",
			.grass: "Herbe",
			.sand: "Sable",
			.water: "Eau",
			.tree: "Arbre",
			.treeTrunk: "Tronc d'arbre",
			.smallRocks: "Petits cailloux",
			.mediumRocks: "Cailloux moyens",
			.bigRocks: "Gros cailloux",
			.trampoline: "Trampoline",
			.foamPit: "Bac à mousse",
			.airbag: "Airbag",
			.ninjaWarriorArea: "Zone Ninja Warrior",
			.ninjaWarriorWall: "Mur de Ninja Warrior",
			.chaseTagSetup: "Installation de Chase Tag",
			.oneFloor: "1 étage",
			.twoFloors: "2 étages",
			.threeFloors: "3 étages",
			.fourFloors: "4 étages",
			.fiveFloors: "5 étages",
			.sixFloors: "6 étages",
			.sevenFloors: "7 étages",
			.moreThanSevenFloors: "7+ étages",
			.bench: "Banc",
		],
	]
	
	func testTranslations() {
		for feature in Feature.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[feature] != nil,
					"Missing key '\(feature)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (feature, title) in translations {
				do {
					let expected = try Properties.feature(feature).title(in: locale)
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedFeatureHasCorrectTitle() throws {
		let id = "small_wall"
		let property = Properties.feature(.smallWall)
		
		// Test English translation
		do {
			let result = try property.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Small Wall")
		}
		
		// Test French translation
		do {
			let result = try property.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Petit mur")
		}
	}
	
	func testAllEnumCasesExist() throws {
		for locale in Locale.supported {
			let localized = Properties.Internal.all(in: locale).filter { $0.kind == .feature }
			
			// Test will also fail if too many cases are defined
			XCTAssertEqual(
				localized.count,
				Feature.allCases.count - 1, // - 1 because of .unknown case
				localized.filter({ $0.id == "unknown" }).map(\.title).description
			)
		}
	}
	
	// MARK: - Invalid Domain
	
}
