import SwiftUI

struct RecommendationView: View {
    @StateObject var viewModel: TestViewModel
    @State var healthFact = "пока врач пишет вам рекомендации, могу рассказать вам интересные факты из последних исследований"
    var body: some View {
        Group {
            if viewModel.recommendation.isEmpty {
                loadingView
            } else {
                ScrollView {
                    HStack (alignment: .top){
                        Text(viewModel.recommendation)
                            .foregroundColor(.black)
                        Image("doctor_avatar")
                            .resizable()
                            .frame(width: 60,height: 60)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                }
                .padding()
            }
        }
    }
    
    private var loadingView: some View {
        VStack {
            Image("nurse")
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFill()
                .clipShape(Circle())
            
            Text(healthFact)
                .foregroundColor(.black)
                .padding()
            
            CustomButton(text: "Хочу узнать факт") {
                healthFact = Advice.healthFacts.randomElement()!
            }
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(1.5)
                .padding()
            
            
        }
    }
}
