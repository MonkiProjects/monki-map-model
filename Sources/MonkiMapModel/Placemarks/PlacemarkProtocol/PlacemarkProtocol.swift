//
//  PlacemarkProtocol.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public protocol PlacemarkProtocol: Codable {
	
	var id: UUID { get }
	var title: String { get }
	var caption: String? { get }
	var latitude: Double { get }
	var longitude: Double { get }
	var creator: MPUser.Public.Small? { get }
	var createdAt: Date { get }
	var publicationStatus: PlacemarkPublicationStatus { get }
	var city: String? { get }
	var country: String? { get }
	var images: [URL] { get }
	var satelliteImage: URL? { get }
	var type: PlacemarkType.Localized { get }
	var category: PlacemarkCategory.Localized { get }
	var features: [PlacemarkFeature.Localized] { get }
	var goodForTraining: [ParkourTechnique.Localized] { get }
	var benefits: [PlacemarkBenefit.Localized] { get }
	var hazards: [PlacemarkHazard.Localized] { get }
	var url: URL? { get }
	var htmlUrl: URL? { get }
	var isLiked: Bool { get }
	var isFavorited: Bool { get }
	
	var isLocal: Bool { get }
	
}

extension PlacemarkProtocol {
	
	public var isLocal: Bool {
		[.draft, .local].contains(publicationStatus)
	}
	
}
