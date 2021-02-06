//
//  Regex+Useful.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 03/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

let __idRegex = "[a-z0-9]+\\+?(_[a-z0-9]+\\+?)*"
// swiftlint:disable:previous identifier_name

let __idPredicate = NSPredicate(format: "SELF MATCHES %@", __idRegex)
// swiftlint:disable:previous identifier_name

extension String {
	
	// swiftlint:disable line_length
	/// `[a-z0-9]+\\+?(_[a-z0-9]+\\+?)*`
	///
	/// # Notes: #
	/// - Inspired by [How to validate an e-mail address in swift?](https://stackoverflow.com/a/41782027/10967642)
	var isValidId: Bool {
		return __idPredicate.evaluate(with: self)
	}
	// swiftlint:enable line_length
	
}