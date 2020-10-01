//
//  PlacemarkHazardTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkHazardTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for hazard in PlacemarkHazard.allCases {
			XCTAssertNoThrow(
				try hazard.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(hazard)' ('\(hazard.rawValue)')."
			)
		}
	}
	
	func testAllowedForPlacemarkTypesDoesNotThrow() {
		for type in PlacemarkType.allCases {
			XCTAssertNoThrow(
				try PlacemarkHazard.allowed(for: type),
				"Could not get allowed hazards for type '\(type)'."
			)
		}
	}
	
	func testAllowedForLocalizedPlacemarkTypesDoesNotThrow() {
		for type in PlacemarkType.allCases {
			XCTAssertNoThrow(
				try PlacemarkHazard.allowed(for: type.localized(in: .en)),
				"Could not get allowed hazards for type '\(type)'."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	// MARK: - Manifest
	
	static var allTests = [
		("testRawValuesAreValid", testRawValuesAreValid),
		("testAllowedForPlacemarkTypesDoesNotThrow", testAllowedForPlacemarkTypesDoesNotThrow),
		("testAllowedForLocalizedPlacemarkTypesDoesNotThrow", testAllowedForLocalizedPlacemarkTypesDoesNotThrow),
	]
	
}
