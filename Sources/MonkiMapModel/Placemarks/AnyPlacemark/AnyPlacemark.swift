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
	
	public var wrappedValue: PlacemarkProtocol {
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

/// Allows placemark categories to be used as coding keys to decode `AnyPlacemark`s.
extension PlacemarkCategory: CodingKey {}

extension AnyPlacemark: Codable {
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: PlacemarkCategory.self)
		
		if let spot = try container.decodeIfPresent(Spot.self, forKey: .spot) {
			self = .spot(spot)
		} else if let facility = try container.decodeIfPresent(Facility.self, forKey: .facility) {
			self = .facility(facility)
		} else {
			self = .drinkingWater(try container.decode(DrinkingWater.self, forKey: .drinkingWater))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: PlacemarkCategory.self)
		
		switch self {
		case .spot(let spot):
			try container.encode(spot, forKey: .spot)
		case .facility(let facility):
			try container.encode(facility, forKey: .facility)
		case .drinkingWater(let drinkingWater):
			try container.encode(drinkingWater, forKey: .drinkingWater)
		}
	}
	
}

extension AnyPlacemark: Identifiable {
	
	public var id: UUID { wrappedValue.id }
	
}
