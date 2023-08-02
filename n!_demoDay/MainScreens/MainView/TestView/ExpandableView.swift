import SwiftUI

struct ExpandableView: View {
    @State private var isExpanded = false
    var question: String
    var answer: String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.gray.opacity(0.2))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HStack {
                    Text(question)
                        .font(.body)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                .padding(.bottom, isExpanded ? 6 : 0)
                
                if isExpanded {
                    Text(answer)
                        .padding(.horizontal)
                        .font(.body)
                }
                Spacer()
            }
            .animation(.default, value: isExpanded)
        }
        .frame(height: isExpanded ? 300 : 70)
        .padding(.horizontal)
    }
}


struct ExpandableView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableView(question: "На чем основываются ваши рекомендации?", answer: "Рекомендации основываются на ответах на тест, после проанализированным с помощью искусственного интеллекта. Стоит относиться к советам с осторожностью, перед тем как следовать советам проконсультируйтесь с вашим врачом")
    }
}
