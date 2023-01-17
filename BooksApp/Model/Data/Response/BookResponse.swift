//
//  BookResponse.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

struct BookResponse: ResponseDomainable {
    typealias Model = BookModel
    
    let title: String?
    let coverID: Int?
    
    enum CodingKeys: String, CodingKey {
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
            title: title,
            cover: coverURL
        )
    }
    
}
