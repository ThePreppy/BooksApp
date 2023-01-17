//
//  Constants.swift
//  BooksApp
//
//  Created by Alexander on 16.01.2023.
//

enum Constants {
    
    enum Application {
        
        static let name: String = "BooksApp"
        
    }
    
    enum Books {
        
        enum ImageSize: String {
            case small = "S"
            case medium = "M"
            case large = "L"
        }
        
        enum Fields: String {
            case coverID = "cover_i"
            case title = "title"
        }
        
        static let scheme: String = "https://"
        static let baseURL: String = "openlibrary.org"
        static let coversBaseURL: String = "covers." + baseURL
        static let page: Int = 1
        static let limit: Int = 10
        static let jpg: String = ".jpg"
        
        static var fields: String {
            let result: [Fields] = [.coverID, .title]
            return result.map(\.rawValue).joined(separator: ",")
        }
        
        static func coverPath(id: Int, imageSize: ImageSize) -> String {
            Constants.Books.scheme + coversBaseURL + RequestPath.cover(id: id).rawValue + "-\(imageSize.rawValue)" + jpg
        }
        
    }
    
    enum SceneDelegate {
        
        static let name: String = "Default Configuration"
        
    }
    
    enum Coredata {
        
        static let container: String = "Books"
        
    }
    
}
