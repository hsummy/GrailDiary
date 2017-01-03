//
//  TreeDetailsViewController.swift
//  GrailDiary
//
//  Created by HSummy on 12/19/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import UIKit

class TreeDetailsViewController: UIViewController
{
    var trees = [Tree]()
//var tree: Tree?
    var name = " "
    var treefamily = " "
    var age = " "

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var treefamilyLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        
//        if Tree = trees
//        {
//        let name = String()
//        let treefamily = String()
//        let age = String()
//        }
        
        
        // self thingings if let myisland = islanddetails
        //self.name = name
        //    let treefamilyLabel: String!
        //    let ageLabel =
        
        //self.imageView?.image = UIImage(named: "cotton-tree")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
       
        }

    

    

    
    
    
}
