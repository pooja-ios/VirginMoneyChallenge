//
//  NetworkRequestRouter.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import Alamofire

public enum NetworkRequest: URLRequestConvertible {
    
    enum API {
        static let baseURL = "https://5f7c2c8400bd74001690a583.mockapi.io/api/v1"
    }
    
    case people
    case peopleDetail(String)
    case rooms
    
    var method: HTTPMethod {
        switch self {
        case .people, .rooms, .peopleDetail:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .people, .rooms, .peopleDetail:
            return [:]
        }
    }
    
    var path: String
    {
        switch self {
        case .people:
            return "/people"
        case .peopleDetail(let peopleId):
            return "/people/" + peopleId
        case .rooms:
            return "/rooms"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try API.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
