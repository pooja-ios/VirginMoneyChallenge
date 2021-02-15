//
//  RoomsTests.swift
//  VirginMoneyChallengeTests
//
//  Created by pooja sharma on 14/02/21.
//

import Quick
import Nimble

@testable import VirginMoneyChallenge

class RoomTests: QuickSpec {
    
    let networkManager = NetworkManager()
    
    override func spec() {
        describe("API testing") {
            it("can load room list") {
                waitUntil { done in
                    self.networkManager.fetchRooms(completion: { (rooms, error) in
                        expect(rooms?.count).to(equal(10))
                        done()
                    })
                }
            }
        }
    }
}

