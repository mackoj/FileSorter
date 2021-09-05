import Foundation

struct FileInfo: CustomStringConvertible {
  let fileName: String
  let when: Date
  
  var description: String { fileName }
}
