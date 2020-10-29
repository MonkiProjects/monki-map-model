//
//  NilError.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 28/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation.NSError

struct NilError: Error, CustomStringConvertible {
	
	let description: String
	
	init<T>(_ value: T) {
		self.description = "\(type(of: value)) is nil"
	}
	
	init<T>(type: T.Type) {
		self.description = "\(type) is nil"
	}
	
	init(file: String, extension: String, locale: String, in bundle: Bundle) {
		self.description = "Could not find '\(file).\(`extension`)' in '\(locale)' locale in Bundle '\(bundle)'"
	}
	
}
