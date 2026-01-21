//
//  Photo.swift
//  Gallery
//
//  Created by Michael Campbell on 1/19/26.
//

import Foundation
import SwiftData

typealias ID = UUID

@Model
class Photo: Identifiable {
    var id: ID
    var filePath: String
    var thumbnailPath: String?
    var data: Data?
    var desc: String?
    var createdDate: Date
    var updatedDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case filePath
        case thumbnailPath
        case data
        case desc
        case createdAt
        case updatedAt
    }
    
    init(id: ID = ID(), filePath: String = "", thumbnailPath: String? = nil ,data: Data? = nil, desc: String? = nil, createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = id
        self.filePath = filePath
        self.thumbnailPath = thumbnailPath
        self.data = data
        self.desc = desc
        self.createdDate = createdAt
        self.updatedDate = updatedAt
    }
    
    required init(from decoder: Decoder) throws {
        let keys = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try keys.decode(ID.self, forKey: .id)
        self.filePath = try keys.decode(String.self, forKey: .filePath)
        self.thumbnailPath = try keys.decode(String?.self, forKey: .thumbnailPath)
        self.data = try keys.decode(Data.self, forKey: .data)
        self.desc = try keys.decode(String.self, forKey: .desc)
        self.createdDate = try keys.decode(Date.self, forKey: .createdAt)
        self.updatedDate = try keys.decode(Date.self, forKey: .updatedAt)
    }
}

