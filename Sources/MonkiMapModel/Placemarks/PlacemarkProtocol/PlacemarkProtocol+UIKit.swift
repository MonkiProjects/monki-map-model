//
//  PlacemarkProtocol+UIKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension PlacemarkProtocol {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? {
		if publicationStatus == .draft {
			return UIImage(systemName: "doc.text")!
		} else if let uiIcon = _type.uiIcon {
			return uiIcon
		} else {
			return nil
		}
	}
	
	@available(iOS 13.0, *)
	public var uiColor: UIColor {
		return _category.uiColor(publicationStatus: publicationStatus)
	}
	
}
#endif
