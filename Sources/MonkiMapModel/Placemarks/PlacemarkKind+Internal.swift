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
		typealias Properties = Placemark.Properties
		
		static let fileName = "PlacemarkKinds"
		
		let id: Placemark.Kind
		let title: String
		let category: Placemark.Category
		private let features, goodForTraining, benefits, hazards: [String]
		
		var allowedFeatures: [Placemark.Property] {
			return features
				.map(Properties.Feature.init(rawValue:))
				.map(Properties.feature)
		}
		
		var allowedTechniques: [Property] {
			return goodForTraining
				.map(Properties.Technique.init(rawValue:))
				.map(Properties.technique)
		}
		
		var allowedBenefits: [Property] {
			return benefits
				.map(Properties.Benefit.init(rawValue:))
				.map(Properties.benefit)
		}
		
		var allowedHazards: [Property] {
			return hazards
				.map(Properties.Hazard.init(rawValue:))
				.map(Properties.hazard)
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
