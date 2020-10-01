//
//  PlacemarkCategory+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkCategoryLocalizedTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	private let translations: [String: [PlacemarkCategory: String]] = [
		"en": [
			.unknown: "Unknown",
			.spot: "Spot",
			.facility: "Facility",
			.drinkingWater: "Drinking Water",
		],
		"fr": [
			.unknown: "Inconnu",
			.spot: "Spot",
			.facility: "Salle",
			.drinkingWater: "Eau potable",
		],
	]
	
	func testTranslations() {
		for category in PlacemarkCategory.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[category] != nil,
					"Missing key '\(category)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (category, title) in translations {
				do {
					let expected = try category.title(in: Locale(identifier: locale))
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedCategoryHasCorrectTitle() throws {
		// Test English translation
		do {
			let expected = PlacemarkCategory.Localized(id: .facility, title: "Facility")
			let result = try PlacemarkCategory.facility.localized(in: Locale.en)
			XCTAssertEqual(result.id, expected.id)
			XCTAssertEqual(result.title, expected.title)
		}
		
		// Test French translation
		do {
			let expected = PlacemarkCategory.Localized(id: .facility, title: "Salle")
			let result = try PlacemarkCategory.facility.localized(in: Locale.fr)
			XCTAssertEqual(result.id, expected.id)
			XCTAssertEqual(result.title, expected.title)
		}
	}
	
	func testLocalizedCategoriesAreIdentifiable() throws {
		let category1 = PlacemarkCategory.Localized(id: .spot, title: "Name in a language")
		let category2 = PlacemarkCategory.Localized(id: .spot, title: "Name in another language")
		XCTAssertEqual(category1, category2)
	}
	
	// MARK: - Invalid Domain
	
	func testLocalizedCategoriesAreDifferentIfIdsDiffer() throws {
		let category1 = PlacemarkCategory.Localized(id: .spot, title: "Shared name")
		let category2 = PlacemarkCategory.Localized(id: .facility, title: "Shared name")
		XCTAssertNotEqual(category1, category2)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testTranslations", testTranslations),
		("testLocalizedCategoryHasCorrectTitle", testLocalizedCategoryHasCorrectTitle),
		("testLocalizedCategoriesAreIdentifiable", testLocalizedCategoriesAreIdentifiable),
		("testLocalizedCategoriesAreDifferentIfIdsDiffer", testLocalizedCategoriesAreDifferentIfIdsDiffer),
	]
	
}
