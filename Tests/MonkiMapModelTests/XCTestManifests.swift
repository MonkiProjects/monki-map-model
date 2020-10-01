import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
	return [
		// Benefits
		testCase(PlacemarkBenefitTests.allTests),
		testCase(PlacemarkBenefitLocalizedTests.allTests),
		testCase(PlacemarkBenefitPrivateTests.allTests),
		// Categories
		testCase(PlacemarkCategoryTests.allTests),
		testCase(PlacemarkCategoryLocalizedTests.allTests),
		testCase(PlacemarkCategoryPrivateTests.allTests),
		// Features
		testCase(PlacemarkFeatureTests.allTests),
		testCase(PlacemarkFeatureLocalizedTests.allTests),
		testCase(PlacemarkFeaturePrivateTests.allTests),
		// Hazards
		testCase(PlacemarkHazardTests.allTests),
		testCase(PlacemarkHazardLocalizedTests.allTests),
		testCase(PlacemarkHazardPrivateTests.allTests),
		// Techniques
		testCase(ParkourTechniqueTests.allTests),
		testCase(ParkourTechniqueLocalizedTests.allTests),
		testCase(ParkourTechniquePrivateTests.allTests),
		// Types
		testCase(PlacemarkTypeTests.allTests),
		testCase(PlacemarkTypeLocalizedTests.allTests),
		testCase(PlacemarkTypePrivateTests.allTests),
	]
}
#endif
