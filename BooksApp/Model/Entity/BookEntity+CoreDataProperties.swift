//
//  BookEntity+CoreDataProperties.swift
//  BooksApp
//
//  Created by Alexander on 17.01.2023.
//
//

import Foundation
import CoreData


extension BookEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookEntity> {
        return NSFetchRequest<BookEntity>(entityName: "BookEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var cover: URL?
    @NSManaged public var title: String?

}

extension BookEntity : Identifiable {

}

extension BookEntity: Domainable {
    typealias Model = BookModel
    
    func mapToModel() -> BookModel {
        BookModel(
            id: id,
            title: title,
            cover: cover
        )
    }
    
}
