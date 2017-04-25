//
//  LyricsAPIService.swift
//  PHTNMusic
//
//  Created by Nags on 4/21/17.
//  Copyright © 2017 Nagendran Nagarajan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

//TODO: This project should be moved to Cocoapods.

/**
 This class contains the service layer implementation for the Lyrics API.
 */
public class LyricsAPIService {
  /**
   Fetch Lyrics for a given song name and artist name using the Wikia service.
   - parameters
     - song: Song title
     - artist: Artist name
   - Returns: An observable Lyric object
   */
  public static func fetchLyrics(for song: String, by artist: String) -> Observable<Lyric> {
    return Observable<Lyric>.create { observer -> Disposable in
      // Setup the endpoint URL - by replacing the keywords and all whitespaces with '+'
      var url = Endpoints.Lyrics.fetch.url
      url = url
        .replacingOccurrences(of: "<song>", with: song.replacingOccurrences(of: " ", with: "+"))
        .replacingOccurrences(of: "<artist>", with: artist.replacingOccurrences(of: " ", with: "+"))
      
      // Setup the Alamofire request.
      let request = Alamofire
        // Execute the request.
        .request(url, method: .get)
        
        // Validate the response received by Alamofire.
        .validate()
        
        // Parse the response into a string. This is needed since the Wikia service returns a malformed JSON.
        .responseString(completionHandler: { (response) in
          var lyrics = response.result.value
          
          switch response.result {
          case .success(_):
            // Parse the contents of the lyrics response string.
            lyrics = lyrics?
              .replacingOccurrences(of: "song = ", with: "")
              .replacingOccurrences(of: "\'", with: "\"")

            // Create an ObjectMapper mapped object from the response string.
            let lyricObject = Lyric(JSONString: lyrics!)
            
            // Continue until all results are parsed.
            observer.onNext(lyricObject!)
            
            // Set the observer to indicate process completion.
            observer.onCompleted()
            
          case .failure(let error):
            // Let the observer know about an error.
            observer.onError(error)
          }

        })
      
      return Disposables.create(with: {
        // Finish processing the request.
        request.cancel()
      })
    }
  }
}
