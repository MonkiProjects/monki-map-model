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
	
	typealias Properties = Placemark.Properties
	typealias Technique = Properties.Technique
	
	// MARK: - Valid Domain
	
	private let translations: [Locale: [Technique: String]] = [
		.en: [
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
		.fr: [
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
		for technique in Technique.allCases {
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
					let expected = try Properties.technique(technique).title(in: locale)
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedTechniqueHasCorrectTitle() throws {
		let id = "precision_jump"
		let property = Properties.technique(.precisionJump)
		
		// Test English translation
		do {
			let result = try property.localized(in: Locale.en)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Precision jump")
		}
		
		// Test French translation
		do {
			let result = try property.localized(in: Locale.fr)
			XCTAssertEqual(result.id, id)
			XCTAssertEqual(result.title, "Saut de précision")
		}
	}
	
	func testAllEnumCasesExist() throws {
		for locale in Locale.supported {
			let localized = Properties.Internal.all(in: locale).filter { $0.kind == .technique }
			
			// Test will also fail if too many cases are defined
			XCTAssertEqual(
				localized.count,
				Technique.allCases.count - 1, // - 1 because of .unknown case
				localized.filter({ $0.id == "unknown" }).map(\.title).description
			)
		}
	}
	
	// MARK: - Invalid Domain
	
}
