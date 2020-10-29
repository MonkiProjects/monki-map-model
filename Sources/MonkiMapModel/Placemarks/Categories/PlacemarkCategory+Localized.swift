//
//  PlacemarkCategory+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkCategory: MultiLocaleLocalizable {
	
	public struct Localized: Codable, Hashable, Identifiable {
		
		public let id: PlacemarkCategory
		public let title: String
		
		public init(id: PlacemarkCategory, title: String) {
			self.id = id
			self.title = title
		}
		
		public init(forType type: PlacemarkType, in locale: Locale) throws {
			self = try type
				.asPrivate(in: Locale.en).category 	// Get type category
				.localized(in: locale) 				// Get localized category
		}
		
		public static func == (lhs: Self, rhs: Self) -> Bool {
			return lhs.id == rhs.id
		}
		
	}
	
	func title(in locale: Locale) throws -> String {
		return try self == .unknown ? Strings.unknown(in: locale) : self.asPrivate(in: locale).title
	}
	
	public func localized(in locale: Locale = Locale.current) throws -> Localized {
		return try locale.firstMatch(in: { try Localized(id: self, title: title(in: $0)) })
	}
	
}
