import SwiftUI

struct LogInView: View {
    @State private var mail: String = ""
    @State private var password: String = ""
    @EnvironmentObject var appState: AppState
    var viewModel = LogInViewModel()
    
    var body: some View {
//        NavigationStack{
            VStack {
                mailTextField
                passwordTextField
                forgotPasswordButton
                    
                Spacer()
                loginButton


            }
//            .padding()
//        }
        
        
    }
    var loginButton: some View {
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
    
    var forgotPasswordButton: some View {
        NavigationLink("Забыл пароль") {
            ForgotPasswordView()
        }
        .navigationTitle("")
        .tint(Color.customBlue)
        .frame(width: 300, alignment: .trailing)
    }
    
    var mailTextField: some View {
        TextField("Почта", text: $mail)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textInputAutocapitalization(.never)
            .padding()
    }
    var passwordTextField: some View {
        SecureField("Пароль", text: $password)
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
