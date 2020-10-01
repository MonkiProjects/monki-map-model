//
//  PlacemarkType+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 25/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkType {
	
	public struct Localized: Codable, Hashable, Identifiable {
		
		public let id: PlacemarkType
		public let title: String
		
		public init(id: PlacemarkType, title: String) {
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
	
	public func localized(in locale: Locale = Locale.current) throws -> Localized {
		return .init(id: self, title: try title(in: locale))
	}
	
}
