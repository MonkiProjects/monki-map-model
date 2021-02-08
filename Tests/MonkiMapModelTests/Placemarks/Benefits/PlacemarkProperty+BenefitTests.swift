//
//  PlacemarkProperty+BenefitTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkPropertyBenefitTests: XCTestCase {
	
	typealias Properties = Placemark.Properties
	typealias Benefit = Properties.Benefit
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for benefit in Benefit.allCases {
			XCTAssertNoThrow(
				try benefit.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(benefit)' ('\(benefit.rawValue)')."
			)
		}
	}
	
	func testAllowedForPlacemarkKindsDoesNotThrow() {
		for kind in Placemark.Kind.allCases {
			XCTAssertNoThrow(
				try Benefit.allowed(for: kind),
				"Could not get allowed benefits for kind '\(kind)'."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try Properties.benefit(.unknown).internal(in: Locale.en),
			"Placemark benefit with id 'unknown' is not invalid"
		)
	}
	
}
