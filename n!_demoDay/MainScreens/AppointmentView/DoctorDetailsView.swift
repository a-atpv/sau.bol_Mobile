import SwiftUI

struct DoctorDetailsView: View {
    var doctor: Doctor
    let message = "Здравствуйте, записаться на прием!"
    
    var body: some View {
        VStack {
            
//                ZStack(alignment: .leading) {
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundColor(Color.customLightBlue)
//                        .frame(height: 60)
//                        HStack {
//                            BackToView(destination: RootView().navigationBarBackButtonHidden())
//                            Spacer()
//                        }.padding(.horizontal)
//                    }
                        
                        HStack(spacing: 10) {
                            AsyncImage(url: URL(string: doctor.image)!) { image in
                                image
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                            .padding(8)

                            VStack(alignment: .leading){
                                Text(doctor.name)
                                    .font(.system(size: 20, weight: .semibold))
                                Text(doctor.title)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            //                    .padding(.vertical, 10)
                            
//                            .padding(.horizontal, 8)
                        }
                        .frame(height: 90)
                    
                
            ScrollView(.vertical) {
                
                // Doctor's main text
                Text(doctor.title)
                
                // Text with plain text with frame around
                Text(doctor.info)
                    .padding()
                    .border(Color.gray, width: 1)
                    .cornerRadius(10)
                
                Spacer()
                // WhatsApp connect button
                Button(action: {
                    openWhatsApp()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.green)
                            .opacity(0.8)
                            .frame(width: 330 , height: 60)
                        
                        Text("Связаться с врачем")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 330 , height: 60)
                            
                    }
                }
                .padding()
            }
            .toolbar(.hidden, for: .tabBar)
        }
//        .navigationBarBackButtonHidden()

       
        
        //        .padding()
    }
    
    func openWhatsApp() {
        if let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://wa.me/\(doctor.number)?text=\(encodedMessage)") {
            UIApplication.shared.open(url)
            print(url)
        }
    }
}


struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.4)
                    .frame(width: 30, height: 30)

                Image("backButton")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}

struct BackToView<Destination: View>: View {
    var destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.4)
                    .frame(width: 30, height: 30)

                Image("backButton")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}





struct DoctorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailsView(doctor: Doctor(id: "", image: "", name: "", title: "", price: "", info: "", number: ""))
    }
}
