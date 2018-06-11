//
//  APIService.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 31.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

//import Foundation
//import Alamofire
//import PromiseKit
//
//class APIService {
//    
//    static let sharedInstance = APIService()
//    
//    private var manager: SessionManager
//    
//    
//    private init() {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 30
//        configuration.timeoutIntervalForResource = 30
//        configuration.httpShouldSetCookies = false
//        manager = SessionManager(configuration: configuration)
//    }
//    
//    
//    @discardableResult
//    func getAppLocation(data: [Any]) -> Promise<[String: Any]?> {
//        
//        var parameters: [String: Any] = [:]
//        parameters["readings"] = data
//        
//        return manager.apiRequest(endpoint: .appLocation, parameters: parameters, accessToken: Constants.accessToken).apiResponse()
//            .then { [weak self] json in
//                print("API appLocation json: \(json)")
//                if let data = json as? [String: Any] {
//                    return Promise(value: data)
//                }
//                return Promise(value: nil)
//            }
//            .catch { error in
//                print("error: \(error)")
//        }
//    }
//    
//    func requestInfo(name: String, organization: String, email: String, phone: String) -> Promise<[String: Any]?> {
//        
//        var parameters: [String: Any] = [:]
//        parameters["name"] = name
//        parameters["organization"] = organization
//        parameters["email"] = email
//        parameters["phone"] = phone
//        
//        return manager.apiRequest(endpoint: .requestinfo, parameters: parameters, accessToken: Constants.accessToken).apiResponse()
//            .then { [weak self] json in
//                print("API appLocation json: \(json)")
//                if let data = json as? [String: Any] {
//                    return Promise(value: data)
//                }
//                return Promise(value: nil)
//            }
//            .catch { error in
//                print("error: \(error)")
//        }
//    }
//}
//
