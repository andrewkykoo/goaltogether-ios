//
//  ContentView.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var groupListViewModel = GroupListViewModel()
    
    var body: some View {
        MainTabView()
            .environmentObject(groupListViewModel)
    }
}

#Preview {
    ContentView()
}
