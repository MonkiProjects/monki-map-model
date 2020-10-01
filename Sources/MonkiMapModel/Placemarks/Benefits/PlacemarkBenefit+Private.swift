//
//  PlacemarkBenefit+Private.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkBenefit {
	
	struct Private: Codable, Hashable, Identifiable, PlistDecodable {
		
		static let fileName = "PlacemarkBenefits"
		
		let id: String
		let title: String
		
	}
	
	func asPrivate(in locale: Locale) throws -> Private {
		let techniques = Private.all(in: locale)
		guard let technique = techniques.first(where: { $0.id == rawValue }) else {
			throw CustomError(reason: "Could not find a \(Self.self) in locale '\(locale)' with id '\(rawValue)'.")
		}
		return technique
	}
	
}
