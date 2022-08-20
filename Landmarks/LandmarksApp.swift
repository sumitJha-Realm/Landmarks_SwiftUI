//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sumit Jha on 19/08/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
  @StateObject  private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
