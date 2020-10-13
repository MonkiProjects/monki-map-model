//
//  AnyPlacemark.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 13/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public enum AnyPlacemark: Hashable {
	
	case spot(Spot), facility(Facility), drinkingWater(DrinkingWater)
	
	public var wrappedValue: LocalizedPlacemarkProtocol {
		switch self {
		case .spot(let spot):
			return spot
		case .facility(let facility):
			return facility
		case .drinkingWater(let drinkingWater):
			return drinkingWater
		}
	}
	
}

extension AnyPlacemark: Codable {
	
	private enum CodingKeys: String, CodingKey {
		case category
	}
	
	public init(from decoder: Decoder) throws {
		let categoryContainer = try decoder.container(keyedBy: CodingKeys.self)
		let valueContainer = { try decoder.singleValueContainer() }
		
		switch try categoryContainer.decode(PlacemarkCategory.self, forKey: .category) {
		case .spot:
			self = .spot(try valueContainer().decode(Spot.self))
		case .facility:
			self = .facility(try valueContainer().decode(Facility.self))
		case .drinkingWater:
			self = .drinkingWater(try valueContainer().decode(DrinkingWater.self))
		case .unknown:
			throw DecodingError.dataCorruptedError(
				forKey: CodingKeys.category,
				in: categoryContainer,
				debugDescription: "Unknown category"
			)
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		
		switch self {
		case .spot(let spot):
			try container.encode(spot)
		case .facility(let facility):
			try container.encode(facility)
		case .drinkingWater(let drinkingWater):
			try container.encode(drinkingWater)
		}
	}
	
}

extension AnyPlacemark: Identifiable {
	
	public var id: UUID { wrappedValue.id }
	
}
