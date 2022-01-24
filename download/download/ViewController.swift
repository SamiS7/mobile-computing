//
//  ViewController.swift
//  download
//
//  Created by Halilovic Ema on 11.01.22.
//

import UIKit

class ViewController: UIViewController {

    let path = "https://jsonplaceholder.typicode.com/todos"
    @IBOutlet weak var label: UILabel!
    var queue = DispatchQueue(label: "Download")
    
    var toDoModel = ToDoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var variable = "hallo :)"
        queue.async {                                       // nicht Main-Thread
            let x = 42
            print("in queue \(variable)")
            let model = self.download()
            DispatchQueue.main.async {                      // Main-Thread, immer für UI
                print("main \(x)")
                self.label.text = "main \(x)"
                self.toDoModel = model                      // nicht vorher, weil sonst im Nebenthread
                // self.tableView.reloadData()                 wir haben noch keine TableView :( => HÜ
            }
        }
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
}

