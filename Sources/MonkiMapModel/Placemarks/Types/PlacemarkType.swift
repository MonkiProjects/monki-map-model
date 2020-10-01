//
//  PlacemarkType.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public enum PlacemarkType: String, Codable, Hashable, DefaultCaseDecodable {
	
	case unknown
	case trainingSpot = "training_spot"
	case outdoorParkourPark = "outdoor_parkour_park"
	case calisthenicsPark = "calisthenics_park"
	case descent
	case urbanClimbingSpot = "urban_climbing_spot"
	case playground
	case indoorParkourPark = "indoor_parkour_park"
	case boulderingFacility = "bouldering_facility"
	case aomAcademy = "aom_academy"
	case trickingSchool = "tricking_school"
	case trampolinePark = "trampoline_park"
	case gymnasticsGym = "gymnastics_gym"
	case drinkingFountain = "drinking_fountain"
	
	public static var defaultCase: Self = .unknown
	
}

extension PlacemarkType {
	
	/// Icons from [Icons8](https://icons8.com)
	var iconName: String? {
		switch self {
		case .unknown:
			return nil
		case .trainingSpot, .outdoorParkourPark:
			return "icons8-trainers"
		case .calisthenicsPark:
			return "icons8-pullups"
		case .descent:
			return "icons8-height"
		case .urbanClimbingSpot:
			return "icons8-chalk_bag"
		case .playground:
			return "icons8-playground"
		case .indoorParkourPark:
			return "icons8-facility"
		case .boulderingFacility:
			return "icons8-climbing"
		case .aomAcademy:
			return "icons8-facility"
		case .trickingSchool:
			return "icons8-tricking"
		case .trampolinePark:
			return "icons8-trampoline_park"
		case .gymnasticsGym:
			return "icons8-gymnastics"
		case .drinkingFountain:
			return "icons8-drinking_fountain"
		}
	}
	
	/// Icons from [Icons8](https://icons8.com)
	var glyphName: String? {
		return iconName?.appending("_glyph")
	}
	
}

/// Extend for testing purposes
extension PlacemarkType: CaseIterable {}
