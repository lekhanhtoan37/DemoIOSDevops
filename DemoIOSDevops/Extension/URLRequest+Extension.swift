//
//  URLRequest+Extension.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/7/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

protocol URLRequestProtocol {
    var url: URL { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: String]? { get }
    var codableBody: Encodable? { get }
    var jsonBody: JSON? { get }
}

extension URLRequest {
    
}

extension URLSession {
    func dataTask(with request: URLRequestProtocol, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return dataTask(with: prepareUrlRequest(from: request), completionHandler: completionHandler)
    }
    
    func uploadTask(with request: URLRequestProtocol, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        var body = Data()
        if let codableBody = request.codableBody {
            do {
                body = try codableBody.encode()
            } catch let error {
                switch error as! CodableError {
                case .EncodeError:
                    fatalError("Encode fail")
                default: break
                }
            }
        } else {
            guard let jsonBody = request.jsonBody else { fatalError("Coundn't encrypt with json body")}
            body = encodeBody(from: jsonBody)
        }
        return uploadTask(with: prepareUrlRequest(from: request), from: body, completionHandler: completionHandler)
    }
    
    private func prepareUrlRequest(from request: URLRequestProtocol) -> URLRequest {
        guard var urlComponents = URLComponents(url: request.url, resolvingAgainstBaseURL: true) else {
            fatalError("Couldn't create url components from url: \(request.url.absoluteString)")
        }
        var queryItems: [URLQueryItem] = []
        request.parameters?.forEach{ (key, value) in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            fatalError("Couldn't create url with these parameters")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        request.headers?.forEach{ (key, value) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        return urlRequest
    }
    
    private func encodeBody<T: Encodable>(from body: T) throws -> Data? {
        
        guard let body = try? JSONEncoder().encode(body) else {
            fatalError("Couldn't encode codable body")
        }
        
        return body
    }
    
    private func encodeBody(from body: JSON) -> Data {
        guard let body = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            fatalError("Couldn't encode json body")
        }
        
        return body
    }
}



enum CodableError: Error {
    case EncodeError
    case DecodeError
}
