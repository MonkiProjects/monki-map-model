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
	
	// MARK: - Valid Domain
	
	private let translations: [String: [PlacemarkFeature: String]] = [
		"en": [
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
		"fr": [
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
		for feature in PlacemarkFeature.allCases {
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
					let expected = try feature.title(in: Locale(identifier: locale))
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedFeatureHasCorrectTitle() throws {
		let id = "small_wall"
		
		// Test English translation
		do {
			let expected = try PlacemarkFeature.Localized(id: id, title: "Small Wall")
			let result = try PlacemarkFeature.smallWall.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
		
		// Test French translation
		do {
			let expected = try PlacemarkFeature.Localized(id: id, title: "Petit mur")
			let result = try PlacemarkFeature.smallWall.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
	}
	
	func testValidIdsDoNotThrow() {
		let validIds = ["test_match", "7+_floors", "valid", "va_lid", "6_floors", "floors_7+", "a", "a_b", "a_b_c"]
		
		for id in validIds {
			XCTAssertNoThrow(
				try PlacemarkFeature.Localized(id: id, title: id),
				"id '\(id)' is invalid"
			)
		}
	}
	
	func testLocalizedFeaturesAreIdentifiable() throws {
		let feature1 = try PlacemarkFeature.Localized(id: "shared_id", title: "Name in a language")
		let feature2 = try PlacemarkFeature.Localized(id: "shared_id", title: "Name in another language")
		XCTAssertEqual(feature1, feature2)
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		let invalidIds = ["in__valid", "invalid_", "_invalid", "in-valid", "in_valid_", "in/valid", "in\\valid", "in.valid", "in|valid", "in,valid", "in++_valid", "in_valid++", "ìnvalid"]
		
		for id in invalidIds {
			XCTAssertThrowsError(
				try PlacemarkFeature.Localized(id: id, title: id),
				"id '\(id)' is not invalid"
			)
		}
	}
	
	func testLocalizedFeaturesAreDifferentIfIdsDiffer() throws {
		let feature1 = try PlacemarkFeature.Localized(id: "id_1", title: "Shared name")
		let feature2 = try PlacemarkFeature.Localized(id: "id_2", title: "Shared name")
		XCTAssertNotEqual(feature1, feature2)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testTranslations", testTranslations),
		("testLocalizedFeatureHasCorrectTitle", testLocalizedFeatureHasCorrectTitle),
		("testValidIdsDoNotThrow", testValidIdsDoNotThrow),
		("testLocalizedFeaturesAreIdentifiable", testLocalizedFeaturesAreIdentifiable),
		("testInvalidIdThrows", testInvalidIdThrows),
		("testLocalizedFeaturesAreDifferentIfIdsDiffer", testLocalizedFeaturesAreDifferentIfIdsDiffer),
	]
	
}
