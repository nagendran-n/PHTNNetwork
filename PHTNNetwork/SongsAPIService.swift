//
//  SongsAPIService.swift
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
public class SongsAPIService {
  /**
   Fetch Songs for a given search terms using the iTunes service.
   - parameters
     - keywords: Search term
   - Returns: An observable SearchResult object
   */
  public static func fetchSongs(keywords: String) -> Observable<SearchResult> {
    return Observable<SearchResult>.create { observer -> Disposable in
      // Setup the endpoint URL - by replacing the keywords and all whitespaces with '+'
      let url = Endpoints.Songs.fetch.url
        .replacingOccurrences(of: "<keywords>", with: keywords)
        .replacingOccurrences(of: " ", with: "+")

      // Setup the Alamofire request.
      let request = Alamofire
        // Execute the request.
        .request(url, method: .get)
        
        // Validate the response received by Alamofire.
        .validate()
        
        // Parse the response into an ObjectMapper friendly object.
        .responseObject(completionHandler: { (response: DataResponse<SearchResult>) in
          switch response.result {
          case .success(let searchResult):
            // Continue until all results are parsed.
            observer.onNext(searchResult)
            
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
