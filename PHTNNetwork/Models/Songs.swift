//
//  Songs.swift
//  PHTNMusic
//
//  Created by Nags on 4/21/17.
//  Copyright © 2017 Nagendran Nagarajan. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

//TODO: This project should be moved to Cocoapods.

// Song Model.
public struct Song {
  public var artworkUrl60: String = ""
  public var collectionPrice: Double = 0.0
  public var wrapperType: String = ""
  public var country: String = ""
  public var isStreamable: Bool = false
  public var releaseDate: String = ""
  public var artistId: Int = 0
  public var collectionViewUrl: String = ""
  public var kind: String = ""
  public var trackExplicitness: String = ""
  public var currency: String = ""
  public var artistName: String = ""
  public var artistViewUrl: String = ""
  public var artworkUrl30: String = ""
  public var trackViewUrl: String = ""
  public var discCount: Int = 0
  public var collectionCensoredName: String = ""
  public var collectionId: Int = 0
  public var trackCensoredName: String = ""
  public var previewUrl: String = ""
  public var trackTimeMillis: Int = 0
  public var trackName: String = ""
  public var trackPrice: Double = 0.0
  public var collectionName: String = ""
  public var artworkUrl100: String = ""
  public var trackCount: Int = 0
  public var trackId: Int = 0
  public var discNumber: Int = 0
  public var collectionExplicitness: String = ""
  public var trackNumber: Int = 0
  public var primaryGenreName: String = ""
}

// Song ObjectMapper visual model.
extension Song: Mappable {
  public init?(map: Map) {
  }
  
  public mutating func mapping(map: Map) {
    artworkUrl60                <- map["artworkUrl60"]
    collectionPrice             <- map["collectionPrice"]
    wrapperType                 <- map["wrapperType"]
    country                     <- map["country"]
    isStreamable                <- map["isStreamable"]
    releaseDate                 <- map["releaseDate"]
    artistId                    <- map["artistId"]
    collectionViewUrl           <- map["collectionViewUrl"]
    kind                        <- map["kind"]
    trackExplicitness           <- map["trackExplicitness"]
    currency                    <- map["currency"]
    artistName                  <- map["artistName"]
    artistViewUrl               <- map["artistViewUrl"]
    trackViewUrl                <- map["trackViewUrl"]
    discCount                   <- map["discCount"]
    collectionCensoredName      <- map["collectionCensoredName"]
    collectionId                <- map["collectionId"]
    trackCensoredName           <- map["trackCensoredName"]
    previewUrl                  <- map["previewUrl"]
    trackTimeMillis             <- map["trackTimeMillis"]
    trackName                   <- map["trackName"]
    trackPrice                  <- map["trackPrice"]
    collectionName              <- map["collectionName"]
    artworkUrl100               <- map["artworkUrl100"]
    trackCount                  <- map["trackCount"]
    trackId                     <- map["trackId"]
    discNumber                  <- map["discNumber"]
    collectionExplicitness      <- map["collectionExplicitness"]
    trackNumber                 <- map["trackNumber"]
    primaryGenreName            <- map["primaryGenreName"]
  }
}

public struct SearchResult {
  public var songCount: Int = 0
  public var songs: [Song] = []
}

// Lyric ObjectMapper visual model.
extension SearchResult: Mappable {
  public init?(map: Map) {
  }
  
  public mutating func mapping(map: Map) {
    songCount <- map["resultCount"]
    songs     <- map["results"]
  }
}
