import SwiftUI

struct SignInView: View {
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @EnvironmentObject var appState: AppState
    @State var alertText = ""
    @State private var isPasswordVisible = false
//    private let nextView = ContentView()
    private let validator = Validator()
    private let viewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                usernameTextField
                passwordTextField
                repeatPasswordTextField
                alertView
                Spacer()
                CustomButton(text: "Зарегистрироваться") {
                    alertText = validator.validation(mail: mail, password: password, repeatPassword: repeatPassword)
                    if alertText.isEmpty {
                        viewModel.registerUser(mail: mail, password: password) { response in
                            if response.0 {
                                appState.login()
                            }else {
                                print(response.1)
                            }
                        }
                    }
                }
            }
//            .navigationDestination(isPresented: $isAuthenticated) {
//                nextView
//            }
            .padding()
        }
    }
    
    var usernameTextField: some View {
        TextField("Mail", text: $mail)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textInputAutocapitalization(.never)
            .padding()
    }
    var passwordTextField: some View {
        SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        
    }
    var repeatPasswordTextField: some View {
        SecureField("Repeat password", text: $repeatPassword)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
    var alertView: some View {
        Text(alertText)
            .foregroundColor(.red)
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
