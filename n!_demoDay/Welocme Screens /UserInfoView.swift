import SwiftUI

struct UserInfoView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var age: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
            TextField("Surname", text: $surname)
                .padding()
            TextField("Age", text: $age)
                .padding()
                .keyboardType(.numberPad)
            TextField("Height", text: $height)
                .padding()
                .keyboardType(.decimalPad)
            TextField("Weight", text: $weight)
                .padding()
                .keyboardType(.decimalPad)
            
//            Button(action: {
//              let user = User(userId: "", name: name, age: Int(age)!, height: Double(height)!, weight: weight)!
//
//            }) {
//                Image(systemName: isEditing ? "checkmark.circle.fill" : "pencil.circle.fill")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(.blue)
//            }
//            .padding(.top, 20)
        }
        .padding()
        .navigationBarTitle("Account Settings")
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
