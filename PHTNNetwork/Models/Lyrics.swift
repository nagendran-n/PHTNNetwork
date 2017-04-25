//
//  Lyrics.swift
//  PHTNMusic
//
//  Created by Nags on 4/21/17.
//  Copyright © 2017 Nagendran Nagarajan. All rights reserved.
//

import Foundation
import ObjectMapper

//TODO: This project should be moved to Cocoapods.

public struct Lyric {
  public var artist: String = ""
  public var song: String = ""
  public var lyrics: String = ""
  public var url: String = ""
}

extension Lyric: Mappable {
  public init?(map: Map) {
  }
  
  mutating public func mapping(map: Map) {
    artist  <- map["artist"]
    song    <- map["song"]
    lyrics  <- map["lyrics"]
    url     <- map["url"]
  }
}
