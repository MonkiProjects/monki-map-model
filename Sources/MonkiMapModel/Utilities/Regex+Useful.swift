//
//  Regex+Useful.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 03/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

let __idRegex = "[a-z0-9]+\\+?(_[a-z0-9]+\\+?)*"
let __idPredicate = NSPredicate(format: "SELF MATCHES %@", __idRegex)

extension String {
	
	/// `[a-z0-9]+\\+?(_[a-z0-9]+\\+?)*`
	///
	/// # Notes: #
	/// - Inspired by [How to validate an e-mail address in swift?](https://stackoverflow.com/a/41782027/10967642)
	var isValidId: Bool {
		return __idPredicate.evaluate(with: self)
	}
	
}
