import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("View 1")
                }
                
            AppointmentView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("View 2")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("View 3")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
