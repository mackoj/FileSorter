import Foundation

extension String : Error, LocalizedError {
  public var errorDescription: String? { self }
}

extension Sequence {
  func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, order: @escaping (T, T) -> Bool) -> [Element] {
    return sorted { a, b in
      return order(a[keyPath: keyPath], b[keyPath: keyPath])
    }
  }
}
