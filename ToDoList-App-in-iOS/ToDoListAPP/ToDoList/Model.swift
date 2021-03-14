//
//  Model.swift
//  ToDoList
//
//  Created by Эльдар Попов on 22.12.2020.
//

import Foundation

var toDoList: [[String: Any]] {
    set {
        UserDefaults.standard.setValue(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
        
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted: Bool = false) {
    toDoList.append(["Name" : nameItem, "isComplited" : isCompleted])
}

func changeState(at item: Int) -> Bool  {
    toDoList[item]["isComplited"] = !(toDoList[item]["isComplited"] as! Bool)
    return (toDoList[item]["isComplited"] as! Bool)
}

func moveItem(fromIndex: Int, to: Int) {
    let from = toDoList[fromIndex]
    toDoList.remove(at: fromIndex)
    toDoList.insert(from, at: to)
}

func removeItem(at index: Int) {
    toDoList.remove(at: index)
}
//
//func saveData() {
//    UserDefaults.standard.setValue(toDoList, forKey: "ToDoDataKey")
//    UserDefaults.standard.synchronize()
//}
//
//func loadData() {
//    if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
//        toDoList = array
//    } else {
//        toDoList = []
//    }
//}
