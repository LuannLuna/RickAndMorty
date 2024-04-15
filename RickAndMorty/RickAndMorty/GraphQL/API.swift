// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct FilterCharacter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - status
  ///   - species
  ///   - type
  ///   - gender
  public init(name: Swift.Optional<String?> = nil, status: Swift.Optional<String?> = nil, species: Swift.Optional<String?> = nil, type: Swift.Optional<String?> = nil, gender: Swift.Optional<String?> = nil) {
    graphQLMap = ["name": name, "status": status, "species": species, "type": type, "gender": gender]
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var status: Swift.Optional<String?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var species: Swift.Optional<String?> {
    get {
      return graphQLMap["species"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "species")
    }
  }

  public var type: Swift.Optional<String?> {
    get {
      return graphQLMap["type"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var gender: Swift.Optional<String?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }
}

public final class FetchAllCharactersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchAllCharacters($page: Int!) {
      characters(page: $page) {
        __typename
        info {
          __typename
          ...PageInfo
        }
        results {
          __typename
          ...CharacterInfo
        }
      }
    }
    """

  public let operationName: String = "FetchAllCharacters"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + PageInfo.fragmentDefinition)
    document.append("\n" + CharacterInfo.fragmentDefinition)
    return document
  }

  public var page: Int

  public init(page: Int) {
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("characters", arguments: ["page": GraphQLVariable("page")], type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(characters: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all characters
    public var characters: Character? {
      get {
        return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "characters")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Characters"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .object(Info.selections)),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(info: Info? = nil, results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Characters", "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }, "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Info"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(PageInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(next: Int? = nil, pages: Int? = nil, count: Int? = nil, prev: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Info", "next": next, "pages": pages, "count": count, "prev": prev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pageInfo: PageInfo {
            get {
              return PageInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(CharacterInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var characterInfo: CharacterInfo {
            get {
              return CharacterInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class FetchCharacterQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchCharacter($id: ID!) {
      character(id: $id) {
        __typename
        ...CharacterInfo
        episode {
          __typename
          episode
        }
      }
    }
    """

  public let operationName: String = "FetchCharacter"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CharacterInfo.fragmentDefinition)
    return document
  }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("character", arguments: ["id": GraphQLVariable("id")], type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(character: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "character": character.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get a specific character by ID
    public var character: Character? {
      get {
        return (resultMap["character"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "character")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Character"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CharacterInfo.self),
          GraphQLField("episode", type: .nonNull(.list(.object(Episode.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Episodes in which this character appeared.
      public var episode: [Episode?] {
        get {
          return (resultMap["episode"] as! [ResultMap?]).map { (value: ResultMap?) -> Episode? in value.flatMap { (value: ResultMap) -> Episode in Episode(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Episode?) -> ResultMap? in value.flatMap { (value: Episode) -> ResultMap in value.resultMap } }, forKey: "episode")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var characterInfo: CharacterInfo {
          get {
            return CharacterInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Episode: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Episode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("episode", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(episode: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Episode", "episode": episode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The code of the episode.
        public var episode: String? {
          get {
            return resultMap["episode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "episode")
          }
        }
      }
    }
  }
}

public final class FindCharacterQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FindCharacter($filter: FilterCharacter!) {
      characters(filter: $filter) {
        __typename
        info {
          __typename
          ...PageInfo
        }
        results {
          __typename
          ...CharacterInfo
        }
      }
    }
    """

  public let operationName: String = "FindCharacter"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + PageInfo.fragmentDefinition)
    document.append("\n" + CharacterInfo.fragmentDefinition)
    return document
  }

  public var filter: FilterCharacter

  public init(filter: FilterCharacter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("characters", arguments: ["filter": GraphQLVariable("filter")], type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(characters: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all characters
    public var characters: Character? {
      get {
        return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "characters")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Characters"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .object(Info.selections)),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(info: Info? = nil, results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Characters", "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }, "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Info"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(PageInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(next: Int? = nil, pages: Int? = nil, count: Int? = nil, prev: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Info", "next": next, "pages": pages, "count": count, "prev": prev])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pageInfo: PageInfo {
            get {
              return PageInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(CharacterInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var characterInfo: CharacterInfo {
            get {
              return CharacterInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct PageInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment PageInfo on Info {
      __typename
      next
      pages
      count
      prev
    }
    """

  public static let possibleTypes: [String] = ["Info"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("next", type: .scalar(Int.self)),
      GraphQLField("pages", type: .scalar(Int.self)),
      GraphQLField("count", type: .scalar(Int.self)),
      GraphQLField("prev", type: .scalar(Int.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(next: Int? = nil, pages: Int? = nil, count: Int? = nil, prev: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "Info", "next": next, "pages": pages, "count": count, "prev": prev])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Number of the next page (if it exists)
  public var next: Int? {
    get {
      return resultMap["next"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "next")
    }
  }

  /// The amount of pages.
  public var pages: Int? {
    get {
      return resultMap["pages"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "pages")
    }
  }

  /// The length of the response.
  public var count: Int? {
    get {
      return resultMap["count"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "count")
    }
  }

  /// Number of the previous page (if it exists)
  public var prev: Int? {
    get {
      return resultMap["prev"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "prev")
    }
  }
}

public struct CharacterInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CharacterInfo on Character {
      __typename
      id
      name
      status
      type
      gender
      origin {
        __typename
        name
        dimension
      }
      location {
        __typename
        name
      }
      image
    }
    """

  public static let possibleTypes: [String] = ["Character"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .scalar(GraphQLID.self)),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("status", type: .scalar(String.self)),
      GraphQLField("type", type: .scalar(String.self)),
      GraphQLField("gender", type: .scalar(String.self)),
      GraphQLField("origin", type: .object(Origin.selections)),
      GraphQLField("location", type: .object(Location.selections)),
      GraphQLField("image", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, type: String? = nil, gender: String? = nil, origin: Origin? = nil, location: Location? = nil, image: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "type": type, "gender": gender, "origin": origin.flatMap { (value: Origin) -> ResultMap in value.resultMap }, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }, "image": image])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The id of the character.
  public var id: GraphQLID? {
    get {
      return resultMap["id"] as? GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The name of the character.
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The status of the character ('Alive', 'Dead' or 'unknown').
  public var status: String? {
    get {
      return resultMap["status"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  /// The type or subspecies of the character.
  public var type: String? {
    get {
      return resultMap["type"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
  public var gender: String? {
    get {
      return resultMap["gender"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "gender")
    }
  }

  /// The character's origin location
  public var origin: Origin? {
    get {
      return (resultMap["origin"] as? ResultMap).flatMap { Origin(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "origin")
    }
  }

  /// The character's last known location
  public var location: Location? {
    get {
      return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "location")
    }
  }

  /// Link to the character's image.
  /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
  public var image: String? {
    get {
      return resultMap["image"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "image")
    }
  }

  public struct Origin: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Location"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("dimension", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String? = nil, dimension: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Location", "name": name, "dimension": dimension])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the location.
    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// The dimension in which the location is located.
    public var dimension: String? {
      get {
        return resultMap["dimension"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "dimension")
      }
    }
  }

  public struct Location: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Location"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Location", "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the location.
    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }
}
