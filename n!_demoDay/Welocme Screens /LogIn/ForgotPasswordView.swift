import SwiftUI

struct ForgotPasswordView: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var token: String = ""
    @State var doctorText: TextCase = .main
    
    var body: some View {
        VStack {
            headerView
                .padding(.bottom, 16)
            mailTextField
            tokenTextField
            passwordTextField
            Spacer()
            resetPasswordButton
            
        }
    }
    var headerView: some View {
        HStack {
            Image("doctor_avatar")
                .resizable()
                .frame(width: 120, height: 120)
                .scaledToFill()
                .clipShape(Circle())
            VStack {
                Text(doctorText.rawValue)
            }
            Spacer()
            
        }
        .padding()

    }
    
    var mailTextField: some View {
        ZStack(alignment: .trailing) {
            TextField("Почта", text: $mail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding()
            Button(action: {
                if Validator().isValidEmail(mail) {
                    doctorText = .passwordSend
                    viewModel.sendNewPassword(mail: mail)
                } else{
                    doctorText = .wrongMail
                }
                
            }) {
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }

            .padding(.trailing, 24)
        }

    }
    var tokenTextField: some View {
        TextField("Временный пароль", text: $token)
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
    
    var resetPasswordButton: some View {
        CustomButton(text: "Перезаписать пароль") {
            if Validator().isPasswordValid(password) {
                doctorText = .success
                viewModel.setNewPassword(mail: mail, newPassword: password, token: token)
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }


}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

enum TextCase: String {
    case main = "Забыли пароль? \nВведите email, на который вам придет временный пароль"
    case passwordSend = "Временный пароль отправлен! \nВпишите его что бы войти"
    case wrongPassword = "Неверный пароль, попробуйте еще"
    case wrongMail = "Введите правильный адрес"
    case success = "Отлично!"
}
