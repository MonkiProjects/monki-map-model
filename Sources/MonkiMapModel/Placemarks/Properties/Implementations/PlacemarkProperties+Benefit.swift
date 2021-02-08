//
//  PlacemarkProperties+Benefit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark.Properties {
	
	enum Benefit: String, Codable, Hashable, DefaultCaseDecodable {
		
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
		
		public static func allowed(for kind: Placemark.Kind) throws -> [Placemark.Property] {
			return kind == .unknown ? [] : try kind.internal(in: Locale.en).allowedBenefits
		}
		
	}
	
	static func benefit(_ benefit: Benefit) -> Placemark.Property {
		return .init(id: benefit.rawValue, kind: .benefit)
	}
	
}

/// Extend for testing purposes
extension Placemark.Properties.Benefit: CaseIterable {}
