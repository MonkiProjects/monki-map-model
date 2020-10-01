//
//  PlacemarkFeature.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public enum PlacemarkFeature: String, Codable, Hashable, DefaultCaseDecodable {
	
	case unknown
	case smallWall = "small_wall"
	case mediumWall = "medium_wall"
	case bigWall = "big_wall"
	case railing
	case stairs
	case bar
	case parallelBars = "parallel_bars"
	case ladder
	case grass
	case sand
	case water
	case tree
	case treeTrunk = "tree_trunk"
	case smallRocks = "small_rocks"
	case mediumRocks = "medium_rocks"
	case bigRocks = "big_rocks"
	case trampoline
	case foamPit = "foam_pit"
	case airbag
	case ninjaWarriorArea = "ninja_warrior_area"
	case ninjaWarriorWall = "ninja_warrior_wall"
	case chaseTagSetup = "chase_tag_setup"
	case oneFloor = "1_floor"
	case twoFloors = "2_floors"
	case threeFloors = "3_floors"
	case fourFloors = "4_floors"
	case fiveFloors = "5_floors"
	case sixFloors = "6_floors"
	case sevenFloors = "7_floors"
	case moreThanSevenFloors = "7+_floors"
	case bench
	
	public static var defaultCase: Self = .unknown
	
	public static func allowed(for type: PlacemarkType) throws -> [Self] {
		return type == .unknown ? [] : try type.asPrivate(in: Locale.en).allowedFeatures
	}
	
	public static func allowed(for type: PlacemarkType.Localized) throws -> [Self] {
		return try self.allowed(for: type.id)
	}
	
}

/// Extend for testing purposes
extension PlacemarkFeature: CaseIterable {}
