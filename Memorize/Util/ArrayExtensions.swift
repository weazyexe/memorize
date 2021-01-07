//
//  ArrayExtensions.swift
//  Memorize
//
//  Created by Timur Zadvornov on 07.01.2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for i in 0..<self.count {
            if self[i].id == matching.id {
                return i
            }
        }
        return nil
    }
}
