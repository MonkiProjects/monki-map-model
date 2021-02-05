//
//  PlacemarkBenefit+UIKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension PlacemarkBenefit {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? {
		if let iconName = self.iconName {
			return UIImage(named: iconName, in: .fixedModule, compatibleWith: nil)
		} else {
			return nil
		}
	}
	
}
#endif
