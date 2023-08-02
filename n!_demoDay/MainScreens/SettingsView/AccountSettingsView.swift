import SwiftUI

struct AccountSettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    @EnvironmentObject var appState: AppState
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var age: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
                .disabled(!isEditing)
            TextField("Surname", text: $surname)
                .padding()
                .disabled(!isEditing)
            TextField("Age", text: $age)
                .padding()
                .keyboardType(.numberPad)
                .disabled(!isEditing)
            TextField("Height", text: $height)
                .padding()
                .keyboardType(.decimalPad)
                .disabled(!isEditing)
            TextField("Weight", text: $weight)
                .padding()
                .keyboardType(.decimalPad)
                .disabled(!isEditing)
            
            Button(action: {
                isEditing.toggle()
                // Perform update logic here using the new values in `name`, `surname`, `age`, `height`, and `weight`
            }) {
                Image(systemName: isEditing ? "checkmark.circle.fill" : "pencil.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
            }
            .padding(.top, 20)
            Spacer()
            Button {
                viewModel.deleteUser()
                appState.logout()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .frame(width: 330 , height: 60)
                    
                    Text("Удалить аккаунт")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 330 , height: 60)
                        
                }
                .padding()
            }
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarBackButtonTitleHidden()
    }
}

//struct AccountSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountSettingsView()
//    }
//}
