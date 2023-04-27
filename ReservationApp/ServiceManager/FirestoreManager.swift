import Foundation
import Firebase
import FirebaseFirestore
import UIKit

class FirestoreManager {
    
    static let shared = FirestoreManager()
    private init() { }
    
    private var categoriesRef: CollectionReference { Firestore.firestore().collection("Category")}
    private var allDishesRef: CollectionReference { Firestore.firestore().collection("AllDishes")}
    
    func getMenuData(completion: @escaping (Result<[MenuItem], Error>) -> ()) {
        Firestore.firestore().collection("AllDishes").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            var allDishesItem = [MenuItem]()
            documents.forEach { queryDocSnap in
                let data = queryDocSnap.data()
                let dishImage = data["dishImage"] as? String ?? ""
                let dishName = data["dishName"] as? String ?? ""
                let dishRating = data["dishRating"] as? Int ?? 0
                let dishPrice = data["dishPrice"] as? Int ?? 0
                
                let menuItem = MenuItem(dishImage: dishImage, dishName: dishName, dishPrice: dishPrice, dishRating: dishRating)
                
                allDishesItem.append(menuItem)
            }
            
            completion(.success(allDishesItem))
        }
    }
}
