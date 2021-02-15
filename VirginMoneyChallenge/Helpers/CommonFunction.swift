//
//  CommonFunction.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import UIKit

class CommonFunction {

    func showError(message: String) {
        if let rootController = UIApplication.shared.windows[0].rootViewController {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            rootController.present(alertController, animated: true, completion: nil)
        }
    }
    
    func getFormattedDateString(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "en_US")
        let formattedDate = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "MMM dd, yyyy"
        if let date = formattedDate {
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
