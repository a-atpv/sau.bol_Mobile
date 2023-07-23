import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationView {
            VStack{
                List {
                    NavigationLink(destination: AccountSettingsView()) {
                        HStack {
                            Text("Account")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: TestHistorySettingsView()) {
                        HStack {
                            Text("Test History")
                            Spacer()
                        }
                    }
                    
                    NavigationLink(destination: HabitSettingsView()) {
                        HStack {
                            Text("Habits")
                            Spacer()
                        }
                    }
                }
                .navigationBarTitle("Settings")
                
                Button {
                    viewModel.logout()
                    appState.logout()
                } label: {
                    Text("Log out")
                        .foregroundColor(.red)
                }
//                .navigationDestination(isPresented: $didLogOut) {
//                    WelcomeScreen()
//                }
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
