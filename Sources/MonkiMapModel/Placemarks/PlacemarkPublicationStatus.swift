//
//  PlacemarkPublicationStatus.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public enum PlacemarkPublicationStatus: String, Hashable, Codable, DefaultCaseDecodable {
	
	public static var defaultCase: Self = .unknown
	
	case unknown, draft, local, submitted, published, rejected
	
}

/// Extend for testing purposes
extension PlacemarkPublicationStatus: CaseIterable {}
