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
	
	typealias Properties = Placemark.Properties
	typealias Benefit = Properties.Benefit
	
	// MARK: - Valid Domain
	
	private let translations: [Locale: [Benefit: String]] = [
		.en: [
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
		.fr: [
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
		for benefit in Benefit.allCases {
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
					let expected = try Properties.benefit(benefit).title(in: locale)
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedBenefitHasCorrectTitle() throws {
		let id = "well_known"
		let property = Properties.benefit(.wellKnown)
		
		// Test English translation
		do {
			let result = try property.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Well known")
		}
		
		// Test French translation
		do {
			let result = try property.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Très connu")
		}
	}
	
	func testAllEnumCasesExist() throws {
		for locale in Locale.supported {
			let localized = Properties.Internal.all(in: locale).filter { $0.kind == .benefit }
			
			// Test will also fail if too many cases are defined
			XCTAssertEqual(
				localized.count,
				Benefit.allCases.count - 1, // - 1 because of .unknown case
				localized.filter({ $0.id == "unknown" }).map(\.title).description
			)
		}
	}
	
	// MARK: - Invalid Domain
	
}
