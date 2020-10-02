//
//  PlacemarkProtocol+Small.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 02/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public protocol SmallPlacemarkProtocol: Codable {
	
	var id: UUID { get }
	var title: String { get }
	var latitude: Double { get }
	var longitude: Double { get }
	var publicationStatus: PlacemarkPublicationStatus { get }
	var type: PlacemarkType.Localized { get }
	var category: PlacemarkCategory.Localized { get }
	var isLiked: Bool { get }
	var isFavorited: Bool { get }
	/// Used to update data client-side
	var updatedAt: Date { get }
	
}
