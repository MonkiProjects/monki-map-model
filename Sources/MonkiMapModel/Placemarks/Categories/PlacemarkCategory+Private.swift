//
//  PlacemarkCategory+Private.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkCategory {
	
	struct Private: Codable, Hashable, Identifiable, PlistDecodable {
		
		static let fileName = "PlacemarkCategories"
		
		let id: PlacemarkCategory
		let title: String
		
	}
	
	func asPrivate(in locale: Locale) throws -> Private {
		let hazards = Private.all(in: locale)
		guard let hazard = hazards.first(where: { $0.id == self }) else {
			throw CustomError(reason: "Could not find a \(Self.self) in locale '\(locale)' with id '\(self.rawValue)'.")
		}
		return hazard
	}
	
}
