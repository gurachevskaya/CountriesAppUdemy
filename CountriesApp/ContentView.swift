import SwiftUI
import CountriesAPI

struct ContentView: View {
    @State private var countries: [CountriesAPI.GetAllCountriesQuery.Data.Country] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(countries, id: \.code) { country in
                    HStack {
                        Text(country.emoji)
                        Text(country.name)
                    }
                }.listStyle(.plain)
            }
            .onAppear {
                Network.shared.apollo.fetch(query: GetAllCountriesQuery()) { result in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let result):
                        if let countries = result.data?.countries {
                            DispatchQueue.main.async {
                                self.countries = countries
                            }
                        }
                    }
                }
            }
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
