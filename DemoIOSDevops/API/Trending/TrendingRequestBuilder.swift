//
//  TrendingRequestBuilder.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/7/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import Foundation

enum TrendingURLCase {
    case getTrendingRepo(language: String, since: String)
}

struct TrendingRequestBuilder: URLRequestProtocol {
    var urlCase: TrendingURLCase
    let baseUrl: String = ""
    
    func build() -> URLRequestProtocol {
        switch urlCase {
        case .getTrendingRepo(let language, let since):
//            return URLRequestProtocol
        default:
            break
        }
    }
}

