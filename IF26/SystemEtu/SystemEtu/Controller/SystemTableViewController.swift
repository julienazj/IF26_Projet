//
//  SystemTableViewController.swift
//  SystemEtu
//
//  Created by Julien 安 on 2018/1/7.
//  Copyright © 2018年 if26. All rights reserved.
//

import UIKit
import AddressBook
class SystemTableViewController: UITableViewController {
    
    //var etudiants:[Etudent] = []
    //var db = dbEtu()
    var arEtu:[Etudent] = []
    let database = Database()



    override func viewDidLoad() {
        //let database = Database()
        database.tableStudentCreate()
        database.tableStudentInsertItem(Id: 1, Nom: "A", Prenom: "a", Formation: "ISI", Tele: 111)
        database.tableStudentInsertItem(Id: 2, Nom: "B", Prenom: "b", Formation: "ISI", Tele: 222)
        database.tableStudentInsertItem(Id: 3, Nom: "C", Prenom: "c", Formation: "ISI", Tele: 333)
        database.queryTableStudent()
        var arrayEtu = database.getRealArrayTable()
        self.arEtu = arrayEtu
        print("\(arrayEtu) + Yes!" )
        print(arrayEtu.count)
        print(arrayEtu[1])
        super.viewDidLoad()
        XLXContact().getContacts()
  /*
        db.ajoute(m: Etudent.init(id: 1, nom: "A", prenom: "a", formation: "ISI", tele: 11))
        db.ajoute(m: Etudent.init(id: 2, nom: "B", prenom: "b", formation: "ISI", tele: 22))
        db.ajoute(m: Etudent.init(id: 3, nom: "C", prenom: "c", formation: "ISI", tele: 33))
        db.ajoute(m: Etudent.init(id: 4, nom: "D", prenom: "d", formation: "ISI", tele: 44))
        db.ajoute(m: Etudent.init(id: 5, nom: "E", prenom: "e", formation: "ISI", tele: 55))
        db.ajoute(m: Etudent.init(id: 6, nom: "F", prenom: "f", formation: "ISI", tele: 66))
        db.ajoute(m: Etudent.init(id: 7, nom: "G", prenom: "g", formation: "ISI", tele: 77))
        self.etudiants = db.getEtu()*/
        
        //let identifiantEtudiant = "etudiant"
        // 1. 获取当前的授权状态,
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arEtu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "etudiant", for: indexPath)
        cell.textLabel?.text = "\(arEtu[indexPath.row].nom)"
        cell.detailTextLabel?.text = "id: \(arEtu[indexPath.row].id) Prenom: \(arEtu[indexPath.row].prenom)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        arEtu.remove(at: indexPath.row)
        database.tableEtudiantDeleteItem(Id: indexPath.row+1)
       // db.removeEtu(t:Int.init(indexPath.row))
        tableView.reloadData()
    }
    
  /*  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        
        let student = self.arEtu[indexPath.row]
        print("\(student)+0")
        self.performSegue(withIdentifier: "etuToDetail", sender: student)
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "etuToDetail",
            let detailEtu = segue.destination as? DetailViewController,
            let student = sender as AnyObject as? Etudent
            else { return }
        detailEtu.student = student
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "etuToDetail", sender: self.arEtu[indexPath.row])
    }



    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    */

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

        //performSegue(withIdentifier: "etuToDetail", sender: arEtu[indexPath.row])
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}




