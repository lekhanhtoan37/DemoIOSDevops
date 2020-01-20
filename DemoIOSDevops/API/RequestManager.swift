//
//  BaseRequest.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/6/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import Foundation

class RequestManager<T: Codable> {
    
    var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    // Rest API
    func get(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        urlSession.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(.failure(HTTPResponseError.noStatusCode))
                return
            }
        }
    }
    
    func upload<E: Encodable>(url: URLRequest, body: E, completion: @escaping (Result<T, Error>) -> Void) {
        
        urlSession.dataTask(with: url) { (data, response, error) in
            guard let bodyData = try JSONEncoder().encode(body) else {
                completion(.failure(error!))
                return
            }
            
        }
        
        
        urlSession.uploadTask(with: <#T##URLRequest#>, from: , completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
    }
}
