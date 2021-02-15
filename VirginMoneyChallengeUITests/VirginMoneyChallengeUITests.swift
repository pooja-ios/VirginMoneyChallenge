//
//  VirginMoneyChallengeUITests.swift
//  VirginMoneyChallengeUITests
//
//  Created by pooja sharma on 13/02/21.
//

import Quick
import Nimble

@testable import VirginMoneyChallenge

class VirginMoneyChallengeUITests: QuickSpec {
    
    override func spec() {
        
        let app = XCUIApplication()
        
        describe("launch app") {
            app.launch()
            
            context("when app is launched") {
                it("can load people") {
                    app.tables.cells.staticTexts["Maybell Durgan"].tap()
                    let emailLbl = app.staticTexts["Izaiah.Little@hotmail.com"]
                    expect(emailLbl.exists).toEventually(beTrue())
                    
                    app.tabBars["Tab Bar"].buttons["Rooms"].tap()
                    let availableBtn = app.buttons["Available"]
                    expect(availableBtn.isSelected).toEventually(beTrue())
                    let availableRoomLbl = app.tables.cells.staticTexts["Yoshi's Island"]
                    expect(availableRoomLbl.exists).toEventually(beTrue())
                    
                    let occupiedBtn = app.buttons["Occupied"]
                    expect(occupiedBtn.exists).toEventually(beTrue())
                    occupiedBtn.tap()
                    let occupiedRoomLbl = app.tables.cells.staticTexts["Megaman"]
                    expect(occupiedRoomLbl.exists).toEventually(beTrue())
                }
            }
        }
    }
}
