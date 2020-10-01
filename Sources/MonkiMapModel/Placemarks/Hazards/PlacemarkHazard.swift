//
//  PlacemarkHazard.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 04/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public enum PlacemarkHazard: String, Codable, Hashable, DefaultCaseDecodable {
	
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
	
	public static func allowed(for type: PlacemarkType) throws -> [Self] {
		return type == .unknown ? [] : try type.asPrivate(in: Locale.en).allowedHazards
	}
	
	public static func allowed(for type: PlacemarkType.Localized) throws -> [Self] {
		return try self.allowed(for: type.id)
	}
	
}

extension PlacemarkHazard {
	
	/// Icons from [Icons8](https://icons8.com)
	var iconName: String? {
		switch self {
		case .unknown:
			return nil
		case .security:
			return "icons8-police"
		case .securityCam:
			return "icons8-security_cam"
		case .slipperySurface:
			return "icons8-slippery_floor"
		case .highDrop:
			return "icons8-cliff_jumping"
		case .uneasyAccess:
			return "icons8-uneasy_access"
		case .lockedDoor:
			return "icons8-locked_door"
		case .alarm:
			return "icons8-door_sensor"
		case .deathDrop:
			return "icons8-cliff_jumping"
		}
	}
	
}

/// Extend for testing purposes
extension PlacemarkHazard: CaseIterable {}
