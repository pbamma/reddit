//
//  APIManager.swift
//  reddit
//
//  Created by Philip Starner on 3/20/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//
// Reddit listings API
//The common parameters are as follows:
//after / before - only one should be specified. these indicate the fullname of an item in the listing to use as the anchor point of the slice.
//limit - the maximum number of items to return in this slice of the listing.
//count - the number of items already seen in this listing. on the html site, the builder uses this to determine when to give values for before and after in the response.
//show - optional parameter; if all is passed, filters such as "hide links that I have voted on" will be disabled.

import Alamofire
import SwiftyJSON

class APIManager {
    
    //Singleton class to speak to whenever and whereever we need
    static var sharedInstance = APIManager()
    
    /// get a reddit organic page
    /// GET https://www.reddit.com/r/organic.json
    /// :param: after - these indicate the fullname of an item in the listing to use as the anchor point of the slice.
    /// :param: limit - the maximum number of items to return in this slice of the listing.
    func getOrganic(after:String?, limit: Int, onCompletion: ((_ listings: [Children]?, _ error: Error?) -> Void)?) {
        var requestString = (Constants.Host + "?limit=\(limit)")
        if let after = after {
            requestString = (Constants.Host + "?after=\(after)" + "&limit=\(limit)")
        }
        
        Alamofire.request(requestString).responseJSON { (response) in
            if let data = response.data {
                do {
                    let json = try JSON.init(data: data)
                    
                    let root = Root(json: json)
                    if let listings = root.listingData?.children {
                        onCompletion!(listings, nil)
                    } else {
                        print("Error: No Listings found today")
                        onCompletion!(nil, nil)
                    }
                } catch {
                    print("Error: \(error.localizedDescription)")
                    onCompletion!(nil, error)
                }
            } else {
                print("Error: response data no good)")
                onCompletion!(nil, nil)
            }
        }
    }

    
}
