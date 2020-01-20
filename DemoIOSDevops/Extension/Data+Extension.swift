//
//  Decoable+Extension.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/8/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import Foundation

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
