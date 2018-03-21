//
//  ListingData.swift
//
//  Created by Philip Starner on 3/20/18
//  Copyright (c) Philip Starner. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ListingData {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let children = "children"
    static let modhash = "modhash"
    static let dist = "dist"
    static let after = "after"
  }

  // MARK: Properties
  public var children: [Children]?
  public var modhash: String?
  public var dist: Int?
  public var after: String?

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
    if let items = json[SerializationKeys.children].array { children = items.map { Children(json: $0) } }
    modhash = json[SerializationKeys.modhash].string
    dist = json[SerializationKeys.dist].int
    after = json[SerializationKeys.after].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = children { dictionary[SerializationKeys.children] = value.map { $0.dictionaryRepresentation() } }
    if let value = modhash { dictionary[SerializationKeys.modhash] = value }
    if let value = dist { dictionary[SerializationKeys.dist] = value }
    if let value = after { dictionary[SerializationKeys.after] = value }
    return dictionary
  }

}
