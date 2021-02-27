//
//  Bundle+Fix.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//

import Foundation

// This workaround comes from Skyler_s and Nekitosss on <https://developer.apple.com/forums/thread/664295>

public let localBundle = Bundle.fixedModule

private final class CurrentBundleFinder {}

private let packageName: String = "monki-map-model"
private let targetName: String = "MonkiMapModel"

extension Foundation.Bundle {
	
	/// Returns the resource bundle associated with the current Swift module.
	///
	/// # Notes: #
	/// 1. This is inspired by the `Bundle.module` declaration
	static var fixedModule: Bundle = Bundle.module
	
}
