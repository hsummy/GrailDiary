//
//  Tree.swift
//  GrailDiary
//
//  Created by HSummy on 12/19/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import Foundation
import UIKit

class Tree

{
    let name: String!
    let country: String!
    let treefamily: String!
    let age: String!
    
    
    init(name: String, country: String, treefamily: String, age: String)
    {
        self.name = name
        self.country = country
        self.treefamily = treefamily
        self.age = age
    }
    
    static func treeInfoJSON(_ detailsWithTrees: Dictionary<String, Any>) -> Tree?
    {
        if let name = detailsWithTrees["name"] as? String,
            let country = detailsWithTrees["country"] as? String,
            let treefamily = detailsWithTrees["treefamily"] as? String,
            let age = detailsWithTrees["age"] as? String
        {
            let aTree = Tree(name: name, country: country, treefamily: treefamily, age: age)
            return aTree
            
        }
        else
        {
            return nil
        }
    }

}//end of class Tree
