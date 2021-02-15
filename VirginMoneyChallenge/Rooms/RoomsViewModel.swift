//
//  RoomsViewModel.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import Foundation

class RoomsViewModel: NSObject {

    private var networkManager: NetworkManager?
    var roomArr : [Room]? {
        didSet {
            self.updateRoomList()
        }
    }
    
    var updateRoomList : (() -> ()) = {}
    
    override init() {
        super.init()
        networkManager = NetworkManager()
        fetchRooms()
    }
    
    func fetchRooms() {
        networkManager?.fetchRooms() { (roomsData, error) in
            self.roomArr = roomsData
            if error != nil {
                CommonFunction().showError(message: error?.localizedDescription ?? "Something went wrong")
            }
        }
    }
    
    func getAvailableRooms() -> [Room]? {
        return roomArr?.filter() { $0.isOccupied == false }
    }
    
    func getOccupiedRooms() -> [Room]? {
        return roomArr?.filter() { $0.isOccupied == true }
    }
}
