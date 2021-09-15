//
//  MyProjectTrackerApp.swift
//  MyProjectTracker
//
//  Created by Eric Alas on 2021-09-15.
//

import SwiftUI

@main
struct MyProjectTrackerApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
