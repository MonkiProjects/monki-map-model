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

/// Extend for testing purposes
extension PlacemarkHazard: CaseIterable {}
