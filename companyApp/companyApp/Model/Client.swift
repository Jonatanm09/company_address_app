
import  UIKit
struct Client {
    var id: UUID
    var name: String
    var address: [String]
    
    init() {
        id = UUID()
        name = ""
        address = []
    }
    
}
