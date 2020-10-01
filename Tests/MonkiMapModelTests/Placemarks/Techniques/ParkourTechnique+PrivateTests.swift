//
//  ParkourTechnique+PrivateTests.swift
//  MonkiMapModelTests
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import XCTest
@testable import MonkiMapModel

final class ParkourTechniquePrivateTests: XCTestCase {
	
	// MARK: - Valid Domain
	
	// MARK: - Invalid Domain
	
	func testInvalidIdThrows() {
		XCTAssertThrowsError(
			try ParkourTechnique.unknown.asPrivate(in: Locale.en),
			"Parkour technique with id 'unknown' is not invalid"
		)
	}
	
	// MARK: - Manifest
	
	static var allTests = [
		("testInvalidIdThrows", testInvalidIdThrows),
	]
	
}
