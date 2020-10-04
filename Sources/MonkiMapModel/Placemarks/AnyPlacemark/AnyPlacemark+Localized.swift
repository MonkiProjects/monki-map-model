//
//  AnyPlacemark+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension AnyPlacemark {
	
	public enum Localized {
		
		public enum Small: Hashable {
			
			case spot(Spot.Localized.Small)
			case facility(Facility.Localized.Small)
			case drinkingWater(DrinkingWater.Localized.Small)
			
			public var wrappedValue: SmallPlacemarkProtocol {
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
		
		public enum Full: Hashable {
			
			case spot(Spot.Localized.Full)
			case facility(Facility.Localized.Full)
			case drinkingWater(DrinkingWater.Localized.Full)
			
			public var wrappedValue: FullPlacemarkProtocol {
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
		
	}
	
	public func localizedSmall(in locale: Locale = Locale.current) throws -> Localized.Small {
		switch self {
		case .spot(let spot):
			return .spot(try spot.localizedSmall(in: locale))
		case .facility(let facility):
			return .facility(try facility.localizedSmall(in: locale))
		case .drinkingWater(let drinkingWater):
			return .drinkingWater(try drinkingWater.localizedSmall(in: locale))
		}
	}
	
	public func localizedFull(in locale: Locale = Locale.current) throws -> Localized.Full {
		switch self {
		case .spot(let spot):
			return .spot(try spot.localizedFull(in: locale))
		case .facility(let facility):
			return .facility(try facility.localizedFull(in: locale))
		case .drinkingWater(let drinkingWater):
			return .drinkingWater(try drinkingWater.localizedFull(in: locale))
		}
	}
	
}

extension AnyPlacemark.Localized.Small: Codable {
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: PlacemarkCategory.self)
		
		if let spot = try container.decodeIfPresent(Spot.Localized.Small.self, forKey: .spot) {
			self = .spot(spot)
		} else if let facility = try container.decodeIfPresent(Facility.Localized.Small.self, forKey: .facility) {
			self = .facility(facility)
		} else {
			self = .drinkingWater(try container.decode(DrinkingWater.Localized.Small.self, forKey: .drinkingWater))
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

extension AnyPlacemark.Localized.Small: Identifiable {
	
	public var id: UUID { wrappedValue.id }
	
}

extension AnyPlacemark.Localized.Full: Codable {
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: PlacemarkCategory.self)
		
		if let spot = try container.decodeIfPresent(Spot.Localized.Full.self, forKey: .spot) {
			self = .spot(spot)
		} else if let facility = try container.decodeIfPresent(Facility.Localized.Full.self, forKey: .facility) {
			self = .facility(facility)
		} else {
			self = .drinkingWater(try container.decode(DrinkingWater.Localized.Full.self, forKey: .drinkingWater))
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

extension AnyPlacemark.Localized.Full: Identifiable {
	
	public var id: UUID { wrappedValue.id }
	
}
