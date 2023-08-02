import SwiftUI

struct RecommendationView: View {
    @StateObject var viewModel: TestViewModel
    @State var healthFact = "пока врач пишет вам рекомендации, могу рассказать вам интересные факты из последних исследований"
    @State var isExpanded = false
    @State var adviceDidGenerated = false
    
    var body: some View {
        if viewModel.recommendation == nil {
            loadingView
        } else {
            recommendationView
        }
    }
    
    private var recommendationView: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading,spacing: 4) {
                    
                    Text(viewModel.recommendation?.intro ?? "")
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                    analysisView
                    habitView
                    
                    Text(viewModel.recommendation!.conclusion)
                        .padding(.vertical, 20)
                    
                    ExpandableView(question: "Почему мне надо сдать эти анализы?", answer: viewModel.recommendation?.explanation ?? "")
                        .padding(.bottom, 4)
                    
                    ExpandableView(question: "На чем основываются ваши рекомендации?", answer: "Рекомендации основываются на ответах на тест, после проанализированным с помощью искусственного интеллекта. Стоит относиться к советам с осторожностью, перед тем как следовать советам проконсультируйтесь с вашим врачом")
                        .padding(.bottom, 4)
                }
                .padding()
            }
            .navigationBarBackButtonTitleHidden()
            .navigationBarBackButtonHidden(false)
        }
        .navigationBarBackButtonTitleHidden()
        .navigationBarBackButtonHidden(false)
    }
    
    private var habitView: some View {
        VStack(alignment: .leading){
            Text("Советую вам внедрить эти привычки")
                .font(.system(size: 20, weight: .semibold))
//                .frame(width: 300)
            
            ForEach(viewModel.recommendation!.habits, id: \.self) { habit in
                HStack(alignment: .top){
                    Text("🎯" + habit)
                    Spacer()
                    Button {
                        viewModel.createHabit(habit: habit)
                    } label: {
                        Text("+")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    private var analysisView: some View {
        VStack(alignment: .leading){
            Text("Вам стоит сдать эти анализы")
                .font(.system(size: 20, weight: .semibold))
            ForEach(viewModel.recommendation!.analysis, id: \.self) { analysis in
                Text("🧪" + analysis)
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
            
            CustomButton(text: adviceDidGenerated ? "Давайте еще!" : "Хочу узнать факт") {
                healthFact = Advice.healthFacts.randomElement()!
                adviceDidGenerated = true
            }
            
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(1.5)
                .padding()
            
        }
    }
}

struct AdditionalInfoView: View {
    var question: String
    var info: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.red)
                .opacity(0.7)
                .shadow(color: .black, radius: 3)
            VStack {
                HStack {
                    Text(question)
                    Button {
                        ()
                    } label: {
                        Image(systemName: "location")
                    }
                    
                }
            }
        }
    }
}

//struct RecommendationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendationView()
//    }
//}
