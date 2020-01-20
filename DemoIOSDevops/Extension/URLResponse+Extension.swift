//
//  URLResponse+Extension.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/6/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    
    var status: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: statusCode)
    }
    var responseError: HTTPResponseError? {
        return HTTPResponseError(rawValue: statusCode)
    }
    
}

extension URLResponse {
    var statusCode: HTTPStatusCode? {
        return (self as? HTTPURLResponse)?.status
    }
    
    var error: HTTPResponseError? {
        return (self as? HTTPURLResponse)?.responseError
    }
    
}
