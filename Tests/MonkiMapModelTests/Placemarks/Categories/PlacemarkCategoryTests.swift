//
//  PlacemarkCategoryTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkCategoryTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for category in PlacemarkCategory.allCases {
			XCTAssertNoThrow(
				try category.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(category)' ('\(category.rawValue)')."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	// MARK: - Manifest
	
	static var allTests = [
		("testRawValuesAreValid", testRawValuesAreValid),
	]
	
}
