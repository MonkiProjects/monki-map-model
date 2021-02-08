//
//  PlacemarkProperty+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public extension Placemark.Property {
	
	struct Localized: Codable, Equatable, Identifiable {
		
		public let id: String
		public let title: String
		public let kind: Placemark.Property.Kind
		
		fileprivate init(id: ID, title: String, kind: Placemark.Property.Kind) {
			// No need to check id, it comes from enum cases
			self.id = id
			self.title = title
			self.kind = kind
		}
		
	}
	
	internal func `internal`(in locale: Locale = Locale.current) throws -> Placemark.Properties.Internal {
		return try Placemark.Properties.Internal.all(in: locale)
			.first(where: { $0.id == self.id && $0.kind == self.kind })
			.require()
	}
	
	func title(in locale: Locale = Locale.current) throws -> String {
		return try self.id == "unknown" // Unsafe but we cannot use .unknown here
			? Strings.unknown(in: locale)
			: self.internal(in: locale).title
	}
	
	func localized(in locale: Locale = Locale.current) throws -> Localized {
		return Localized(id: self.id, title: try self.title(in: locale), kind: self.kind)
	}
	
}
