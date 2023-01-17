//
//  BookResponse.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct BookResponse: ResponseDomainable {
    typealias Model = BookModel
    
    let key: String
    let title: String?
    let coverID: Int?
    
    enum CodingKeys: String, CodingKey {
        case key
        case title
        case coverID = "cover_i"
    }
    
    func mapToModel() -> BookModel {
        var coverURL: URL? {
            guard let id = coverID else {
                return nil
            }
            
            return URL(string: Constants.Books.coverPath(
                id: id,
                imageSize: .medium
            ))
        }
        
        return BookModel(
            id: key,
            title: title,
            cover: coverURL
        )
    }
    
}
