//
//  Root.swift
//
//  Created by Philip Starner on 3/20/18
//  Copyright (c) Philip Starner. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Root {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let kind = "kind"
    static let listingData = "data"
  }

  // MARK: Properties
  public var kind: String?
  public var listingData: ListingData?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    kind = json[SerializationKeys.kind].string
    listingData = ListingData(json: json[SerializationKeys.listingData])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = kind { dictionary[SerializationKeys.kind] = value }
    if let value = listingData { dictionary[SerializationKeys.listingData] = value.dictionaryRepresentation() }
    return dictionary
  }

}
