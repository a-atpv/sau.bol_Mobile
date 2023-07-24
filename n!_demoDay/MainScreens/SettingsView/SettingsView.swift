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
                .listStyle(.plain)
                .background(Color.white)
                Button {
                    viewModel.logout()
                    appState.logout()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.red)
                            .frame(width: 280, height: 40)
                        Text("Выйти")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                    }
                    .padding()
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
