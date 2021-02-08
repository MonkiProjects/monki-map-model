//
//  PlacemarkProperty+Kind.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public extension Placemark.Property {
	
	enum Kind: String, Codable {
		case feature, technique, benefit, hazard
	}
	
	static func feature(_ feature: ID) -> Self {
		return .init(id: feature, kind: .feature)
	}
	
	static func technique(_ technique: ID) -> Self {
		return .init(id: technique, kind: .technique)
	}
	
	static func benefit(_ benefit: ID) -> Self {
		return .init(id: benefit, kind: .benefit)
	}
	
	static func hazard(_ hazard: ID) -> Self {
		return .init(id: hazard, kind: .hazard)
	}
	
}
