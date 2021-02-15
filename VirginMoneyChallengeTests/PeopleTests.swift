//
//  PeopleTests.swift
//  VirginMoneyChallengeTests
//
//  Created by pooja sharma on 14/02/21.
//

import Quick
import Nimble

@testable import VirginMoneyChallenge

class PeopleTests: QuickSpec {
    
    let networkManager = NetworkManager()
    
    override func spec() {
        describe("API testing") {
            it("can load people list") {
                waitUntil { done in
                    self.networkManager.fetchPeople(completion: { (people, error) in
                        expect(people?.count).to(equal(100))
                        done()
                    })
                }
            }
            
            it("can load people detail") {
                waitUntil(timeout: .seconds(2)) { done in
                    self.networkManager.fetchPeopleDetail(peopleId: "100", completion: { (people, error) in
                        expect(people?.firstName).to(equal("Georgianna"))
                        expect(people?.lastName).to(equal("Gleichner"))
                        done()
                    })
                }
            }
        }
    }
}
