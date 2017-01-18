//
//  TreeTableViewController.swift
//  GrailDiary
//
//  Created by HSummy on 12/19/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import UIKit

//when making variables global (outside of class)... I could put it within the class, if using Core Data, collect data from internet. Try to minimize global variable since it takes a lot of memory for the system to access the variables all the time. If need to access the variable with other ViewControllers, then make them global.




class TreeTableViewController: UITableViewController

{
   var trees = [Tree]() 

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadTrees()
        
    
        //h-only use below two lines of code if I was inserting a TableView within a ViewController
//        tableView.dataSource = self
//        tableView.delegate = self
    
       // dictionaryDetailsOfTrees = Tree.dictionaryResultsOfTree
        //self.tableView.reloadData()
            // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
  //function for loading 'Trees' JSON File into a Dictionary.
    func loadTrees()
    {
        do
        {
            let filePath = Bundle.main.path(forResource: "tree", ofType: "json")
            let dataFromFile = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
            if let treeData = try JSONSerialization.jsonObject(with: dataFromFile!, options: []) as? [[String: Any]]
            {
                if let possibleTrees = Tree.treeDictionariesFromArrayJSON(treesArray: treeData)
                {
                    trees = possibleTrees
                    print(treeData)
                }
            }
        }
        catch
        {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }

// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      
        return trees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "treeCell", for: indexPath)

        let aTree = trees[indexPath.row]
        cell.textLabel?.text = aTree.name
        cell.detailTextLabel?.text = aTree.country
        
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
         //Return false if you do not want the specified item to be editable.
        return true
    }


    
     //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert
        {
             //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
// MARK: - Navigation
//H- do not need 'perform segue' code below since only using auto segue in Storyboard (Triggered Segue)!!!!!!!! BUT I DO NEED PREPARE SEGUE CODE, since i used an auto segue in storyboard.

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        
//        func prepare(for segue: UIStoryboardSegue, sender: Any?)
//        {
//            //if segue.identifier == "TreeDetailsSegue"
//            //{
//                    let destination = segue.destination as! TreeDetailsViewController
//                    let aTree = trees[indexPath.row]
//                    destination.nameLabel.text = aTree.name
//                    destination.treefamilyLabel.text = aTree.treefamily
//                    destination.ageLabel.text = aTree.age
//            
//            //}//prepare(withIdentifier: "TreeDetailsSegue", sender: nil)
//        }
//        print(Tree.self)
//    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == "TreeDetailsSegue"
            {
                if let indexPath = self.tableView.indexPathForSelectedRow
                {
                    let destinationVC = segue.destination as! TreeDetailsViewController
                    let aTree = trees[indexPath.row]
                    destinationVC.tree = aTree
                    
                    //DO NOT NEED TO BREAK DOWN EACH ITEM AND SEND...JUST PASS 'TREE'
//                    destinationVC.treefamilyLabel.text = aTree.treefamily
//                    destinationVC.ageLabel.text = aTree.age
                }
                print(Tree.self)
            }
        }
    
    
    
    
    
    
    
    
    
}//end of class
