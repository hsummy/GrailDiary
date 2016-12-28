//
//  TreeTableViewController.swift
//  GrailDiary
//
//  Created by HSummy on 12/19/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import UIKit


class TreeTableViewController: UITableViewController

{
    var trees = [Tree]()
    var textLabel: UILabel!
    var detailTextLabel: UILabel?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadTrees()
        
        
//        var json: Array!
//        do {
//            json = try NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions()) as? Array
//        } catch {
//            print(error)
//        }
//        
//        if let item = json[0] as? [String: AnyObject] {
//            if let person = item["person"] as? [String: AnyObject] {
//                if let age = person["age"] as? Int {
//                    print("Dani's age is \(age)")
//                }
//            }
//        }
        
        
        
        
        
 //       let
//        do {
//            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
//            if let arrJSON = allContacts["contacts"] {
//                for index in 0...arrJSON.count-1 {
//                    let aObject = arrJSON[index] as! [String : AnyObject]
//                    names.append(aObject["name"] as! String)
//                    contacts.append(aObject["email"] as! String)
//                }
//            }
//            self.tableView.reloadData()
//        }
//        catch {
//        }
    //}
    
//        tableView.dataSource = self
//        tableView.delegate = self
    
       // dictionaryDetailsOfTrees = Tree.dictionaryResultsOfTree
        //self.tableView.reloadData()
            // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
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
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         //Return false if you do not want the specified item to be editable.
        return true
    }


    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        // Get the new view controller using segue.destinationViewController.
////        // Pass the selected object to the new view controller.
////     
////            let destVC = segue.destination as? TreeDetailsViewController
////            destVC?.delegate = self
//
    //}


}//end of class
