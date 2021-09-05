import Foundation

extension String : Error {}

extension Sequence {
  func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, order: @escaping (T, T) -> Bool) -> [Element] {
    return sorted { a, b in
      return order(a[keyPath: keyPath], b[keyPath: keyPath])
    }
  }
}
