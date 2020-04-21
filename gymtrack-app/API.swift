// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// An enumeration.
public enum CategoryColor: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// None
  case `none`
  /// Blue
  case blue
  /// Green
  case green
  /// Indigo
  case indigo
  /// Orange
  case orange
  /// Pink
  case pink
  /// Purple
  case purple
  /// Red
  case red
  /// Teal
  case teal
  /// Yellow
  case yellow
  /// Gray
  case gray
  /// Gray2
  case gray2
  /// Gray3
  case gray3
  /// Gray4
  case gray4
  /// Gray5
  case gray5
  /// Gray6
  case gray6
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NONE": self = .none
      case "BLUE": self = .blue
      case "GREEN": self = .green
      case "INDIGO": self = .indigo
      case "ORANGE": self = .orange
      case "PINK": self = .pink
      case "PURPLE": self = .purple
      case "RED": self = .red
      case "TEAL": self = .teal
      case "YELLOW": self = .yellow
      case "GRAY": self = .gray
      case "GRAY2": self = .gray2
      case "GRAY3": self = .gray3
      case "GRAY4": self = .gray4
      case "GRAY5": self = .gray5
      case "GRAY6": self = .gray6
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .none: return "NONE"
      case .blue: return "BLUE"
      case .green: return "GREEN"
      case .indigo: return "INDIGO"
      case .orange: return "ORANGE"
      case .pink: return "PINK"
      case .purple: return "PURPLE"
      case .red: return "RED"
      case .teal: return "TEAL"
      case .yellow: return "YELLOW"
      case .gray: return "GRAY"
      case .gray2: return "GRAY2"
      case .gray3: return "GRAY3"
      case .gray4: return "GRAY4"
      case .gray5: return "GRAY5"
      case .gray6: return "GRAY6"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CategoryColor, rhs: CategoryColor) -> Bool {
    switch (lhs, rhs) {
      case (.none, .none): return true
      case (.blue, .blue): return true
      case (.green, .green): return true
      case (.indigo, .indigo): return true
      case (.orange, .orange): return true
      case (.pink, .pink): return true
      case (.purple, .purple): return true
      case (.red, .red): return true
      case (.teal, .teal): return true
      case (.yellow, .yellow): return true
      case (.gray, .gray): return true
      case (.gray2, .gray2): return true
      case (.gray3, .gray3): return true
      case (.gray4, .gray4): return true
      case (.gray5, .gray5): return true
      case (.gray6, .gray6): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CategoryColor] {
    return [
      .none,
      .blue,
      .green,
      .indigo,
      .orange,
      .pink,
      .purple,
      .red,
      .teal,
      .yellow,
      .gray,
      .gray2,
      .gray3,
      .gray4,
      .gray5,
      .gray6,
    ]
  }
}

/// An enumeration.
public enum ExerciseUnit: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// None
  case `none`
  /// Weight
  case weight
  /// Time
  case time
  /// Step
  case step
  /// Distance
  case distance
  /// Check
  case check
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NONE": self = .none
      case "WEIGHT": self = .weight
      case "TIME": self = .time
      case "STEP": self = .step
      case "DISTANCE": self = .distance
      case "CHECK": self = .check
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .none: return "NONE"
      case .weight: return "WEIGHT"
      case .time: return "TIME"
      case .step: return "STEP"
      case .distance: return "DISTANCE"
      case .check: return "CHECK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ExerciseUnit, rhs: ExerciseUnit) -> Bool {
    switch (lhs, rhs) {
      case (.none, .none): return true
      case (.weight, .weight): return true
      case (.time, .time): return true
      case (.step, .step): return true
      case (.distance, .distance): return true
      case (.check, .check): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ExerciseUnit] {
    return [
      .none,
      .weight,
      .time,
      .step,
      .distance,
      .check,
    ]
  }
}

public final class ExerciseDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ExerciseDetail($id: ID!) {
      exercise(id: $id) {
        __typename
        ...ExerciseDetailFragment
      }
    }
    """

  public let operationName: String = "ExerciseDetail"

  public var queryDocument: String { return operationDefinition.appending(ExerciseDetailFragment.fragmentDefinition).appending(EffortDetailFragment.fragmentDefinition).appending(CategoryDetailFragment.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("exercise", arguments: ["id": GraphQLVariable("id")], type: .object(Exercise.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(exercise: Exercise? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "exercise": exercise.flatMap { (value: Exercise) -> ResultMap in value.resultMap }])
    }

    /// The ID of the object
    public var exercise: Exercise? {
      get {
        return (resultMap["exercise"] as? ResultMap).flatMap { Exercise(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "exercise")
      }
    }

    public struct Exercise: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ExerciseType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ExerciseDetailFragment.self),
      ]

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

        public var exerciseDetailFragment: ExerciseDetailFragment {
          get {
            return ExerciseDetailFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class ExerciseListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ExerciseList {
      exercises {
        __typename
        edges {
          __typename
          node {
            __typename
            ...ExerciseListItemFragment
          }
        }
      }
    }
    """

  public let operationName: String = "ExerciseList"

  public var queryDocument: String { return operationDefinition.appending(ExerciseListItemFragment.fragmentDefinition).appending(CategoryDetailFragment.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("exercises", type: .object(Exercise.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(exercises: Exercise? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "exercises": exercises.flatMap { (value: Exercise) -> ResultMap in value.resultMap }])
    }

    public var exercises: Exercise? {
      get {
        return (resultMap["exercises"] as? ResultMap).flatMap { Exercise(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "exercises")
      }
    }

    public struct Exercise: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ExerciseTypeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "ExerciseTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Contains the nodes in this connection.
      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ExerciseTypeEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "ExerciseTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ExerciseType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ExerciseListItemFragment.self),
          ]

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

            public var exerciseListItemFragment: ExerciseListItemFragment {
              get {
                return ExerciseListItemFragment(unsafeResultMap: resultMap)
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
}

public final class WorkoutDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutDetail($id: ID!) {
      workout(id: $id) {
        __typename
        ...WorkoutDetailFragment
      }
      lastWorkout {
        __typename
        ...WorkoutDetailFragment
      }
    }
    """

  public let operationName: String = "WorkoutDetail"

  public var queryDocument: String { return operationDefinition.appending(WorkoutDetailFragment.fragmentDefinition).appending(WorkoutExerciseFragment.fragmentDefinition).appending(ExerciseListItemFragment.fragmentDefinition).appending(CategoryDetailFragment.fragmentDefinition).appending(EffortDetailFragment.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("workout", arguments: ["id": GraphQLVariable("id")], type: .object(Workout.selections)),
      GraphQLField("lastWorkout", type: .object(LastWorkout.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workout: Workout? = nil, lastWorkout: LastWorkout? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "workout": workout.flatMap { (value: Workout) -> ResultMap in value.resultMap }, "lastWorkout": lastWorkout.flatMap { (value: LastWorkout) -> ResultMap in value.resultMap }])
    }

    /// The ID of the object
    public var workout: Workout? {
      get {
        return (resultMap["workout"] as? ResultMap).flatMap { Workout(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "workout")
      }
    }

    public var lastWorkout: LastWorkout? {
      get {
        return (resultMap["lastWorkout"] as? ResultMap).flatMap { LastWorkout(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "lastWorkout")
      }
    }

    public struct Workout: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(WorkoutDetailFragment.self),
      ]

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

        public var workoutDetailFragment: WorkoutDetailFragment {
          get {
            return WorkoutDetailFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct LastWorkout: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(WorkoutDetailFragment.self),
      ]

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

        public var workoutDetailFragment: WorkoutDetailFragment {
          get {
            return WorkoutDetailFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct CategoryDetailFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CategoryDetailFragment on CategoryType {
      __typename
      id
      name
      color
    }
    """

  public static let possibleTypes: [String] = ["CategoryType"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("color", type: .nonNull(.scalar(CategoryColor.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, color: CategoryColor) {
    self.init(unsafeResultMap: ["__typename": "CategoryType", "id": id, "name": name, "color": color])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var color: CategoryColor {
    get {
      return resultMap["color"]! as! CategoryColor
    }
    set {
      resultMap.updateValue(newValue, forKey: "color")
    }
  }
}

public struct EffortDetailFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment EffortDetailFragment on EffortType {
      __typename
      id
      createdAt
      value
      repeats
      failure
    }
    """

  public static let possibleTypes: [String] = ["EffortType"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
    GraphQLField("value", type: .nonNull(.scalar(Double.self))),
    GraphQLField("repeats", type: .nonNull(.scalar(Int.self))),
    GraphQLField("failure", type: .nonNull(.scalar(Bool.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, createdAt: String, value: Double, repeats: Int, failure: Bool) {
    self.init(unsafeResultMap: ["__typename": "EffortType", "id": id, "createdAt": createdAt, "value": value, "repeats": repeats, "failure": failure])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var value: Double {
    get {
      return resultMap["value"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "value")
    }
  }

  public var repeats: Int {
    get {
      return resultMap["repeats"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "repeats")
    }
  }

  public var failure: Bool {
    get {
      return resultMap["failure"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "failure")
    }
  }
}

public struct EffortListItemFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment EffortListItemFragment on EffortType {
      __typename
      id
      createdAt
      value
      repeats
      failure
    }
    """

  public static let possibleTypes: [String] = ["EffortType"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
    GraphQLField("value", type: .nonNull(.scalar(Double.self))),
    GraphQLField("repeats", type: .nonNull(.scalar(Int.self))),
    GraphQLField("failure", type: .nonNull(.scalar(Bool.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, createdAt: String, value: Double, repeats: Int, failure: Bool) {
    self.init(unsafeResultMap: ["__typename": "EffortType", "id": id, "createdAt": createdAt, "value": value, "repeats": repeats, "failure": failure])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var value: Double {
    get {
      return resultMap["value"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "value")
    }
  }

  public var repeats: Int {
    get {
      return resultMap["repeats"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "repeats")
    }
  }

  public var failure: Bool {
    get {
      return resultMap["failure"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "failure")
    }
  }
}

public struct ExerciseDetailFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ExerciseDetailFragment on ExerciseType {
      __typename
      id
      name
      unit
      efforts {
        __typename
        edges {
          __typename
          node {
            __typename
            ...EffortDetailFragment
          }
        }
      }
      categories {
        __typename
        edges {
          __typename
          node {
            __typename
            ...CategoryDetailFragment
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["ExerciseType"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("unit", type: .nonNull(.scalar(ExerciseUnit.self))),
    GraphQLField("efforts", type: .object(Effort.selections)),
    GraphQLField("categories", type: .nonNull(.object(Category.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, unit: ExerciseUnit, efforts: Effort? = nil, categories: Category) {
    self.init(unsafeResultMap: ["__typename": "ExerciseType", "id": id, "name": name, "unit": unit, "efforts": efforts.flatMap { (value: Effort) -> ResultMap in value.resultMap }, "categories": categories.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var unit: ExerciseUnit {
    get {
      return resultMap["unit"]! as! ExerciseUnit
    }
    set {
      resultMap.updateValue(newValue, forKey: "unit")
    }
  }

  public var efforts: Effort? {
    get {
      return (resultMap["efforts"] as? ResultMap).flatMap { Effort(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "efforts")
    }
  }

  public var categories: Category {
    get {
      return Category(unsafeResultMap: resultMap["categories"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "categories")
    }
  }

  public struct Effort: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["EffortTypeConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]) {
      self.init(unsafeResultMap: ["__typename": "EffortTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Contains the nodes in this connection.
    public var edges: [Edge?] {
      get {
        return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EffortTypeEdge"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", type: .object(Node.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(node: Node? = nil) {
        self.init(unsafeResultMap: ["__typename": "EffortTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge
      public var node: Node? {
        get {
          return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EffortType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EffortDetailFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String, value: Double, repeats: Int, failure: Bool) {
          self.init(unsafeResultMap: ["__typename": "EffortType", "id": id, "createdAt": createdAt, "value": value, "repeats": repeats, "failure": failure])
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

          public var effortDetailFragment: EffortDetailFragment {
            get {
              return EffortDetailFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public struct Category: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["CategoryTypeConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]) {
      self.init(unsafeResultMap: ["__typename": "CategoryTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Contains the nodes in this connection.
    public var edges: [Edge?] {
      get {
        return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CategoryTypeEdge"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", type: .object(Node.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(node: Node? = nil) {
        self.init(unsafeResultMap: ["__typename": "CategoryTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge
      public var node: Node? {
        get {
          return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CategoryType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CategoryDetailFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, color: CategoryColor) {
          self.init(unsafeResultMap: ["__typename": "CategoryType", "id": id, "name": name, "color": color])
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

          public var categoryDetailFragment: CategoryDetailFragment {
            get {
              return CategoryDetailFragment(unsafeResultMap: resultMap)
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

public struct ExerciseListItemFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ExerciseListItemFragment on ExerciseType {
      __typename
      id
      name
      unit
      categories {
        __typename
        edges {
          __typename
          node {
            __typename
            ...CategoryDetailFragment
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["ExerciseType"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("unit", type: .nonNull(.scalar(ExerciseUnit.self))),
    GraphQLField("categories", type: .nonNull(.object(Category.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, unit: ExerciseUnit, categories: Category) {
    self.init(unsafeResultMap: ["__typename": "ExerciseType", "id": id, "name": name, "unit": unit, "categories": categories.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var unit: ExerciseUnit {
    get {
      return resultMap["unit"]! as! ExerciseUnit
    }
    set {
      resultMap.updateValue(newValue, forKey: "unit")
    }
  }

  public var categories: Category {
    get {
      return Category(unsafeResultMap: resultMap["categories"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "categories")
    }
  }

  public struct Category: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["CategoryTypeConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]) {
      self.init(unsafeResultMap: ["__typename": "CategoryTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Contains the nodes in this connection.
    public var edges: [Edge?] {
      get {
        return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CategoryTypeEdge"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", type: .object(Node.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(node: Node? = nil) {
        self.init(unsafeResultMap: ["__typename": "CategoryTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge
      public var node: Node? {
        get {
          return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CategoryType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CategoryDetailFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, color: CategoryColor) {
          self.init(unsafeResultMap: ["__typename": "CategoryType", "id": id, "name": name, "color": color])
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

          public var categoryDetailFragment: CategoryDetailFragment {
            get {
              return CategoryDetailFragment(unsafeResultMap: resultMap)
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

public struct WorkoutDetailFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment WorkoutDetailFragment on WorkoutType {
      __typename
      id
      date
      workoutexercises {
        __typename
        edges {
          __typename
          node {
            __typename
            ...WorkoutExerciseFragment
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["WorkoutType"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("date", type: .nonNull(.scalar(String.self))),
    GraphQLField("workoutexercises", type: .nonNull(.object(Workoutexercise.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, date: String, workoutexercises: Workoutexercise) {
    self.init(unsafeResultMap: ["__typename": "WorkoutType", "id": id, "date": date, "workoutexercises": workoutexercises.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var date: String {
    get {
      return resultMap["date"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var workoutexercises: Workoutexercise {
    get {
      return Workoutexercise(unsafeResultMap: resultMap["workoutexercises"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "workoutexercises")
    }
  }

  public struct Workoutexercise: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["WorkoutExerciseTypeConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]) {
      self.init(unsafeResultMap: ["__typename": "WorkoutExerciseTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Contains the nodes in this connection.
    public var edges: [Edge?] {
      get {
        return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutExerciseTypeEdge"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", type: .object(Node.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(node: Node? = nil) {
        self.init(unsafeResultMap: ["__typename": "WorkoutExerciseTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge
      public var node: Node? {
        get {
          return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WorkoutExerciseType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkoutExerciseFragment.self),
        ]

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

          public var workoutExerciseFragment: WorkoutExerciseFragment {
            get {
              return WorkoutExerciseFragment(unsafeResultMap: resultMap)
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

public struct WorkoutExerciseFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment WorkoutExerciseFragment on WorkoutExerciseType {
      __typename
      id
      exercise {
        __typename
        ...ExerciseListItemFragment
      }
      efforts {
        __typename
        edges {
          __typename
          node {
            __typename
            ...EffortDetailFragment
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["WorkoutExerciseType"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("exercise", type: .nonNull(.object(Exercise.selections))),
    GraphQLField("efforts", type: .nonNull(.object(Effort.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, exercise: Exercise, efforts: Effort) {
    self.init(unsafeResultMap: ["__typename": "WorkoutExerciseType", "id": id, "exercise": exercise.resultMap, "efforts": efforts.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var exercise: Exercise {
    get {
      return Exercise(unsafeResultMap: resultMap["exercise"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "exercise")
    }
  }

  public var efforts: Effort {
    get {
      return Effort(unsafeResultMap: resultMap["efforts"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "efforts")
    }
  }

  public struct Exercise: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["ExerciseType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(ExerciseListItemFragment.self),
    ]

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

      public var exerciseListItemFragment: ExerciseListItemFragment {
        get {
          return ExerciseListItemFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Effort: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["EffortTypeConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]) {
      self.init(unsafeResultMap: ["__typename": "EffortTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Contains the nodes in this connection.
    public var edges: [Edge?] {
      get {
        return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EffortTypeEdge"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", type: .object(Node.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(node: Node? = nil) {
        self.init(unsafeResultMap: ["__typename": "EffortTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge
      public var node: Node? {
        get {
          return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EffortType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EffortDetailFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String, value: Double, repeats: Int, failure: Bool) {
          self.init(unsafeResultMap: ["__typename": "EffortType", "id": id, "createdAt": createdAt, "value": value, "repeats": repeats, "failure": failure])
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

          public var effortDetailFragment: EffortDetailFragment {
            get {
              return EffortDetailFragment(unsafeResultMap: resultMap)
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
