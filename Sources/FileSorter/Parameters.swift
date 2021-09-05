import Foundation
import ArgumentParser

enum FakeBool: String, EnumerableFlag, ExpressibleByArgument {
  case yes
  case no
}

enum SortOrder: String, EnumerableFlag {
  case asc
  case desc
  case random
  
  static func help(for value: SortOrder) -> ArgumentHelp? {
    switch value {
    case .asc:
      return "Ascending order <"
    case .desc:
      return "Descending order >"
    case .random:
      return "Shuffle 🎲"
    }
  }
  
  static func name(for value: SortOrder) -> NameSpecification {
    switch value {
    case .asc:
      return .customLong("order-asc")
    case .desc:
      return .customLong("order-desc")
    case .random:
      return .customLong("order-random")
    }
  }
}

enum SortBy: String, EnumerableFlag {
  case creationDate
  case modificationDate
  
  var fileAttributeKey: FileAttributeKey {
    switch self {
    case .creationDate: return .creationDate
    case .modificationDate: return .modificationDate
    }
  }
  
  static func help(for value: SortBy) -> ArgumentHelp? {
    switch value {
    case .creationDate:
      return "File system creation date."
    case .modificationDate:
      return "File system modification date."
    }
  }
  
  static func name(for value: SortBy) -> NameSpecification {
    switch value {
    case .creationDate:
      return .customLong("by-creationDate")
    case .modificationDate:
      return .customLong("by-modificationDate")
    }
  }
}

enum Verbosity: String, EnumerableFlag, Codable {
  case none
  case minimal
  case all
  
  static func help(for value: Verbosity) -> ArgumentHelp? {
    switch value {
    case .none:
      return ArgumentHelp("Nothing to display.")
    case .minimal:
      return ArgumentHelp("Display log of levels notice, warning, error and critical.")
    case .all:
      return ArgumentHelp("Display all logs.")
    }
  }
  
  static func name(for value: Verbosity) -> NameSpecification {
    switch value {
    case .none:
      return .customLong("verbose-none")
    case .minimal:
      return .customLong("verbose-minimal")
    case .all:
      return .customLong("verbose-all")
    }
  }
}

