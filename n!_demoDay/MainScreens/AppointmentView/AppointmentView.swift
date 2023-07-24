import SwiftUI

struct AppointmentView: View {
    @StateObject var viewModel = AppointmentViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
//                Text("Doctors")
//                    .bold()
//                    .font(.system(size: 30,weight: .bold))
                HStack {
//                    Image("doctor_suggesting")
//                        .resizable()
//                        .frame(width: 120, height: 120)
//                        .scaledToFill()
//                        .clipShape(Circle())
                    VStack {
                        Text("Если есть вопросы, рекомендую обратиться к моим коллегам")
                    }
                }

                ScrollView {
                    LazyVGrid(columns: createGridItems(), spacing: 16) {
                        ForEach(viewModel.doctors) { doctor in
                            DoctorView(doctor: doctor)
                        }
                    }
                    .padding()
                    .onAppear {
                        viewModel.getDoctors()
                    }
                }
            }
        }
    }
    
    private func createGridItems() -> [GridItem] {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        return columns;
    }
}


struct DoctorView: View {
    let doctor: Doctor
    
    var body: some View {
        NavigationLink(destination: DoctorDetailsView(doctor: doctor)) {
            ZStack {
                AsyncImage(url: URL(string: doctor.image)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(12)
                        .frame(width: 120, height: 220)
                } placeholder: {
                    ProgressView()
                }
                
                VStack() {
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 120, height: 80)
                            .foregroundColor(.customBlue)
                            .opacity(0.3)
                        VStack{
                            Text(doctor.name)
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            
    //                        Text(doctor.price)
    //                            .font(.subheadline)
    //                            .foregroundColor(.white)
    //                            .multilineTextAlignment(.leading)
                            
                        }
    //                    .padding()
                    }
                }
                .frame(width: 120, height: 220)
            }
        }
    }
    
    func buttonTapped() {
        // Handle button tap
        print("Button tapped for doctor: \(doctor.name)")
    }
}


struct DoctorView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorView(doctor: Doctor(id: "", image: "https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-at-camera-in-the-office_1301-7807.jpg?w=2000", name: "Askarova Daniya", title: "", price: "", info: "", number: ""))
    }
}


//struct AppointmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppointmentView()
//    }
//}
