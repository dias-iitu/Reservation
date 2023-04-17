import Foundation
import FirebaseFirestore

struct MenuItem: Codable {
    let dishImage: String
    let dishName: String
    let dishPrice: Int
    let dishRating: Int
    
//    internal init(dishId: String = UUID().uuidString, dishImage: String, dishName: String, dishPrice: Int, dishRating: Int) {
//        self.dishId = dishId
//        self.dishImage = dishImage
//        self.dishName = dishName
//        self.dishPrice = dishPrice
//        self.dishRating = dishRating
//    }
//    
//    init(doc: QueryDocumentSnapshot) {
//        let data = doc.data()
//        let dishId = data["dishId"] as? String ?? ""
//        let dishImage = data["dishImage"] as? String ?? ""
//        let dishName = data["dishName"] as? String ?? ""
//        let dishPrice = data["dishPrice"] as? Int ?? 0
//        let dishRating = data["dishRating"] as? Int ?? 0
//        
//        self.dishId = dishId
//        self.dishImage = dishImage
//        self.dishName = dishName
//        self.dishPrice = dishPrice
//        self.dishRating = dishRating
//    }
    
    
}
