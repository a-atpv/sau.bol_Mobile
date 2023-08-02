import SwiftUI

struct DoctorDetailsView: View {
    var doctor: Doctor
    let message = "Здравствуйте, записаться на прием!"
    
    var body: some View {
            VStack {
                headerView
                statsView
                VStack(alignment: .leading) {
                    Text("О докторе")
                        .font(.system(size: 18,weight: .semibold))
                    
                    Text(doctor.about)
                        .padding(.bottom , 8)
                    
                    // Using ForEach instead of List to remove dividers
                    ForEach(doctor.facts, id: \.self) { fact in
                        Text("- " + fact)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
                .padding()
                Spacer()
                whatsAppButton
                    .toolbar(.hidden, for: .tabBar)
            }
        }
    
    var headerView: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: doctor.image)!) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
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
            Spacer()
        }
        .frame(height: 90)
    }
    
    var statsView: some View {
        HStack {
            StatsView(statName: "Пациенты", statValue: doctor.patients)
            StatsView(statName: "Опыт", statValue: doctor.experience)
            StatsView(statName: "Рейтинг", statValue: doctor.rating)
        }
    }
    
    var whatsAppButton: some View {
        Button(action: {
            openWhatsApp()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                    .opacity(0.8)
                    .frame(width: 330 , height: 50)
                
                Text("Связаться с врачом")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 330 , height: 50)
                
            }
        }
        .padding()
    }
    
    func openWhatsApp() {
        if let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://wa.me/\(doctor.number)?text=\(encodedMessage)") {
            UIApplication.shared.open(url)
            print(url)
        }
    }
}

struct StatsView: View {
    var statName: String
    var statValue: String
    var systemImageName: String
    
    init(statName: String, statValue: String) {
        self.statName = statName
        self.statValue = statValue
        
        // Map the statName to the corresponding SF Symbol name
        switch statName {
        case "Пациенты":
            systemImageName = "person.2"
        case "Опыт":
            systemImageName = "heart"
        case "Рейтинг":
            systemImageName = "star"
        default:
            systemImageName = ""
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 110, height: 90, alignment: .center)
                .foregroundColor(.customPink)
            VStack(spacing: 4) {
                // Use the SF Symbol image here
                Image(systemName: systemImageName)
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                //                    .padding(8)
                Text(statName)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .light))
                //                    .padding(8)
                Text(statValue)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                //                    .padding(8)
            }
        }
        .padding(4)
    }
}





//struct DoctorDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DoctorDetailsView(doctor: Doctor(id: "", image: "", name: "", title: "", price: "", info: "", number: ""))
//    }
//}
