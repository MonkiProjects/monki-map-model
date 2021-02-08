//
//  PlacemarkCategory+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Category {
	
	struct Internal: Codable, Hashable, Identifiable, PlistDecodable {
		
		static let fileName = "PlacemarkCategories"
		
		let id: Placemark.Category
		let title: String
		
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
