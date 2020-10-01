//
//  PlacemarkHazard+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkHazardLocalizedTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	private let translations: [String: [PlacemarkHazard: String]] = [
		"en": [
			.unknown: "Unknown",
			.security: "Security",
			.securityCam: "Security cam",
			.slipperySurface: "Slippery surface",
			.highDrop: "High drop",
			.uneasyAccess: "Uneasy access",
			.lockedDoor: "Locked door",
			.alarm: "Alarm",
			.deathDrop: "Death drop",
		],
		"fr": [
			.unknown: "Inconnu",
			.security: "Sécurité",
			.securityCam: "Caméra de sécurité",
			.slipperySurface: "Surface glissante",
			.highDrop: "Grande chute",
			.uneasyAccess: "Accès difficile",
			.lockedDoor: "Porte fermée",
			.alarm: "Alarme",
			.deathDrop: "Chute mortelle",
		],
	]
	
	func testTranslations() {
		for hazard in PlacemarkHazard.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[hazard] != nil,
					"Missing key '\(hazard)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (hazard, title) in translations {
				do {
					let expected = try hazard.title(in: Locale(identifier: locale))
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedHazardHasCorrectTitle() throws {
		let id = "security"
		
		// Test English translation
		do {
			let expected = try PlacemarkHazard.Localized(id: id, title: "Security")
			let result = try PlacemarkHazard.security.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
		
		// Test French translation
		do {
			let expected = try PlacemarkHazard.Localized(id: id, title: "Sécurité")
			let result = try PlacemarkHazard.security.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
	}
	
	func testValidIdsDoNotThrow() {
		let validIds = ["test_match", "7+_floors", "valid", "va_lid", "6_floors", "floors_7+", "a", "a_b", "a_b_c"]
		
		for id in validIds {
			XCTAssertNoThrow(
				try PlacemarkHazard.Localized(id: id, title: id),
				"id '\(id)' is invalid"
			)
		}
	}
	
	func testLocalizedHazardsAreIdentifiable() throws {
		let hazard1 = try PlacemarkHazard.Localized(id: "shared_id", title: "Name in a language")
		let hazard2 = try PlacemarkHazard.Localized(id: "shared_id", title: "Name in another language")
		XCTAssertEqual(hazard1, hazard2)
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		let invalidIds = ["in__valid", "invalid_", "_invalid", "in-valid", "in_valid_", "in/valid", "in\\valid", "in.valid", "in|valid", "in,valid", "in++_valid", "in_valid++", "ìnvalid"]
		
		for id in invalidIds {
			XCTAssertThrowsError(
				try PlacemarkHazard.Localized(id: id, title: id),
				"id '\(id)' is not invalid"
			)
		}
	}
	
	func testLocalizedHazardsAreDifferentIfIdsDiffer() throws {
		let hazard1 = try PlacemarkHazard.Localized(id: "id_1", title: "Shared name")
		let hazard2 = try PlacemarkHazard.Localized(id: "id_2", title: "Shared name")
		XCTAssertNotEqual(hazard1, hazard2)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testTranslations", testTranslations),
		("testLocalizedHazardHasCorrectTitle", testLocalizedHazardHasCorrectTitle),
		("testValidIdsDoNotThrow", testValidIdsDoNotThrow),
		("testLocalizedHazardsAreIdentifiable", testLocalizedHazardsAreIdentifiable),
		("testInvalidIdThrows", testInvalidIdThrows),
		("testLocalizedHazardsAreDifferentIfIdsDiffer", testLocalizedHazardsAreDifferentIfIdsDiffer),
	]
	
}
