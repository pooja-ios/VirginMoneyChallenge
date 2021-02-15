//
//  NetworkManager.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import UIKit
import Alamofire

class NetworkManager {
    
    func fetchPeople(completion: @escaping ([People]?, Error?) -> Void) {
        let request = AF.request(NetworkRequest.people)
        request.responseDecodable(of: [People].self) { (response) in
            guard let peopleResponse = response.value
            else {
                completion(nil, response.error)
                return
            }
            completion(peopleResponse, nil)
        }
    }
    
    func fetchPeopleDetail(peopleId: String, completion: @escaping (People?, Error?) -> Void) {
        let request = AF.request(NetworkRequest.peopleDetail(peopleId))
        request.responseDecodable(of: People.self) { (response) in
            guard let people = response.value
            else {
                completion(nil, response.error)
                return
            }
            completion(people, nil)
        }
    }
    
    func fetchRooms(completion: @escaping ([Room]?, Error?) -> Void) {
        let request = AF.request(NetworkRequest.rooms)
        request.responseDecodable(of: [Room].self) { (response) in
            guard let rooms = response.value
            else {
                completion(nil, response.error)
                return
            }
            completion(rooms, nil)
        }
    }
}
