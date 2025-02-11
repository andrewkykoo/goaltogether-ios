//
//  MainTabView.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Explore")
                .tabItem {
                    Label("Explore", systemImage: "globe")
                }
            
            Text("Dashboard")
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.xaxis.ascending.badge.clock")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainTabView()
}
