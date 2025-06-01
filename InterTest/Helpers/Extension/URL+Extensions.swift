//
//  URL+Extensions.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation

extension URL {
    static func getUrl(from string: String?) -> URL? {
        return URL(string: string ?? "")
    }
}
