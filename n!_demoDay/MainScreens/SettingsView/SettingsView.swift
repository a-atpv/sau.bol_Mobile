import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationView {
            VStack{
                Text("Аккаунт")
                    .font(.system(size: 30,weight: .bold))
                List {
                    NavigationLink(destination: AccountSettingsView(viewModel: viewModel)) {
                        HStack {
                            Text("Моя информация")
                            Spacer()
                        }
                    }
                    
//                    NavigationLink(destination: TestHistorySettingsView()) {
//                        HStack {
//                            Text("История тестов")
//                            Spacer()
//                        }
//                    }
//
//                    NavigationLink(destination: HabitSettingsView()) {
//                        HStack {
//                            Text("Привычки")
//                            Spacer()
//                        }
//                    }
                    
                    NavigationLink(destination: AppInfoSettingsView()) {
                        HStack {
                            Text("О приложении")
                            Spacer()
                        }
                    }
                }
                .navigationBarBackButtonHidden()
                .listStyle(.plain)
                .background(Color.white)
                Button {
                    viewModel.logout()
                    appState.logout()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.red)
                            .opacity(0.8)
                            .frame(width: 330 , height: 60)
                        
                        Text("Выйти")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 330 , height: 60)
                            
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
