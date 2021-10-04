//
//  Project-CoreDataHelpers.swift
//  MyProjectTracker
//
//  Created by Eric Alas on 2021-10-03.
//

import Foundation

extension Project {
    var projectTitle: String {
        title ?? "New Project"
    }

    var projectDetail: String {
        detail ?? ""
    }

    var projectColor: String {
        color ?? "Light Blue"
    }

    var projectItems: [Item] {
        let itemArray = items?.allObjects as? [Item] ?? []
        return itemArray.sorted { first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else {
                if second.completed == false {
                    return false
                }
            }

            if first.priority > second.priority {
                return true
            } else if first.priority < second.priority {
                return false
            }

            return first.itemCreationDate < second.itemCreationDate
        }
    }
    
    var completionAmount: Double {
        let originalItems = items?.allObjects as? [Item] ?? []
        guard originalItems.isEmpty == false else { return 0 }
        let completedItem = originalItems.filter(\.completed)
        
        return Double(completedItem.count) / Double(originalItems.count)
    }

    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let project = Project(context: viewContext)

        project.title = "Example Project"
        project.detail = "This is an example Project"
        project.closed = true
        project.creationDate = Date()

        return project
    }
}
