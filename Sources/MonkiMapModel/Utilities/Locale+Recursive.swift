//
//  Locale+Recursive.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 29/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation.NSLocale

extension Locale {
	
	static var languageCodeKey: String { CFLocaleKey.languageCode.rawValue as String }
	static var countryCodeKey: String { CFLocaleKey.countryCode.rawValue as String }
	
	func firstMatch<Output>(in function: (Locale) throws -> (Output)) rethrows -> Output {
		var components = Locale.components(fromIdentifier: self.identifier)
		
		// Keep only language and country codes
		components = [
			Self.languageCodeKey: components[Self.languageCodeKey],
			Self.countryCodeKey: components[Self.countryCodeKey],
		].compactMapValues({ $0 })
		
		// `Locale` from components constructor
		let locale: () -> Locale = {
			Locale(identifier: Locale.identifier(fromComponents: components))
		}
		
		// Try with language and country codes
		do {
			return try function(locale())
		} catch {}
		
		// Remove country code
		components.removeValue(forKey: Self.countryCodeKey)
		
		// Try again with only language code
		return try function(locale())
	}
	
}
