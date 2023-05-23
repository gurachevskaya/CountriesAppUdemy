import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CountryListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.countries, id: \.code) { country in
                    NavigationLink(
                        destination: CountryInfoView(country: country),
                        label: {
                        HStack {
                            Text(country.flagEmoji)
                            Text(country.name)
                        }
                    })
                }.listStyle(.plain)
            }
            .onAppear {
                viewModel.getAllCountries()
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
