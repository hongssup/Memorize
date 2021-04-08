//
//  Array+Only.swift
//  Memorize
//
//  Created by SeoYeon Hong on 2021/04/08.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
