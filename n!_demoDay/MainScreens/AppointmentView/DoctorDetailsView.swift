import SwiftUI

struct DoctorDetailsView: View {
    var doctor: Doctor
    let message = "Здравствуйте, записаться на прием!"
    
    var body: some View {
        VStack() {
            
            HStack{
                AsyncImage(url: URL(string: doctor.image)!) { image in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading){
                    Text(doctor.name)
                        .font(.system(size: 20, weight: .semibold))
                    Text(doctor.price)
                        .font(.system(size: 14, weight: .regular))
                }
            }
            ScrollView{
                Text(doctor.info)
            }
            .padding()
            Button(action: {
                openWhatsApp()
            }) {
                Text("Contact via WhatsApp")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        
    }
    
    func openWhatsApp() {
        if let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://wa.me/\(doctor.number)?text=\(encodedMessage)") {
            UIApplication.shared.open(url)
            print(url)
            
        }
    }
}

struct DoctorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailsView(doctor: Doctor(id: "", image: "", name: "", title: "", price: "", info: "", number: ""))
    }
}

