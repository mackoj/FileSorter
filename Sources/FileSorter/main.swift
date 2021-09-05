import ArgumentParser
import Foundation
import Logging

struct Sorter: ParsableCommand {
  @Argument(help: "File that contain a list of file to order.")
  var inputFilePath: String

  @Option(name: .shortAndLong, help: "Output path where to wrote the sorted content.")
  var outputPath: String?

  @Option(name: .shortAndLong, help: "Write the sorted output into the inputFile.")
  var inPlace: Bool = true

  @Flag
  var outputSortOrder: SortOrder = .desc
    
  @Flag
  var outputSortBy: SortBy = .creationDate

  @Flag(help: "Toggle the filtering of symlinks.")
  var ignoreSymlink: Bool = false
  
  @Flag
  var verbose: Verbosity = .minimal

  var logger: CLILog? = nil
  
  mutating func run() {
    logger = CLILog(verbosity: verbose)
    do {
      try processInput()
    } catch {
      logger?.log(level: .error, message: error.localizedDescription)
    }
  }
  
  func processInput() throws {
    let fileManager = FileManager.default
    guard fileManager.fileExists(atPath: inputFilePath) else {
      throw("File do not exist at path(\(inputFilePath)")
    }
    let output = try runOnFiles(inputFilePath, fileManager)
    if inPlace {
      try output.write(toFile: inputFilePath, atomically: true, encoding: .utf8)
    } else if let out = outputPath, fileManager.fileExists(atPath: out) {
      try output.write(toFile: out, atomically: true, encoding: .utf8)
    } else {
      throw("Failed to write the file")
    }
  }
  
  func runOnFiles(
    _ inputFilePath: String,
    _ fileManager : FileManager = .default
  ) throws -> String {
    let data = try String(contentsOfFile: inputFilePath, encoding: .utf8)
    let lines = data.components(separatedBy: .newlines)

    let elements = try lines.reduce(into: [FileInfo](), { res, fileName in
      if let date = try getFileAttribute(fileName, fileManager) {
        res.append(FileInfo(fileName: fileName, when: date))
      }
    })
    
    switch outputSortOrder {
    case .asc:
      return elements
        .lazy
        .sorted(by: \.when, order: <)
        .map(\.description)
        .joined(separator: "\n")
      
    case .desc:
      return elements
        .lazy
        .sorted(by: \.when, order: >)
        .map(\.description)
        .joined(separator: "\n")

    case .random:
      return elements
        .lazy
        .shuffled()
        .map(\.description)
        .joined(separator: "\n")
    }
  }
  
  
  func getFileAttribute(
    _ filePath: String,
    _ fileManager : FileManager = .default
  ) throws -> Date? {
    if fileManager.fileExists(atPath: filePath) {
      let attributes = try fileManager.attributesOfItem(atPath: filePath)
      if ignoreSymlink {
        guard let type = attributes[FileAttributeKey.type] as? FileAttributeType else {
          throw("Failed to extract info for fileAttributeKey type")
        }
        if type == .typeSymbolicLink { return nil }
      }
      guard let date = attributes[outputSortBy.fileAttributeKey] as? Date else {
        throw("Failed to extract info for fileAttributeKey \(outputSortBy.fileAttributeKey)")
      }
      return date
    }
    
    logger?.log(level: .notice, message: "This file \(filePath) no longer exist.")
    return nil
  }
}

Sorter.main()
