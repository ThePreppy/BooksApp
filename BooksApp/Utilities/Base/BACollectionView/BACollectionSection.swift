//
//  BACollectionSection.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

import Foundation

class BACollectionSection {
    var items: [BACollectionItem]
    var header: BACollectionHeaderFooterItem? = nil
    var footer: BACollectionHeaderFooterItem? = nil
    
    var numberOfItems: Int {
        items.count
    }
    
    func getItem(at indexPath: IndexPath) -> BACollectionItem? {
        items[safe: indexPath.row]
    }
    
    init(items: [BACollectionItem], header: BACollectionHeaderFooterItem? = nil, footer: BACollectionHeaderFooterItem? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
}
