//
//  PlacemarkProperty+FeatureTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkFeaturePrivateTests: XCTestCase {
	
	typealias Properties = Placemark.Properties
	typealias Feature = Properties.Feature
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for feature in Feature.allCases {
			XCTAssertNoThrow(
				try feature.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(feature)' ('\(feature.rawValue)')."
			)
		}
	}
	
	func testAllowedForPlacemarkKindsDoesNotThrow() {
		for kind in Placemark.Kind.allCases {
			XCTAssertNoThrow(
				try Feature.allowed(for: kind),
				"Could not get allowed features for kind '\(kind)'."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try Properties.feature(.unknown).internal(in: Locale.en),
			"Placemark feature with id 'unknown' is not invalid"
		)
	}
	
}
