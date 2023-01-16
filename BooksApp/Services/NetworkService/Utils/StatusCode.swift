//
//  StatusCode.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct StatusCode {
    let value: Int
}

extension StatusCode: Equatable {
    
}

extension Array where Element == StatusCode {
    
    static let successStatusCodes: [StatusCode] = (200..<300).map { StatusCode(value: $0) }
    
    var rawValues: [Int] {
        map { $0.value }
    }
    
}
