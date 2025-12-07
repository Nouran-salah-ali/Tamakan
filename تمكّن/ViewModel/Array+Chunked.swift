//
//  Array+Chunked.swift
//  voiceTamakan
//
//  Created by You
//

import Foundation

extension Collection {
    /// Splits the collection into consecutive subarrays of at most `size` elements.
    /// The last chunk may contain fewer than `size` elements.
    func chunked(into size: Int) -> [[Element]] {
        precondition(size > 0, "size must be greater than 0")
        var result: [[Element]] = []
        result.reserveCapacity((self.count + size - 1) / size)

        var idx = startIndex
        while idx != endIndex {
            let next = index(idx, offsetBy: size, limitedBy: endIndex) ?? endIndex
            result.append(Array(self[idx..<next]))
            idx = next
        }
        return result
    }
}
