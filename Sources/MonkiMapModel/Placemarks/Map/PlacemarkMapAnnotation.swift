//
//  PlacemarkMapAnnotation.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(MapKit)
import MapKit

class PlacemarkMapAnnotation: MKPointAnnotation {
	
	let model: PlacemarkAnnotationModel
	
	init(model: PlacemarkAnnotationModel) {
		self.model = model
		super.init()
		self.coordinate = CLLocationCoordinate2D(
			latitude: model.latitude,
			longitude: model.longitude
		)
	}
	
}
#endif
