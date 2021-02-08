//
//  PlacemarkProperty+HazardTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkHazardPrivateTests: XCTestCase {
	
	typealias Properties = Placemark.Properties
	typealias Hazard = Properties.Hazard
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for hazard in Hazard.allCases {
			XCTAssertNoThrow(
				try hazard.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(hazard)' ('\(hazard.rawValue)')."
			)
		}
	}
	
	func testAllowedForPlacemarkKindsDoesNotThrow() {
		for kind in Placemark.Kind.allCases {
			XCTAssertNoThrow(
				try Hazard.allowed(for: kind),
				"Could not get allowed hazards for kind '\(kind)'."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try Properties.hazard(.unknown).internal(in: Locale.en),
			"Placemark hazard with id 'unknown' is not invalid"
		)
	}
	
}
