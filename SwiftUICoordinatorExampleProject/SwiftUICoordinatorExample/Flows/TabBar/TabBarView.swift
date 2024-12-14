import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var coordinator: TabBarCoordinator

    var body: some View {
//        let _ = print("Update TabBarView body for TabBarCoordinator \n")

        if #available(iOS 18.0, *) {
            TabView(selection: $coordinator.activeTab) {
                Tab(
                    "First",
                    systemImage: "house",
                    value: .firstTab
                ) {
                    coordinator.firstTabView
                }

                Tab(
                    "Second",
                    systemImage: "star",
                    value: .secondTab
                ) {
                    coordinator.secondTabView
                }
            }
        } else {
            TabView(selection: $coordinator.activeTab) {
                coordinator.firstTabView
                    .tabItem {
                        Label("First", systemImage: "house")
                    }

                coordinator.secondTabView
                    .tabItem {
                        Label("Second", systemImage: "star")
                    }
            }

        }
    }
}
