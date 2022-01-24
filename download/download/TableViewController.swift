//
//  TableViewController.swift
//  download
//
//  Created by Halilovic Ema on 18.01.22.
//

import UIKit

class TableViewController: UITableViewController {
    
    let path = "https://jsonplaceholder.typicode.com/todos"
    var queue = DispatchQueue(label: "Download")
    var toDoModel = ToDoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queue.async {                                       // nicht Main-Thread
            let model = self.download()
            DispatchQueue.main.async {                      // Main-Thread, immer für UI
                self.toDoModel = model                      // nicht vorher, weil sonst im Nebenthread
                self.tableView.reloadData()                 // Daten werden neu geladen
            }
            
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoModel.todos.count
    }
    
    func download() -> ToDoModel{
        let toDoModel = ToDoModel()
        if let url = URL(string: path) {
            if let data = try? Data(contentsOf: url){       // try, if failed return nil
                print("download \(data)")
                if let obj = try? JSONSerialization.jsonObject(with: data, options: []){
                    print("obj \(obj)")
                    if let arr = obj as? [[String: Any]]{   // ¡so schreibt man 1 dictionary-array!
                        print("array \(arr)")
                        for todo in arr{                    // for var todo…
                            let oneTodo = ToDo()
                            // insert values into model
                            oneTodo.userId = todo["userId"] as! Int
                            oneTodo.id = todo["id"] as! Int
                            oneTodo.title = todo["title"] as! String
                            oneTodo.completed = todo["completed"] as! Bool
                            
                            toDoModel.todos.append(oneTodo)
                        }
                    }
                }else{
                    print("data parse failed")
                }
            }else {
                print("download failed")
            }
        }
        return toDoModel
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath)       // Identifier von Main.storyboard
     
        let tempTodo = toDoModel.todos[indexPath.row]
        cell.textLabel?.text = tempTodo.title
        cell.detailTextLabel?.text = "\(tempTodo.id)"           // Int in String umwandeln
        
     return cell
     }
     
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
