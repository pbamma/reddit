//
//  Preview.swift
//
//  Created by Philip Starner on 3/20/18
//  Copyright (c) Philip Starner. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Preview {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let enabled = "enabled"
    static let images = "images"
  }

  // MARK: Properties
  public var enabled: Bool? = false
  public var images: [Images]?

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
    enabled = json[SerializationKeys.enabled].boolValue
    if let items = json[SerializationKeys.images].array { images = items.map { Images(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.enabled] = enabled
    if let value = images { dictionary[SerializationKeys.images] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
