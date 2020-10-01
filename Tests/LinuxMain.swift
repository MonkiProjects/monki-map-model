import XCTest
import MonkiMapModelTests

var tests = [XCTestCaseEntry]()
tests += PlacemarkBenefitTests.allTests()
tests += PlacemarkBenefitLocalizedTests.allTests()
XCTMain(tests)
