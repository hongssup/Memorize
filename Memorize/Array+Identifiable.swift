//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by SeoYeon Hong on 2021/04/02.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? { //Int? 는 optional로 값을 찾을 수 없을 때는 nil을 return
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
