//
//  CommonTests.swift
//  VirginMoneyChallengeTests
//
//  Created by pooja sharma on 14/02/21.
//

import Quick
import Nimble

@testable import VirginMoneyChallenge

class CommonTests: QuickSpec {
    
    override func spec() {
        describe("test date") {
            it("should return correct date format") {
                let date = CommonFunction().getFormattedDateString(dateString: "2020-12-14T12:12:29.677Z")
                expect(date).toEventuallyNot(beNil())
            }
        }
    }
}
