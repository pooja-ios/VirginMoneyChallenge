//
//  PeopleViewModel.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import Foundation

class PeopleViewModel: NSObject {

    private var networkManager: NetworkManager?
    var peopleArr : [People]? {
        didSet {
            self.updatePeopleList()
        }
    }
    var people : People? {
        didSet {
            self.updatePeopleDetail()
        }
    }
    
    var updatePeopleList : (() -> ()) = {}
    var updatePeopleDetail : (() -> ()) = {}
    
    override init() {
        super.init()
        networkManager = NetworkManager()
        fetchPeople()
    }
    
    convenience init(peopleId: String) {
        self.init()
        networkManager = NetworkManager()
        fetchPeopleDetail(peopleId: peopleId)
    }
    
    func fetchPeople() {
        networkManager?.fetchPeople() { (peopleData, error) in
            self.peopleArr = peopleData
            if error != nil {
                CommonFunction().showError(message: error?.localizedDescription ?? "Something went wrong")
            }
        }
    }
    
    func fetchPeopleDetail(peopleId: String) {
        networkManager?.fetchPeopleDetail(peopleId: peopleId) { (peopleData, error) in
            if let people = peopleData {
                self.people = people
            }
        }
    }
}
