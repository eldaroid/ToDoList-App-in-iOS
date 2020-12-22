//
//  Model.swift
//  ToDoList
//
//  Created by Эльдар Попов on 22.12.2020.
//

import Foundation

var toDoList: [[String: Any]] = [["Name" : "Позвонить маме1", "isComplited" : false], ["Name" : "Позвонить маме2", "isComplited" : false], ["Name" : "Позвонить маме3", "isComplited" : true], ["Name" : "Позвонить маме4", "isComplited" : false]]

func addItem(nameItem: String, isCompleted: Bool = false) {
    toDoList.append(["Name" : nameItem, "isComplited" : isCompleted])
    saveData()
}

func changeState(at item: Int) -> Bool  {
    toDoList[item]["isComplited"] = !(toDoList[item]["isComplited"] as! Bool)
    saveData()
    return (toDoList[item]["isComplited"] as! Bool)
}

func removeItem(at index: Int) {
    toDoList.remove(at: index)
}

func saveData() {
    UserDefaults.standard.setValue(toDoList, forKey: "ToDoDataKey")
    UserDefaults.standard.synchronize()
}

func loadData() {
    if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
        toDoList = array
    } else {
        toDoList = []
    }
}
