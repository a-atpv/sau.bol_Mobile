import SwiftUI

struct AppointmentView: View {
    @StateObject var viewModel = AppointmentViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Text("Выберите врача для консультации")
                        .font(.system(size: 30,weight: .bold))
                    Spacer()
                }.padding(.horizontal)
                
                
                
                ScrollView {
                    LazyVGrid(columns: createGridItems(), spacing: 16) {
                        ForEach(viewModel.doctors) { doctor in
                            DoctorView(doctor: doctor)
                                .navigationTitle("")
                        }
                    }
                    .padding()
                    .onAppear {
                        viewModel.getDoctors()
                    }
                }
                .tint(Color.customBlue)
            }
        }
        .toolbar(.visible, for: .tabBar)
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
                        .frame(width: 160, height: 200)
                        .scaledToFill()
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }
                
                VStack {
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 160, height: 70)
                            .foregroundColor(.white)
                            .opacity(0.5)
                        VStack(alignment: .leading){
                            
                            Text(doctor.name)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            Text("от " + doctor.price)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            Text(doctor.title)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(2)
                        
                        
                    }
                }
            }
        }
        .frame(width: 160, height: 200)
        .padding(4)
       
        
        
    }
    
    func buttonTapped() {
        // Handle button tap
        print("Button tapped for doctor: \(doctor.name)")
    }
}


//struct DoctorView_Previews: PreviewProvider {
//    static var previews: some View {
//        DoctorView(doctor: Doctor(id: "", image: "https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-at-camera-in-the-office_1301-7807.jpg?w=2000", name: "Askarova Daniya", title: "", price: "", info: "", number: ""))
//    }
//}


