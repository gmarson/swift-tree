//
//  Search_TreeTests.swift
//  Search-TreeTests
//
//  Created by Gabriel Marson on 13/05/20.
//  Copyright © 2020 Gabriel Marson. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Search_Tree

class Search_TreeTests: XCTestCase {

    var tree: Tree!
    private var rootNoodeId = "rootNodeId"
    var textField: UIView = UITextField()
    lazy var node = Node(value: TextField(), view: &textField, id: "b")
    lazy var node2 = Node(value: TextField(), view: &textField, id: "c")
    lazy var node3 = Node(value: TextField(), view: &textField, id: "d")
    lazy var node4 = Node(value: TextField(), view: &textField, id: "e")
    lazy var node5 = Node(value: TextField(), view: &textField, id: "f")
    lazy var node6 = Node(value: TextField(), view: &textField, id: "g")
    
    override func setUp() {
        var scaffold: UIView = UIView()
        let rootNode = Node(value: View(), view: &scaffold, id: rootNoodeId)
        tree = Tree(root: rootNode)

    }

    func testQtdOfNodes() {
        //given
        build7NodeTreeSample()
        
        //then
        XCTAssert(Tree.elementsInTree(node: tree.root) == 7)
    }

    func testAdditionOfANode() {
        //given
        var textField: UIView = UITextField()
        var node = Node(value: TextField(), view: &textField, id: "b")
                
        //when
        tree.addToRoot(&node)

        //then
        XCTAssert(Tree.elementsInTree(node: tree.root) == 2)
        XCTAssert(tree.root?.children.count == 1)
        XCTAssert(tree.root?.children[0] == node)
    }
    
    func testAdditionOfNestedNodes() {
        //given
        var textField: UIView = UITextField()
        var view: UIView = UIView()
        let parentNodeId = "ParentNodeId"
        var parentNode = Node(value: View(), view: &view, id: parentNodeId)
        var node = Node(value: TextField(), view: &textField, id: "c")
                
        //when
        tree.addToRoot(&parentNode)
        tree.add(&node, to: parentNode)
        
        //then
        XCTAssert(Tree.elementsInTree(node: tree.root) == 3)
        XCTAssert(tree.root?.children.count == 1)
        XCTAssert(parentNode.children.count == 1)
        XCTAssert(parentNode.children[0] == node)
    }
    
    func testRemovalOfNestedNodes() {
        //given
        build7NodeTreeSample()
        
        //when
        tree.remove(node: node3)
        
        //then
        XCTAssert(Tree.elementsInTree(node: tree.root) == 3)
        assertSnapshot(matching: tree, as: .dump)
    }
    
    func testRemovalOfNestedNodes2() {
        //given
        build7NodeTreeSample()
        
        //when
        tree.remove(node: node5)
        
        //then
        XCTAssert(Tree.elementsInTree(node: tree.root) == 6)
        assertSnapshot(matching: tree, as: .dump)
    }
    
    func testRemovalOfNestedNodes3() {
        //given
        build7NodeTreeSample()
        
        //when
        tree.remove(node: tree.root!)
        
        //then
        XCTAssert(Tree.elementsInTree(node: tree.root) == 0)
        assertSnapshot(matching: tree, as: .dump)
    }
    
    func testGetOnTree() {
        //given
        build7NodeTreeSample()
        
        //when
        let localNode5 = Tree.find(rootNode: tree.root!, id: node5.id)
        
        //then
        XCTAssert(localNode5 == node5)
        XCTAssert(localNode5 === node5)
    }
    
    func build7NodeTreeSample() {
        tree.addToRoot(&node3)
        tree.add(&node4, to: node3)
        tree.add(&node6, to: node3)
        tree.addToRoot(&node)
        tree.addToRoot(&node2)
        tree.add(&node5, to: node4)
    }
}
