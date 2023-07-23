import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink(destination: LogInView()) {
                    TestButton(text: "login")
                        .navigationBarBackButtonHidden()
                }
                
                NavigationLink(destination: SignInView()) {
                    TestButton(text: "signin")
                        .navigationBarBackButtonHidden()
                }
            }
            
        }.onAppear{
            print(UserDefaults.standard.string(forKey: UserDefaultKeys.tokenKey) ?? "")
        }
        
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
