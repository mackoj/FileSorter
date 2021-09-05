import Foundation
import Logging

struct CLILog: Codable {
  var logLevel = Logger.Level.info
  private let verbosity: Verbosity
  
  init(verbosity: Verbosity) {
    self.verbosity = verbosity
  }
  
  func log(level: Logger.Level, message: String) {
    
    switch verbosity {
    case .none: break
    case .minimal: if level >= .notice { print(message) }
    case .all: if level >= .trace { print(message) }
    }
  }
}
