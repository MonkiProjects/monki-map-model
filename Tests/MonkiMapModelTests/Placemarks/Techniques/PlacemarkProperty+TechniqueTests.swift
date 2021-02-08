//
//  PlacemarkProperty+TechniqueTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkPropertyTechniqueTests: XCTestCase {
	
	typealias Properties = Placemark.Properties
	typealias Technique = Properties.Technique
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for technique in Technique.allCases {
			XCTAssertNoThrow(
				try technique.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(technique)' ('\(technique.rawValue)')."
			)
		}
	}
	
	func testAllowedForPlacemarkKindsDoesNotThrow() {
		for kind in Placemark.Kind.allCases {
			XCTAssertNoThrow(
				try Technique.allowed(for: kind),
				"Could not get allowed techniques for kind '\(kind)'."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try Properties.technique(.unknown).internal(in: Locale.en),
			"Parkour technique with id 'unknown' is not invalid"
		)
	}
	
}
