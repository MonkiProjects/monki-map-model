//
//  PlacemarkBenefit+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkBenefitLocalizedTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	private let translations: [String: [PlacemarkBenefit: String]] = [
		"en": [
			.unknown: "Unknown",
			.drinkingFountain: "Drinking fountain",
			.coveredArea: "Covered area",
			.hooks: "Hooks",
			.changingRoom: "Changing room",
			.coaching: "Coaching",
			.wellKnown: "Well known",
			.equipmentRental: "Equipment rental",
			.shop: "Shop",
		],
		"fr": [
			.unknown: "Inconnu",
			.drinkingFountain: "Fontaine à eau",
			.coveredArea: "Espace couvert",
			.hooks: "Points d'accroche",
			.changingRoom: "Vestiaire",
			.coaching: "Coaching",
			.wellKnown: "Très connu",
			.equipmentRental: "Location d'équipement",
			.shop: "Magasin",
		],
	]
	
	func testTranslations() {
		for benefit in PlacemarkBenefit.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[benefit] != nil,
					"Missing key '\(benefit)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (benefit, title) in translations {
				do {
					let expected = try benefit.title(in: Locale(identifier: locale))
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedBenefitHasCorrectTitle() throws {
		let id = "well_known"
		
		// Test English translation
		do {
			let expected = try PlacemarkBenefit.Localized(id: id, title: "Well known")
			let result = try PlacemarkBenefit.wellKnown.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
		
		// Test French translation
		do {
			let expected = try PlacemarkBenefit.Localized(id: id, title: "Très connu")
			let result = try PlacemarkBenefit.wellKnown.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, expected.title)
		}
	}
	
	func testValidIdsDoNotThrow() {
		let validIds = ["test_match", "7+_floors", "valid", "va_lid", "6_floors", "floors_7+", "a", "a_b", "a_b_c"]
		
		for id in validIds {
			XCTAssertNoThrow(
				try PlacemarkBenefit.Localized(id: id, title: id),
				"id '\(id)' is invalid"
			)
		}
	}
	
	func testLocalizedBenefitsAreIdentifiable() throws {
		let benefit1 = try PlacemarkBenefit.Localized(id: "shared_id", title: "Name in a language")
		let benefit2 = try PlacemarkBenefit.Localized(id: "shared_id", title: "Name in another language")
		XCTAssertEqual(benefit1, benefit2)
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
				try PlacemarkBenefit.Localized(id: id, title: id),
				"id '\(id)' is not invalid"
			)
		}
	}
	
	func testLocalizedBenefitsAreDifferentIfIdsDiffer() throws {
		let benefit1 = try PlacemarkBenefit.Localized(id: "id_1", title: "Shared name")
		let benefit2 = try PlacemarkBenefit.Localized(id: "id_2", title: "Shared name")
		XCTAssertNotEqual(benefit1, benefit2)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testTranslations", testTranslations),
		("testLocalizedBenefitHasCorrectTitle", testLocalizedBenefitHasCorrectTitle),
		("testValidIdsDoNotThrow", testValidIdsDoNotThrow),
		("testLocalizedBenefitsAreIdentifiable", testLocalizedBenefitsAreIdentifiable),
		("testInvalidIdThrows", testInvalidIdThrows),
		("testLocalizedBenefitsAreDifferentIfIdsDiffer", testLocalizedBenefitsAreDifferentIfIdsDiffer),
	]
	
}
