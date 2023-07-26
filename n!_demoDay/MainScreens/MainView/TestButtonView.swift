import SwiftUI

struct TestButtonView: View {
    var type: TestType
    var image: String {
        switch type {
        case .short:
            return "shortTestImage"
        case .man:
            return "manTestImage"
        case .woman:
            return "womanTestImage"
        case .child:
            return "childTestImage"
        }
    }
    var color: Color {
        switch type {
        case .short:
            return .customGreen
        case .man:
            return .customLightBlue
        case .woman:
            return .customPink
        case .child:
            return .customOrange
        }
    }
    var text: String {
        switch type {
        case .short:
            return "короткий тест"
        case .man:
            return "тест для мужчин"
        case .woman:
            return "тест для женщин"
        case .child:
            return "тест для детей"
        }
    }
    
    var width: CGFloat {
        switch type {
        case .short, .child:
            return 120
        case .man, .woman:
            return 210
        }
    }
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: width, height: 140)
                .foregroundColor(color)
                
            
//            HStack {
//                Image(image)
//                    .resizable()
//                    .clipShape(RoundedRectangle(cornerRadius: 16)) // Clip the image to the rounded rectangle shape
//                    .frame(width: width * 0.6, height: 130)
//                    .clipped()
//                    .opacity(0.6)
//                Spacer()
//            }
//            .padding()
            VStack {
                Text(text)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: width , height: 60)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
        }
        .frame(width: width, height: 140)
        .padding(4)
    }
}

struct TestButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            HStack{
                TestButtonView(type: .man)
                TestButtonView(type: .child)
                
            }
            HStack{
                TestButtonView(type: .short)
                TestButtonView(type: .woman)
                
            }
        }
    }
}
