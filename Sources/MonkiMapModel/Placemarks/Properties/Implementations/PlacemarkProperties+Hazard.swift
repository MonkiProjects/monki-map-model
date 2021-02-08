//
//  PlacemarkProperties+Hazard.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 04/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark.Properties {
	
	enum Hazard: String, Codable, Hashable, DefaultCaseDecodable {
		
		case unknown
		case security
		case securityCam = "security_cam"
		case slipperySurface = "slippery_surface"
		case highDrop = "high_drop"
		case uneasyAccess = "uneasy_access"
		case lockedDoor = "locked_door"
		case alarm
		case deathDrop = "death_drop"
		
		public static var defaultCase: Self = .unknown
		
		public static func allowed(for kind: Placemark.Kind) throws -> [Placemark.Property] {
			return kind == .unknown ? [] : try kind.internal(in: Locale.en).allowedHazards
		}
		
	}
	
	static func hazard(_ hazard: Hazard) -> Placemark.Property {
		return .init(id: hazard.rawValue, kind: .hazard)
	}
	
}

/// Extend for testing purposes
extension Placemark.Properties.Hazard: CaseIterable {}
