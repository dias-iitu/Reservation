//
//  FirestoreManager.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 11.04.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreManager {
    
    static let shared = FirestoreManager()
    private init() { }
    
    private var categoriesRef: CollectionReference { Firestore.firestore().collection("Category")}
    
    func fetchCategories(сompletion: @escaping (Result<[Category], Error>) -> () ) {
       
        self.categoriesRef.getDocuments { querySnapshot, error in
            guard let querySnapshot = querySnapshot else {
                if let error = error {
                    сompletion(.failure(error))
                }
                return
            }
            
            let docs = querySnapshot.documents
            var categories = [Category]()
            
            for doc in docs {
                guard let category = Category(doc: doc) else { return }
                categories.append(category)
            }
            print("---------BREAK\(categories)")
            сompletion(.success(categories))
        }
    }
}
