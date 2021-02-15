//
//  Strings.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 15/02/21.
//

import UIKit

extension String {
    
    func getAttributedString(foregroundcolor: UIColor, fontSize: CGFloat, appendingString: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: foregroundcolor, .font: UIFont.boldSystemFont(ofSize: fontSize)]
        let attString = NSMutableAttributedString(string: self, attributes: attributes)
        attString.append(NSAttributedString(string: appendingString))
        return attString
    }
}
