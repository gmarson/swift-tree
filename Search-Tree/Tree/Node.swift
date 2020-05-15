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

class Node {
    
    private(set) var id: String = ""
    private(set) var parentId: String? = ""
    private(set) var value: CustomView
    private(set) weak var refToView: UIView?
    
    var children: Array<Node> = []
    
    init(
        value: CustomView,
        view: inout UIView,
        id: String,
        parentId: String? = nil,
        children: Array<Node> = []
    ) {
        self.value = value
        self.refToView = view
        self.id = id
        self.parentId = parentId
        self.children = children
    }
    
    func addChild(_ node: inout Node) {
        node.parentId = id
        children.append(node)
    }
    
    func removeChild(at: Int) {
        children.remove(at: at)
    }
    
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
}
