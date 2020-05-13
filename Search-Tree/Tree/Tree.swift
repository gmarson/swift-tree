//
//  Tree.swift
//  Search-Tree
//
//  Created by Gabriel Marson on 13/05/20.
//  Copyright © 2020 Gabriel Marson. All rights reserved.
//

import Foundation

struct Button: CustomView {
    
}

struct Label: CustomView {
    
}

struct TextField: CustomView {
    
}

class Tree {
    
    var t: [String: [Node]]
    private(set) var nodeCount = 0
    
    init(rootNode: Node) {
        t = [rootNode.id : [rootNode]]
        nodeCount += 1
    }
    
    func add(key: String, _ node: inout Node) {
        if t[key] == nil { t[key] = [] }
        
        t[key]?.append(node)
        node.setParentId(key)
        nodeCount += 1
    }
    
    func remove(node: Node) {
        guard let parentId = node.parentId, var branch = t[parentId] else {
            return
        }
        
        for i in 0 ..< branch.count {
            if node == branch[i] {
                branch.remove(at: i)
                nodeCount -= 1
                break
            }
        }
        
        if t[node.id] != nil {
            t[node.id] = nil
        }
        
    }
    
    func branchAt(_ id: String) -> [Node]? {
        return t[id]
    }
    
    func nodeAt(_ id: String, index: Int) -> Node? {
        guard let branch = t[id], branch.count > index else {
            return nil
        }
        
        return branch[index]
    }
    
    
    deinit {
        print("Tree was removed from memory")
    }
}
