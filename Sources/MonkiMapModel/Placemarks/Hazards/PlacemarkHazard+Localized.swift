//
//  PlacemarkHazard+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension PlacemarkHazard: MultiLocaleLocalizable {
	
	public struct Localized: Codable, Hashable, Identifiable {
		
		public let id: PlacemarkHazard
		public let title: String
		
		public init(id: String, title: String) throws {
			try id.validate(with: __idPredicate)
			
			self.id = PlacemarkHazard(rawValue: id)
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
		return try locale.firstMatch(in: { try Localized(id: rawValue, title: title(in: $0)) })
	}
	
}
