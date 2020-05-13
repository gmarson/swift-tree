//
//  Classes.swift
//  Search-Tree
//
//  Created by Gabriel Marson on 13/05/20.
//  Copyright © 2020 Gabriel Marson. All rights reserved.
//

import Foundation
import UIKit

protocol CustomView {}

struct Node {
    
    private(set) var id: String = ""
    var parentId: String? = ""
    var value: CustomView
    var refToView: UIView
    
    init(
        value: CustomView,
        view: inout UIView,
        id: String,
        parentId: String? = nil
    ) {
        self.value = value
        self.refToView = view
        self.id = id
        self.parentId = parentId
    }
    
    mutating func setParentId(_ id: String) {
        parentId = id
    }
    
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
}
