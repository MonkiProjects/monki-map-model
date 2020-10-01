//
//  ParkourTechniqueTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class ParkourTechniqueTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for technique in ParkourTechnique.allCases {
			XCTAssertNoThrow(
				try technique.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(technique)' ('\(technique.rawValue)')."
			)
		}
	}
	
	func testAllowedForPlacemarkTypesDoesNotThrow() {
		for type in PlacemarkType.allCases {
			XCTAssertNoThrow(
				try ParkourTechnique.allowed(for: type),
				"Could not get allowed techniques for type '\(type)'."
			)
		}
	}
	
	func testAllowedForLocalizedPlacemarkTypesDoesNotThrow() {
		for type in PlacemarkType.allCases {
			XCTAssertNoThrow(
				try ParkourTechnique.allowed(for: type.localized(in: .en)),
				"Could not get allowed techniques for type '\(type)'."
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
