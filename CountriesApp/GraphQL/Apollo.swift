import Apollo
import Foundation

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)
    
    private init() {}
    
}
