//
//  Node.swift
//  Chess
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

class TreeNode<T> {
    
    var value: T
    var heuristicValue: Int
    var children: [TreeNode<T>] = []
    weak var parent: TreeNode<T>?
    
    init(value: T, heuristicValue: Int) {
        self.value = value
        self.heuristicValue = heuristicValue
    }
    
    func add(child: TreeNode<T>) {
        children.append(child)
        child.parent = self
    }
    
    var isRoot: Bool {
        return parent == nil
    }

    var isLeaf: Bool {
       return children.isEmpty
    }
    
}

extension TreeNode where T: Equatable {
    
    func search(value: T) -> TreeNode<T>? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}
