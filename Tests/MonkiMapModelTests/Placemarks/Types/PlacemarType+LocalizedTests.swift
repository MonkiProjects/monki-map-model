//
//  PlacemarkType+LocalizedTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkTypeLocalizedTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	private let translations: [String: [PlacemarkType: String]] = [
		"en": [
			.unknown: "Unknown",
			.trainingSpot: "Training Spot",
			.outdoorParkourPark: "Outdoor Parkour Park",
			.calisthenicsPark: "Calisthenics Park",
			.descent: "Descent",
			.urbanClimbingSpot: "Urban Climbing Spot",
			.playground: "Playground",
			.indoorParkourPark: "Indoor Parkour Park",
			.boulderingFacility: "Bouldering Facility",
			.aomAcademy: "Art Of Movement Academy",
			.trickingSchool: "Tricking School",
			.trampolinePark: "Trampoline Park",
			.gymnasticsGym: "Gymnastics Gym",
			.drinkingFountain: "Drinking Fountain",
		],
		"fr": [
			.unknown: "Inconnu",
			.trainingSpot: "Spot d'entraînement",
			.outdoorParkourPark: "Parkour park en extérieur",
			.calisthenicsPark: "Parc de street workout",
			.descent: "Descente",
			.urbanClimbingSpot: "Spot de grimpe urbaine",
			.playground: "Aire de jeu",
			.indoorParkourPark: "Parkour park en intérieur",
			.boulderingFacility: "Salle d'escalade",
			.aomAcademy: "Académie d'Art Du Déplacement",
			.trickingSchool: "École de tricking",
			.trampolinePark: "Trampoline Park",
			.gymnasticsGym: "Salle de gymnastique",
			.drinkingFountain: "Fontaine à eau potable",
		],
	]
	
	func testTranslations() {
		for type in PlacemarkType.allCases {
			for (locale, translations) in translations {
				XCTAssert(
					translations[type] != nil,
					"Missing key '\(type)' in '\(locale)' translations"
				)
			}
		}
		
		for (locale, translations) in translations {
			for (type, title) in translations {
				do {
					let expected = try type.title(in: Locale(identifier: locale))
					XCTAssertEqual(expected, title)
				} catch {
					XCTFail("\(error)")
				}
			}
		}
	}
	
	func testLocalizedTypeHasCorrectTitle() throws {
		// Test English translation
		do {
			let expected = PlacemarkType.Localized(id: .trainingSpot, title: "Training Spot")
			let result = try PlacemarkType.trainingSpot.localized(in: Locale.en)
			XCTAssertEqual(result.id, expected.id)
			XCTAssertEqual(result.title, expected.title)
		}
		
		// Test French translation
		do {
			let expected = PlacemarkType.Localized(id: .trainingSpot, title: "Spot d'entraînement")
			let result = try PlacemarkType.trainingSpot.localized(in: Locale.fr)
			XCTAssertEqual(result.id, expected.id)
			XCTAssertEqual(result.title, expected.title)
		}
	}
	
	func testLocalizedTypesAreIdentifiable() throws {
		let type1 = PlacemarkType.Localized(id: .trainingSpot, title: "Name in a language")
		let type2 = PlacemarkType.Localized(id: .trainingSpot, title: "Name in another language")
		XCTAssertEqual(type1, type2)
	}
	
	// MARK: - Invalid Domain
	
	func testLocalizedTypesAreDifferentIfIdsDiffer() throws {
		let type1 = PlacemarkType.Localized(id: .trainingSpot, title: "Shared name")
		let type2 = PlacemarkType.Localized(id: .outdoorParkourPark, title: "Shared name")
		XCTAssertNotEqual(type1, type2)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testTranslations", testTranslations),
		("testLocalizedTypesAreIdentifiable", testLocalizedTypesAreIdentifiable),
		("testLocalizedTypesAreDifferentIfIdsDiffer", testLocalizedTypesAreDifferentIfIdsDiffer),
	]
	
}
