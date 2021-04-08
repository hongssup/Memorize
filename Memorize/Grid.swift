//
//  Grid.swift
//  Memorize
//
//  Created by SeoYeon Hong on 2021/04/02.
//

import SwiftUI

// connecting generics with protocols : to constrain 'dont cares' to work
struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}

//force unwrapping 사용하지 않고 crash 없이 안전하게 하려면
//let index = items.firstIndex(matching: item)
//// Viewbuilder who does nothing. (layout에는 관여 x)
//// 이렇게 Group으로 return값을 전달하게 되면 index가 nil이더라도 empty view라도 전달해줌.
//return Group {
//    if index != nil {
//        viewForItem(item)
//            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
//            .position(layout.location(ofItemAt: index!))
//    }
//}

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
