//
//  Coordinator.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import UIKit

class Coordinator {

    func showPeopleDetail(navigationController: UINavigationController, people: People) {
        let vc = PeopleDetailViewController.instantiate()
        vc.people = people
        navigationController.pushViewController(vc, animated: true)
    }
}

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
