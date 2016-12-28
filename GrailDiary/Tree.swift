//
//  Tree.swift
//  GrailDiary
//
//  Created by HSummy on 12/19/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import Foundation
import UIKit

struct Tree // can be a class, struct is a 'read only' file

{
    let name: String!
    let country: String!
    let treefamily: String!
    let age: String?
    
    //let json = ("name", "country", "treefamily", "age")
    
    
    init(name: String, country: String, treefamily: String, age: String)
    {
        self.name = name
        self.country = country
        self.treefamily = treefamily
        self.age = age
    }
    
    static func treeDictionariesFromArrayJSON(treesArray: [[String: Any]]) -> [Tree]?
    {
        var dictionaryDetailsOfTrees = [Tree]()
        
        if  treesArray.count > 0
        {
            for anItem in treesArray
            {
            let name = anItem["name"] as? String
            let country = anItem["country"] as? String
            let treefamily = anItem["treefamily"] as? String
            let age = anItem["age"] as? String

            let aTree = Tree(name: name!, country: country!, treefamily: treefamily!, age: age!)
                
            dictionaryDetailsOfTrees.append(aTree)
            }
            return dictionaryDetailsOfTrees
            }
            else
            {
            return nil
            }
    }//end of static
}//end of class Tree
