//
//  Search_TreeTests.swift
//  Search-TreeTests
//
//  Created by Gabriel Marson on 13/05/20.
//  Copyright © 2020 Gabriel Marson. All rights reserved.
//

import XCTest
@testable import Search_Tree

class Search_TreeTests: XCTestCase {

    var tree: Tree!
    private var rootNoodeId = "rootNodeId"
    
    override func setUp() {
        var scaffold: UIView = UIView()
        let rootNode = Node(value: Button(), view: &scaffold, id: rootNoodeId)
        tree = Tree(rootNode: rootNode)
    }

    func testTreeSize() {
        //given
        var textField: UIView = UITextField()
        var node = Node(value: TextField(), view: &textField, id: "d")
        var node2 = Node(value: TextField(), view: &textField, id: "c")
        
        //when
        tree.add(key: rootNoodeId, &node)
        tree.add(key: rootNoodeId, &node2)
        
        //then
        XCTAssert(tree.nodeCount == 3)
    }

    func testAddOneNode() {
        //given
        var textField: UIView = UITextField()
        var node = Node(value: TextField(), view: &textField, id: "d")
                
        //when
        tree.add(key: rootNoodeId, &node)

        //then
        XCTAssert(tree.nodeCount == 2)
        XCTAssert(tree.branchAt(rootNoodeId)?.count == 2)
        XCTAssert(tree.nodeAt(rootNoodeId, index: 1) == node)
    }

}
