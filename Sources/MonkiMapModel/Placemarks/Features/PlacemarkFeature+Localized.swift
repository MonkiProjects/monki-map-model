//
//  PlacemarkFeature+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkFeature {
	
	public struct Localized: Codable, Hashable, Identifiable {
		
		public let id: String
		public let title: String
		
		public init(id: String, title: String) throws {
			try id.validate(with: __idPredicate)
			
			self.id = id
			self.title = title
		}
		
		public static func == (lhs: Self, rhs: Self) -> Bool {
			return lhs.id == rhs.id
		}
		
	}
	
	func title(in locale: Locale) throws -> String {
		return try self == .unknown ? Strings.unknown(in: locale) : self.asPrivate(in: locale).title
	}
	
	public func localized(in locale: Locale) throws -> Localized {
		return try .init(id: rawValue, title: title(in: locale))
	}
	
}
