import Foundation

class AppointmentViewModel: ObservableObject {
    private let provider = API.provider
    @Published var doctors = [Doctor]()
    
    func getDoctors() {
        provider.request(.getDoctors) { result in
            switch result {
            case let .success(response):
                do {
                    let getDoctorsResponse = try response.map(GetDoctorsResponse.self)
                    self.doctors = getDoctorsResponse.doctors
                    print(self.doctors)
                } catch {
                    // Handle decoding error
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

struct GetDoctorsResponse: Codable {
    let doctors: [Doctor]
}
