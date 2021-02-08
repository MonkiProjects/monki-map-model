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
	
	typealias Properties = Placemark.Properties
	typealias Hazard = Properties.Hazard
	
	// MARK: - Valid Domain
	
	private let translations: [Locale: [Hazard: String]] = [
		.en: [
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
		.fr: [
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
		for hazard in Hazard.allCases {
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
					let expected = try Properties.hazard(hazard).title(in: locale)
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedHazardHasCorrectTitle() throws {
		let id = "security"
		let property = Properties.hazard(.security)
		
		// Test English translation
		do {
			let result = try property.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Security")
		}
		
		// Test French translation
		do {
			let result = try property.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Sécurité")
		}
	}
	
	func testAllEnumCasesExist() throws {
		for locale in Locale.supported {
			let localized = Properties.Internal.all(in: locale).filter { $0.kind == .hazard }
			
			// Test will also fail if too many cases are defined
			XCTAssertEqual(
				localized.count,
				Hazard.allCases.count - 1, // - 1 because of .unknown case
				localized.filter({ $0.id == "unknown" }).map(\.title).description
			)
		}
	}
	
	// MARK: - Invalid Domain
	
}
