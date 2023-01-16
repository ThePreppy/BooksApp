//
//  Logger.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

enum Logger {

    static func log(_ message: Any) {
        print(message)
    }
    
    static func info(
        _ message: Any,
        file: String = #file,
        line: Int = #line
    ) {
        let fileName = file.components(separatedBy: "/").last ?? ""
        print("🟦 [\(fileName)] line \(line) -", message)
    }
    
    static func error(
        _ message: Any,
        file: String = #file,
        line: Int = #line
    ) {
        let fileName = file.components(separatedBy: "/").last ?? ""
        print("🟥 [\(fileName)] line \(line) -", message)
    }
    
}
