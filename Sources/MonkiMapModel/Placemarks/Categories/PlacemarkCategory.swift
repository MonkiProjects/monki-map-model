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

extension PlacemarkCategory {
	
	/// Icons from [Icons8](https://icons8.com)
	var iconName: String? {
		switch self {
		case .unknown:
			return nil
		case .spot:
			return "icons8-place_marker"
		case .facility:
			return "icons8-school_building"
		case .drinkingWater:
			return "icons8-water"
		}
	}
	
}

/// Extend for testing purposes
extension PlacemarkCategory: CaseIterable {}
