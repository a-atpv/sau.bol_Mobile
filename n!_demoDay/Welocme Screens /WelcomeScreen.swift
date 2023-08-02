import SwiftUI

struct WelcomeScreen: View {
    init() {
        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "arrow.backward")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        
       }
    var body: some View {
        NavigationStack{
            ZStack {
                Text("Sau.bol")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(.customBlue)
                VStack {
                    Spacer()
                    NavigationLink(destination: LogInView()) {
                        CustomImageButton(text: "Войти")
                            .navigationTitle("")
                    }
                    
                    NavigationLink(destination: SignInView()) {
                        CustomImageButton(text: "Зарегистрироваться")
                            .navigationTitle("")
                    }
                }

            }
        }
        .padding()
        .navigationTitle("")
        .tint(Color.customBlue)
        .onAppear{
            print(UserDefaults.standard.string(forKey: UserDefaultKeys.tokenKey) ?? "")
        }
        
    }

}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}



