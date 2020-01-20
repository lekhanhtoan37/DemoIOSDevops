//
//  Encodable+Extension.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/8/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import Foundation

extension Encodable {
    func encode() throws -> Data {
        guard let data = try? JSONEncoder().encode(self) else {
            throw CodableError.EncodeError
        }
        return data
    }
}
