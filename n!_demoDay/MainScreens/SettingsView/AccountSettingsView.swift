import SwiftUI

struct AccountSettingsView: View {
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
        }
        .padding()
        .navigationBarTitle("Account Settings")
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
