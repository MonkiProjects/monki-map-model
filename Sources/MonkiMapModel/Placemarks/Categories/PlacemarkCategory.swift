//
//  PlacemarkCategory.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public enum PlacemarkCategory: String, Codable, Hashable, DefaultCaseDecodable {
	
	case unknown
	case spot
	case facility
	case drinkingWater = "drinking_water"
	
	public static var defaultCase: Self = .unknown
	
	public init(for type: PlacemarkType) throws {
		self = try type.asPrivate(in: Locale.en).category
	}
	
}

/// Extend for testing purposes
extension PlacemarkCategory: CaseIterable {}
