//
//  PlacemarkMapAnnotation.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(MapKit)
import MapKit

public class PlacemarkMapAnnotation: MKPointAnnotation {
	
	public var model: PlacemarkAnnotationModel {
		didSet {
			coordinate = CLLocationCoordinate2D(
				latitude: model.latitude,
				longitude: model.longitude
			)
			title = model.title
			subtitle = try? model.type.title(in: Locale.current)
		}
	}
	
	public init(model: PlacemarkAnnotationModel) {
		self.model = model
		
		super.init()
	}
	
}
#endif
