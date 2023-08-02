import SwiftUI

struct AppInfoSettingsView: View {
    var body: some View {
        NavigationView{
            VStack {
                List {
                    Link("Условия и положения", destination: URL(string: "https://doc-hosting.flycricket.io/sau-bol-terms-of-use/85bc3c38-c7a0-419b-ae39-95b184d50f0f/terms")!)
                        .padding()
                    Link("Политика конфиденциальности", destination: URL(string: "https://doc-hosting.flycricket.io/sau-bol-privacy-policy/364f2b0e-dea2-4a56-98f8-b7cfc31ca131/privacy")!)
                        .padding()
                }
                .listStyle(.plain)
                .background(.white)
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonTitleHidden()
    }
        
}

struct AppInfoSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoSettingsView()
    }
}
