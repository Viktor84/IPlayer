//
//  NSError+IPlayer.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 13.06.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation


/*
 200 — Success                — A few API functions may return a json object with ‘status’ = ‘OK’ or ‘FAIL’)
 202 — Content not yet ready  — e.g.:- device not yet approved in “app/get_device_token”)
 204 — Success , No Content   — e.g.:- Device Logged out
 400 — Bad Request            — Validation errors, missing parameters etc.
 401 — Unauthorized           — Authentication Failed
 403 — Permission Denied      — No permission to access the resource or action.
 404 — Not Found              — Resource not found
 409 — Conflict               — eg:- Device already active or approved
 */

// MARK: - NSError
public enum ErrorType: Int {
    case unknown = 1
    case success = 200
    case successRequestInfo = 201
    case unready = 202
    case nocontent = 204
    case badrequest = 400
    case unauthorized = 401
    case permission = 403
    case notfound = 404
    case conflict = 409
    
    case apnsToken = 2 //local APNS Device Token does not exist
    
    func localizedUserInfo(description: Any?) -> [String: String] {
        var localizedDescription: String = ""
        let localizedFailureReasonError: String = ""
        let localizedRecoverySuggestionError: String = ""
        
        let comment = "Error.\(String(describing: self).capitalized)"
        
        if let data = description as? [String: Any], let detail = data["detail"] as? String {
            localizedDescription = NSLocalizedString(detail, comment: comment)
        } else {
            switch self {
            case .apnsToken:
                localizedDescription = NSLocalizedString("Please enable Push Notifications and relaunch the application", comment: comment)
            case .unknown:
                localizedDescription = NSLocalizedString("Unknown error", comment: comment)
            case .success:
                localizedDescription = NSLocalizedString("Success", comment: comment)
            case .successRequestInfo:
                localizedDescription = NSLocalizedString("Success request info sent", comment: comment)
            case .unready:
                localizedDescription = NSLocalizedString("Content not yet ready", comment: comment)
            case .nocontent:
                localizedDescription = NSLocalizedString("Success , No Content - Device Logged out", comment: comment)
            case .badrequest:
                localizedDescription = NSLocalizedString("Bad Request - Validation errors, missing parameters etc", comment: comment)
            case .unauthorized:
                localizedDescription = NSLocalizedString("Authentication Failed", comment: comment)
            case .permission:
                localizedDescription = NSLocalizedString("Permission Denied", comment: comment)
            case .notfound:
                localizedDescription = NSLocalizedString("Not Found", comment: comment)
            case .conflict:
                localizedDescription = NSLocalizedString("Conflict - Device already active or approved", comment: comment)
            }
        }
        return [
            NSLocalizedDescriptionKey: localizedDescription,
            NSLocalizedFailureReasonErrorKey: localizedFailureReasonError,
            NSLocalizedRecoverySuggestionErrorKey: localizedRecoverySuggestionError
        ]
    }
}

public let ProjectErrorDomain = "TrakkersErrorDomain"

extension NSError {
    
    public convenience init(type: ErrorType, description: Any?) {
        self.init(domain: ProjectErrorDomain, code: type.rawValue, userInfo: type.localizedUserInfo(description: description))
    }
}

