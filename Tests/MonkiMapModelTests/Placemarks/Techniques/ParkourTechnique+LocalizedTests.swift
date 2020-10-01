//
//  ParkourTechnique+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class ParkourTechniqueLocalizedTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	private let translations: [String: [ParkourTechnique: String]] = [
		"en": [
			.unknown: "Unknown",
			.precisionJump: "Precision jump",
			.kong: "Kong",
			.doubleKong: "Double kong",
			.tripleKong: "Triple kong",
			.catLeap: "Cat leap",
			.catLeap180: "180° cat leap",
			.smallDrop: "Small drop",
			.mediumDrop: "Medium drop",
			.highDrop: "High drop",
			.flips: "Flips",
			.ninjaWarrior: "Ninja Warrior",
			.chaseTag: "Chase Tag",
		],
		"fr": [
			.unknown: "Inconnu",
			.precisionJump: "Saut de précision",
			.kong: "Saut de chat",
			.doubleKong: "Double saut de chat",
			.tripleKong: "Triple saut de chat",
			.catLeap: "Saut de bras",
			.catLeap180: "Saut de bras retourné",
			.smallDrop: "Petit saut de fond",
			.mediumDrop: "Saut de fond moyen",
			.highDrop: "Grand saut de fond",
			.flips: "Flips",
			.ninjaWarrior: "Ninja Warrior",
			.chaseTag: "Chase Tag",
		],
	]
	
	func testTranslations() {
		for technique in ParkourTechnique.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[technique] != nil,
					"Missing key '\(technique)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (technique, title) in translations {
				do {
					let expected = try technique.title(in: Locale(identifier: locale))
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedTechniqueHasCorrectTitle() throws {
		let id = "precision_jump"
		
		// Test English translation
		do {
			let expected = try ParkourTechnique.Localized(id: id, title: "Precision jump")
			let result = try ParkourTechnique.precisionJump.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
		
		// Test French translation
		do {
			let expected = try ParkourTechnique.Localized(id: id, title: "Saut de précision")
			let result = try ParkourTechnique.precisionJump.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
	}
	
	func testValidIdsDoNotThrow() {
		let validIds = ["test_match", "7+_floors", "valid", "va_lid", "6_floors", "floors_7+", "a", "a_b", "a_b_c"]
		
		for id in validIds {
			XCTAssertNoThrow(
				try ParkourTechnique.Localized(id: id, title: id),
				"id '\(id)' is invalid"
			)
		}
	}
	
	func testLocalizedTechniquesAreIdentifiable() throws {
		let technique1 = try ParkourTechnique.Localized(id: "shared_id", title: "Name in a language")
		let technique2 = try ParkourTechnique.Localized(id: "shared_id", title: "Name in another language")
		XCTAssertEqual(technique1, technique2)
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		let invalidIds = [
			"in__valid", "invalid_", "_invalid", "in_valid_", "in-valid",
			"in/valid", "in\\valid", "in.valid", "in|valid", "in,valid",
			"in++_valid", "in_valid++",
			"ìnvalid",
		]
		
		for id in invalidIds {
			XCTAssertThrowsError(
				try ParkourTechnique.Localized(id: id, title: id),
				"id '\(id)' is not invalid"
			)
		}
	}
	
	func testLocalizedTechniquesAreDifferentIfIdsDiffer() throws {
		let technique1 = try ParkourTechnique.Localized(id: "id_1", title: "Shared name")
		let technique2 = try ParkourTechnique.Localized(id: "id_2", title: "Shared name")
		XCTAssertNotEqual(technique1, technique2)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testTranslations", testTranslations),
		("testLocalizedTechniqueHasCorrectTitle", testLocalizedTechniqueHasCorrectTitle),
		("testValidIdsDoNotThrow", testValidIdsDoNotThrow),
		("testLocalizedTechniquesAreIdentifiable", testLocalizedTechniquesAreIdentifiable),
		("testInvalidIdThrows", testInvalidIdThrows),
		("testLocalizedTechniquesAreDifferentIfIdsDiffer", testLocalizedTechniquesAreDifferentIfIdsDiffer),
	]
	
}
