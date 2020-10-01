//
//  PlacemarkFeature+Private.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkFeature {
	
	struct Private: Codable, Hashable, Identifiable, PlistDecodable {
		
		static let fileName = "PlacemarkFeatures"
		
		let id: String
		let title: String
		
	}
	
	func asPrivate(in locale: Locale) throws -> Private {
		let hazards = Private.all(in: locale)
		guard let hazard = hazards.first(where: { $0.id == rawValue }) else {
			throw CustomError(reason: "Could not find a \(Self.self) in locale '\(locale)' with id '\(rawValue)'.")
		}
		return hazard
	}
	
}
