//
//  SocialModels.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/12/24.
//

import Foundation

class PostModel: NSObject, Codable {
    var postID: String?
    var postTitle: String?
    var postMedia: [MediaModel]?
}

class MediaModel: NSObject, Codable {
    var mediaID: String?
    var mediaURL: String?
}
