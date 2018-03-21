//
//  Data.swift
//
//  Created by Philip Starner on 3/20/18
//  Copyright (c) Philip Starner. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Data {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let hidden = "hidden"
    static let permalink = "permalink"
    static let numComments = "num_comments"
    static let hideScore = "hide_score"
    static let canModPost = "can_mod_post"
    static let thumbnailHeight = "thumbnail_height"
    static let edited = "edited"
    static let id = "id"
    static let sendReplies = "send_replies"
    static let preview = "preview"
    static let archived = "archived"
    static let selftext = "selftext"
    static let postHint = "post_hint"
    static let url = "url"
    static let subreddit = "subreddit"
    static let subredditType = "subreddit_type"
    static let pinned = "pinned"
    static let clicked = "clicked"
    static let subredditSubscribers = "subreddit_subscribers"
    static let isRedditMediaDomain = "is_reddit_media_domain"
    static let subredditNamePrefixed = "subreddit_name_prefixed"
    static let downs = "downs"
    static let createdUtc = "created_utc"
    static let thumbnailWidth = "thumbnail_width"
    static let secureMediaEmbed = "secure_media_embed"
    static let domain = "domain"
    static let mediaEmbed = "media_embed"
    static let isSelf = "is_self"
    static let quarantine = "quarantine"
    static let thumbnail = "thumbnail"
    static let locked = "locked"
    static let userReports = "user_reports"
    static let author = "author"
    static let gilded = "gilded"
    static let visited = "visited"
    static let isVideo = "is_video"
    static let modReports = "mod_reports"
    static let spoiler = "spoiler"
    static let stickied = "stickied"
    static let ups = "ups"
    static let isCrosspostable = "is_crosspostable"
    static let title = "title"
    static let saved = "saved"
    static let name = "name"
    static let score = "score"
    static let numCrossposts = "num_crossposts"
    static let contestMode = "contest_mode"
    static let noFollow = "no_follow"
    static let canGild = "can_gild"
    static let created = "created"
    static let over18 = "over_18"
    static let selftextHtml = "selftext_html"
    static let subredditId = "subreddit_id"
    static let brandSafe = "brand_safe"
  }

  // MARK: Properties
  public var hidden: Bool? = false
  public var permalink: String?
  public var numComments: Int?
  public var hideScore: Bool? = false
  public var canModPost: Bool? = false
  public var thumbnailHeight: Int?
  public var edited: Bool? = false
  public var id: String?
  public var sendReplies: Bool? = false
  public var preview: Preview?
  public var archived: Bool? = false
  public var selftext: String?
  public var postHint: String?
  public var url: String?
  public var subreddit: String?
  public var subredditType: String?
  public var pinned: Bool? = false
  public var clicked: Bool? = false
  public var subredditSubscribers: Int?
  public var isRedditMediaDomain: Bool? = false
  public var subredditNamePrefixed: String?
  public var downs: Int?
  public var createdUtc: Int?
  public var thumbnailWidth: Int?
  public var secureMediaEmbed: SecureMediaEmbed?
  public var domain: String?
  public var mediaEmbed: MediaEmbed?
  public var isSelf: Bool? = false
  public var quarantine: Bool? = false
  public var thumbnail: String?
  public var locked: Bool? = false
  public var userReports: [Any]?
  public var author: String?
  public var gilded: Int?
  public var visited: Bool? = false
  public var isVideo: Bool? = false
  public var modReports: [Any]?
  public var spoiler: Bool? = false
  public var stickied: Bool? = false
  public var ups: Int?
  public var isCrosspostable: Bool? = false
  public var title: String?
  public var saved: Bool? = false
  public var name: String?
  public var score: Int?
  public var numCrossposts: Int?
  public var contestMode: Bool? = false
  public var noFollow: Bool? = false
  public var canGild: Bool? = false
  public var created: Int?
  public var over18: Bool? = false
  public var selftextHtml: String?
  public var subredditId: String?
  public var brandSafe: Bool? = false

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
    hidden = json[SerializationKeys.hidden].boolValue
    permalink = json[SerializationKeys.permalink].string
    numComments = json[SerializationKeys.numComments].int
    hideScore = json[SerializationKeys.hideScore].boolValue
    canModPost = json[SerializationKeys.canModPost].boolValue
    thumbnailHeight = json[SerializationKeys.thumbnailHeight].int
    edited = json[SerializationKeys.edited].boolValue
    id = json[SerializationKeys.id].string
    sendReplies = json[SerializationKeys.sendReplies].boolValue
    preview = Preview(json: json[SerializationKeys.preview])
    archived = json[SerializationKeys.archived].boolValue
    selftext = json[SerializationKeys.selftext].string
    postHint = json[SerializationKeys.postHint].string
    url = json[SerializationKeys.url].string
    subreddit = json[SerializationKeys.subreddit].string
    subredditType = json[SerializationKeys.subredditType].string
    pinned = json[SerializationKeys.pinned].boolValue
    clicked = json[SerializationKeys.clicked].boolValue
    subredditSubscribers = json[SerializationKeys.subredditSubscribers].int
    isRedditMediaDomain = json[SerializationKeys.isRedditMediaDomain].boolValue
    subredditNamePrefixed = json[SerializationKeys.subredditNamePrefixed].string
    downs = json[SerializationKeys.downs].int
    createdUtc = json[SerializationKeys.createdUtc].int
    thumbnailWidth = json[SerializationKeys.thumbnailWidth].int
    secureMediaEmbed = SecureMediaEmbed(json: json[SerializationKeys.secureMediaEmbed])
    domain = json[SerializationKeys.domain].string
    mediaEmbed = MediaEmbed(json: json[SerializationKeys.mediaEmbed])
    isSelf = json[SerializationKeys.isSelf].boolValue
    quarantine = json[SerializationKeys.quarantine].boolValue
    thumbnail = json[SerializationKeys.thumbnail].string
    locked = json[SerializationKeys.locked].boolValue
    if let items = json[SerializationKeys.userReports].array { userReports = items.map { $0.object} }
    author = json[SerializationKeys.author].string
    gilded = json[SerializationKeys.gilded].int
    visited = json[SerializationKeys.visited].boolValue
    isVideo = json[SerializationKeys.isVideo].boolValue
    if let items = json[SerializationKeys.modReports].array { modReports = items.map { $0.object} }
    spoiler = json[SerializationKeys.spoiler].boolValue
    stickied = json[SerializationKeys.stickied].boolValue
    ups = json[SerializationKeys.ups].int
    isCrosspostable = json[SerializationKeys.isCrosspostable].boolValue
    title = json[SerializationKeys.title].string
    saved = json[SerializationKeys.saved].boolValue
    name = json[SerializationKeys.name].string
    score = json[SerializationKeys.score].int
    numCrossposts = json[SerializationKeys.numCrossposts].int
    contestMode = json[SerializationKeys.contestMode].boolValue
    noFollow = json[SerializationKeys.noFollow].boolValue
    canGild = json[SerializationKeys.canGild].boolValue
    created = json[SerializationKeys.created].int
    over18 = json[SerializationKeys.over18].boolValue
    selftextHtml = json[SerializationKeys.selftextHtml].string
    subredditId = json[SerializationKeys.subredditId].string
    brandSafe = json[SerializationKeys.brandSafe].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.hidden] = hidden
    if let value = permalink { dictionary[SerializationKeys.permalink] = value }
    if let value = numComments { dictionary[SerializationKeys.numComments] = value }
    dictionary[SerializationKeys.hideScore] = hideScore
    dictionary[SerializationKeys.canModPost] = canModPost
    if let value = thumbnailHeight { dictionary[SerializationKeys.thumbnailHeight] = value }
    dictionary[SerializationKeys.edited] = edited
    if let value = id { dictionary[SerializationKeys.id] = value }
    dictionary[SerializationKeys.sendReplies] = sendReplies
    if let value = preview { dictionary[SerializationKeys.preview] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.archived] = archived
    if let value = selftext { dictionary[SerializationKeys.selftext] = value }
    if let value = postHint { dictionary[SerializationKeys.postHint] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = subreddit { dictionary[SerializationKeys.subreddit] = value }
    if let value = subredditType { dictionary[SerializationKeys.subredditType] = value }
    dictionary[SerializationKeys.pinned] = pinned
    dictionary[SerializationKeys.clicked] = clicked
    if let value = subredditSubscribers { dictionary[SerializationKeys.subredditSubscribers] = value }
    dictionary[SerializationKeys.isRedditMediaDomain] = isRedditMediaDomain
    if let value = subredditNamePrefixed { dictionary[SerializationKeys.subredditNamePrefixed] = value }
    if let value = downs { dictionary[SerializationKeys.downs] = value }
    if let value = createdUtc { dictionary[SerializationKeys.createdUtc] = value }
    if let value = thumbnailWidth { dictionary[SerializationKeys.thumbnailWidth] = value }
    if let value = secureMediaEmbed { dictionary[SerializationKeys.secureMediaEmbed] = value.dictionaryRepresentation() }
    if let value = domain { dictionary[SerializationKeys.domain] = value }
    if let value = mediaEmbed { dictionary[SerializationKeys.mediaEmbed] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.isSelf] = isSelf
    dictionary[SerializationKeys.quarantine] = quarantine
    if let value = thumbnail { dictionary[SerializationKeys.thumbnail] = value }
    dictionary[SerializationKeys.locked] = locked
    if let value = userReports { dictionary[SerializationKeys.userReports] = value }
    if let value = author { dictionary[SerializationKeys.author] = value }
    if let value = gilded { dictionary[SerializationKeys.gilded] = value }
    dictionary[SerializationKeys.visited] = visited
    dictionary[SerializationKeys.isVideo] = isVideo
    if let value = modReports { dictionary[SerializationKeys.modReports] = value }
    dictionary[SerializationKeys.spoiler] = spoiler
    dictionary[SerializationKeys.stickied] = stickied
    if let value = ups { dictionary[SerializationKeys.ups] = value }
    dictionary[SerializationKeys.isCrosspostable] = isCrosspostable
    if let value = title { dictionary[SerializationKeys.title] = value }
    dictionary[SerializationKeys.saved] = saved
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = score { dictionary[SerializationKeys.score] = value }
    if let value = numCrossposts { dictionary[SerializationKeys.numCrossposts] = value }
    dictionary[SerializationKeys.contestMode] = contestMode
    dictionary[SerializationKeys.noFollow] = noFollow
    dictionary[SerializationKeys.canGild] = canGild
    if let value = created { dictionary[SerializationKeys.created] = value }
    dictionary[SerializationKeys.over18] = over18
    if let value = selftextHtml { dictionary[SerializationKeys.selftextHtml] = value }
    if let value = subredditId { dictionary[SerializationKeys.subredditId] = value }
    dictionary[SerializationKeys.brandSafe] = brandSafe
    return dictionary
  }

}
