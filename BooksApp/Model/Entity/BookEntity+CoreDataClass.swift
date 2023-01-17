//
//  BookEntity+CoreDataClass.swift
//  BooksApp
//
//  Created by Alexander on 17.01.2023.
//
//

import Foundation
import CoreData

@objc(BookEntity)
public class BookEntity: NSManagedObject {

    @discardableResult
    convenience init(
        id: String,
        title: String?,
        cover: URL?
    ) {
        self.init(context: DatabaseManager.shared.context)
        self.id = id
        self.title = title
        self.cover = cover
    }
    
}
