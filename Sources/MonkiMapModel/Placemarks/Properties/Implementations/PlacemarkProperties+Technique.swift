//
//  PlacemarkProperties+Technique.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark.Properties {
	
	enum Technique: String, Codable, Hashable, DefaultCaseDecodable {
		
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
		
		public static func allowed(for kind: Placemark.Kind) throws -> [Placemark.Property] {
			return kind == .unknown ? [] : try kind.internal(in: Locale.en).allowedTechniques
		}
		
	}
	
	static func technique(_ technique: Technique) -> Placemark.Property {
		return .init(id: technique.rawValue, kind: .technique)
	}
	
}

/// Extend for testing purposes
extension Placemark.Properties.Technique: CaseIterable {}
