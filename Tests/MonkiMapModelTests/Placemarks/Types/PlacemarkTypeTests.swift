//
//  PlacemarkTypeTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 21/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkTypeTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	func testRawValuesAreValid() {
		for type in PlacemarkType.allCases {
			XCTAssertNoThrow(
				try type.rawValue.validate(with: __idPredicate),
				"Invalid rawValue for '\(type)' ('\(type.rawValue)')."
			)
		}
	}
	
	// MARK: - Invalid Domain
	
	// MARK: - Manifest
	
	static var allTests = [
		("testRawValuesAreValid", testRawValuesAreValid),
	]
	
}
