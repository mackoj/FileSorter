import Foundation
import ArgumentParser

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
      return "Suffle 🎲"
    }
  }
}

enum SortBy: String, EnumerableFlag {
  case creationDate
  case modificationDate
  case nameRelative
  case nameAbsolute
  case natural

  var fileAttributeKey: FileAttributeKey {
    switch self {
    case .creationDate: return .creationDate
    case .modificationDate: return .modificationDate
    default: fatalError("This should not happen.")
    }
  }
  
  static func help(for value: SortBy) -> ArgumentHelp? {
    switch value {
    case .creationDate:
      return "File system creation date."
    case .modificationDate:
      return "File system modification date."
    case .nameRelative:
      return "Name relative to parent folder."
    case .nameAbsolute:
      return "Name relative to every other files."
    case .natural:
      return "Natural sort"
    }
  }
}

enum Verbosity: String, EnumerableFlag, Codable {
  case none
  case minimal
  case everything
  
  static func help(for value: Verbosity) -> ArgumentHelp? {
    switch value {
    case .none:
      return ArgumentHelp("Nothing to display.")
    case .minimal:
      return ArgumentHelp("Display log of levels notice, warning, error and critical.")
    case .everything:
      return ArgumentHelp("Display logs.")
    }
  }
}

