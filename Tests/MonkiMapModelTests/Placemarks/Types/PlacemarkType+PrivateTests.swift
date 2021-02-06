//
//  PlacemarkType+PrivateTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class PlacemarkTypePrivateTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try PlacemarkType.unknown.asPrivate(in: Locale.en),
			"Placemark type with id 'unknown' is not invalid"
		)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testInvalidIdThrows", testInvalidIdThrows),
	]
	
}