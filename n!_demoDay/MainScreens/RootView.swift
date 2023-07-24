import SwiftUI

struct RootView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .gray
       }
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "calendar")
                        .frame(width: 40, height: 40)
                }
            
            
            AppointmentView()
                .tabItem {
                    Image(systemName: "heart.text.square")
                        .frame(width: 40, height: 40)
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                        .frame(width: 40, height: 40)
                }
        }
        .accentColor(.customBlue)
        .navigationBarBackButtonHidden()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
