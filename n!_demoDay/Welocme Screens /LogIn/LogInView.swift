import SwiftUI

struct LogInView: View {
    @State private var mail: String = ""
    @State private var password: String = ""
    @EnvironmentObject var appState: AppState
//    private let nextView = ContentView()
    var viewModel = LogInViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                mailTextField
                passwordTextField
                Spacer()
                CustomButton(text: "Войти") {
                    viewModel.authorizeUser(mail: mail, password: password, completion: { response in
                        if response.0{
                            appState.login()
                        }else {
                            print(response.1)
                        }
                    })
                }


            }
//            .navigationDestination(isPresented: $isAuthenticated) {
//                nextView
//            }
            .padding()
        }
        
        
    }
    
    var mailTextField: some View {
        TextField("Mail", text: $mail)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textInputAutocapitalization(.never)
            .padding()
    }
    var passwordTextField: some View {
        SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textInputAutocapitalization(.never)
            .padding()
    }
}


struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
