//
//  ParkourTechnique.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public enum ParkourTechnique: String, Codable, Hashable, DefaultCaseDecodable {
	
	case unknown
	case precisionJump = "precision_jump"
	case kong
	case doubleKong = "double_kong"
	case tripleKong = "triple_kong"
	case catLeap = "cat_leap"
	case catLeap180 = "180_cat_leap"
	case smallDrop = "small_drop"
	case mediumDrop = "medium_drop"
	case highDrop = "high_drop"
	case flips
	case ninjaWarrior = "ninja_warrior"
	case chaseTag = "chase_tag"
	
	public static var defaultCase: Self = .unknown
	
	public static func allowed(for type: PlacemarkType) throws -> [Self] {
		return type == .unknown ? [] : try type.asPrivate(in: Locale.en).allowedTechniques
	}
	
	public static func allowed(for type: PlacemarkType.Localized) throws -> [Self] {
		return try self.allowed(for: type.id)
	}
	
}

extension ParkourTechnique {
	
	/// Icons from [Icons8](https://icons8.com)
	var iconName: String? {
		switch self {
		case .unknown:
			return nil
		case .precisionJump:
			return nil
		case .kong, .doubleKong, .tripleKong:
			return "icons8-gorilla"
		case .catLeap:
			return nil
		case .catLeap180:
			return nil
		case .smallDrop, .mediumDrop, .highDrop:
			return "icons8-height"
		case .flips:
			return "icons8-parkour"
		case .ninjaWarrior:
			return nil
		case .chaseTag:
			return nil
		}
	}
	
}

/// Extend for testing purposes
extension ParkourTechnique: CaseIterable {}
