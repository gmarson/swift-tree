//
//  Tree.swift
//  Search-Tree
//
//  Created by Gabriel Marson on 13/05/20.
//  Copyright © 2020 Gabriel Marson. All rights reserved.
//

import Foundation

class Tree {
    
    var root: Node?
    
    init(root: Node) {
        self.root = root
    }
    
    func add(_ node: inout Node, to parentNode: Node) {
        parentNode.addChild(&node)
    }
    
    func addToRoot(_ node: inout Node) {
        root?.addChild(&node)
    }
    
    func remove(node: Node) {
        guard let root = root, let parentNode = Tree.find(rootNode: root, id: node.parentId) else {
            self.root = nil
            return
        }
        
        if let index = parentNode.children.firstIndex(where: {$0 == node}) {
            parentNode.removeChild(at: index)
        }
    }
    
    static func find(rootNode: Node, id: String?) -> Node? {
        guard let id = id else { return nil }
        if rootNode.id == id {
            return rootNode
        } else {
            for childNodes in rootNode.children {
                if let fetchedNode = find(rootNode: childNodes, id: id) {
                    return fetchedNode
                }
            }
        }
        
        return nil
    }
    
    static func elementsInTree(node: Node?) -> Int {
        guard let node = node else { return 0 }
        
        var sum = 1
        for child in node.children {
            if child.children.count > 0 {
                sum += elementsInTree(node: child)
            } else {
                sum += 1
            }
        }
        
        return sum
    }
    
    deinit {
        print("Tree was removed from memory")
    }
}
