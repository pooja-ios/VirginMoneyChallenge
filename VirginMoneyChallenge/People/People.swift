//
//  People.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import Foundation
import UIKit

struct People: Decodable, Equatable {
    let id: String?
    let avatar: String?
    let phone: String?
    let firstName: String?
    let lastName: String?
    let latitude: Double?
    let longitude: Double?
    let favouriteColor: String?
    let email: String?
    let jobTitle: String?
    let createdAt: String?
    
    func getFullName() -> String {
        var fullName = ""
        if let fName = firstName {
            fullName = fName
        }
        if let lName = lastName {
            fullName = fullName + " " + lName
        }
        return fullName
    }
    
    func getCreatedAtString() -> NSAttributedString {
        let date = CommonFunction().getFormattedDateString(dateString: createdAt ?? "")
        let joinedString = "Joined : ".getAttributedString(foregroundcolor: BRAND_COLOR, fontSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, appendingString: date ?? "")
        return joinedString
    }
}
