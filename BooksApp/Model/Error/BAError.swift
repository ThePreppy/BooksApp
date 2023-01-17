//
//  BAError.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

enum BAError: LocalizedError {
    case somethingWentWrong
    
    var errorDescription: String? {
        switch self {
        case .somethingWentWrong:
            return R.string.localizable.commonSomethingWentWrong()
        }
    }
}
