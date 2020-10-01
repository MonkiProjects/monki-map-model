//
//  PlacemarkBenefit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public enum PlacemarkBenefit: String, Codable, Hashable, DefaultCaseDecodable {
	
	case unknown
	case drinkingFountain = "drinking_fountain"
	case coveredArea = "covered_area"
	case hooks
	case changingRoom = "changing_room"
	case coaching
	case wellKnown = "well_known"
	case equipmentRental = "equipment_rental"
	case shop
	
	public static var defaultCase: Self = .unknown
	
	public static func allowed(for type: PlacemarkType) throws -> [Self] {
		return type == .unknown ? [] : try type.asPrivate(in: Locale.en).allowedBenefits
	}
	
	public static func allowed(for type: PlacemarkType.Localized) throws -> [Self] {
		return try self.allowed(for: type.id)
	}
	
}

/// Extend for testing purposes
extension PlacemarkBenefit: CaseIterable {}
