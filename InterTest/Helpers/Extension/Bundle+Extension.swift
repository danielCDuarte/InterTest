//
//  Bundle+Extension.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//
import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
