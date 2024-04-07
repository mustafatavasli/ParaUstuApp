//
//  ContentView.swift
//  ParaUstu
//
//  Created by Mustafa TAVASLI on 7.04.2024.
//

import SwiftUI

struct ContentView: View {
    // Intro Screen Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime : Bool = true
    // Active Tab
    @State private var activeTab : Tab = .recents
    var body: some View {
        TabView(selection: $activeTab) {
            Text("Recents")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            
            Text("Search")
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            
            Text("Chart")
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
