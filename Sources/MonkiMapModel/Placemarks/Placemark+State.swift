//
//  Placemark+State.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark {
	
	enum State: String, Hashable, Codable, DefaultCaseDecodable {
		
		public static var defaultCase: Self = .unknown
		
		case unknown, draft, local, `private`, submitted, published, rejected
		
		public var isLocal: Bool {
			return [.draft, .local].contains(self)
		}
		
	}
	
}

/// Extend for testing purposes
extension Placemark.State: CaseIterable {}
