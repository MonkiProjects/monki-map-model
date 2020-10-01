//
//  PlacemarkFeatureTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkFeatureTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for feature in PlacemarkFeature.allCases {
			XCTAssertNoThrow(
				try feature.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(feature)' ('\(feature.rawValue)')."
			)
		}
	}
	
	func testAllowedForPlacemarkTypesDoesNotThrow() {
		for type in PlacemarkType.allCases {
			XCTAssertNoThrow(
				try PlacemarkFeature.allowed(for: type),
				"Could not get allowed features for type '\(type)'."
			)
		}
	}
	
	func testAllowedForLocalizedPlacemarkTypesDoesNotThrow() {
		for type in PlacemarkType.allCases {
			XCTAssertNoThrow(
				try PlacemarkFeature.allowed(for: type.localized(in: .en)),
				"Could not get allowed features for type '\(type)'."
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
