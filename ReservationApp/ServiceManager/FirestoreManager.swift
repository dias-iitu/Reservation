//
//  FirestoreManager.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 11.04.2023.
//

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
            
            
            
//            for doc in docs {
//                let allDishes = MenuItem(doc: doc)
//                allDishesItem.append(allDishes)
//            }
            
 //           completion(.success(allDishesItem))
        }
    }
    
//    func getAllDishes(completion: @escaping (Result<[MenuItem], Error>) -> ()) {
//        self.allDishesRef.getDocuments { querySnapshot, error in
//            guard let querySnapshot = querySnapshot else {
//                if let error = error {
//                    completion(.failure(error))
//                }
//                return
//            }
//
//            let docs = querySnapshot.documents
//            var allDishesItem = [MenuItem]()
//
//            for doc in docs {
//                let allDishes = MenuItem(doc: doc)
//                allDishesItem.append(allDishes)
//            }
//
//            completion(.success(allDishesItem))
//        }
//    }
//    func fetchCategories(сompletion: @escaping (Result<[ImageName], Error>) -> () ) {
//
//        self.categoriesRef.getDocuments { querySnapshot, error in
//            guard let querySnapshot = querySnapshot else {
//                if let error = error {
//                    сompletion(.failure(error))
//                }
//                return
//            }
//
//            let docs = querySnapshot.documents
//            var categories = [ImageName]()
//
//            for doc in docs {
//                guard let category = ImageName(doc: doc) else { return }
//                categories.append(category)
//            }
//            print("---------BREAK\(categories)")
//            сompletion(.success(categories))
//        }
//    }
}
