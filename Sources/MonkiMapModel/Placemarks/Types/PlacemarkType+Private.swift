//
//  PlacemarkType+Private.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkType {
	
	struct Private: Codable, Hashable, Identifiable, PlistDecodable {
		
		static let fileName = "PlacemarkTypes"
		
		let id: PlacemarkType
		let title: String
		let category: PlacemarkCategory
		private let features: [String]
		private let goodForTraining: [String]
		private let benefits: [String]
		private let hazards: [String]
		
		var allowedFeatures: [PlacemarkFeature] {
			return features.map(PlacemarkFeature.init(rawValue:))
		}
		
		var allowedTechniques: [ParkourTechnique] {
			return goodForTraining.map(ParkourTechnique.init(rawValue:))
		}
		
		var allowedBenefits: [PlacemarkBenefit] {
			return benefits.map(PlacemarkBenefit.init(rawValue:))
		}
		
		var allowedHazards: [PlacemarkHazard] {
			return hazards.map(PlacemarkHazard.init(rawValue:))
		}
		
	}
	
	func asPrivate(in locale: Locale) throws -> Private {
		let hazards = Private.all(in: locale)
		guard let hazard = hazards.first(where: { $0.id == self }) else {
			throw CustomError(reason: "Could not find a \(Self.self) in locale '\(locale)' with id '\(self.rawValue)'.")
		}
		return hazard
	}
	
}
