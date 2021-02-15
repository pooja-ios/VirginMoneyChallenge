//
//  Room.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import Foundation
import UIKit

struct Room: Decodable, Hashable {
    let id: String?
    let name: String?
    let maxOccupancy: Int?
    let isOccupied: Bool?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case maxOccupancy = "max_occupancy"
        case isOccupied = "is_occupied"
        case createdAt = "created_at"
    }
    
    func getOccupancyString() -> NSAttributedString {
        return "Maximum Occupancy : ".getAttributedString(foregroundcolor: .black, fontSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, appendingString: String(maxOccupancy ?? 0))
    }
}

