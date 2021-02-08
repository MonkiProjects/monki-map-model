//
//  PlacemarkKind+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Kind {
	
	struct Internal: Codable, Hashable, Identifiable, PlistDecodable {
		
		typealias Property = Placemark.Property
		
		static let fileName = "PlacemarkKinds"
		
		let id: Placemark.Kind
		let title: String
		let category: Placemark.Category
		private let features, goodForTraining, benefits, hazards: [String]
		
		var allowedFeatures: [Property] {
			return features.map(Property.feature)
		}
		
		var allowedTechniques: [Property] {
			return goodForTraining.map(Property.technique)
		}
		
		var allowedBenefits: [Property] {
			return benefits.map(Property.benefit)
		}
		
		var allowedHazards: [Property] {
			return hazards.map(Property.hazard)
		}
		
	}
	
	func `internal`(in locale: Locale = Locale.current) throws -> Internal {
		let values = Internal.all(in: locale)
		guard let first = values.first(where: { $0.id == self }) else {
			throw CustomError(
				reason: "Could not find a '\(Self.self)' in locale '\(locale)' with id '\(self.rawValue)'."
			)
		}
		return first
	}
	
	func title(in locale: Locale = Locale.current) throws -> String {
		return try self == .unknown
			? Strings.unknown(in: locale)
			: self.internal(in: locale).title
	}
	
}
