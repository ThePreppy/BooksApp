//
//  AppDelegate.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct RequestHeader {
    let key: String
    let value: String
}

extension RequestHeader {
    
    static let acceptJson = RequestHeader(key: "Accept", value: "application/json")
    static let contentTypeJson = RequestHeader(key: "Content-Type", value: "application/json")
    
}

extension Array where Element == RequestHeader {
    
    static let `default`: [RequestHeader] = [.acceptJson, .contentTypeJson]
    
}
