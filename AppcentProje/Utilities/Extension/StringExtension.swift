//
//  StringExtension.swift
//  newsApp-Appcent
//
//  Created by BZ on 16.02.2023.
//

import Foundation

extension String {
    
    static func combineWithAndSymbol(strings: [String?]) -> String {
        return strings.compactMap { $0 }.joined(separator: "&")
    }

}
