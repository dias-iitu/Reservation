//
//  Category.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 11.04.2023.
//

import Foundation
import FirebaseFirestore

struct Category: Codable {
    let imageName: String
    
    internal init(imageName: String) {
        self.imageName = imageName
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        let imageName = data["imageName"] as? String ?? ""
        
        self.imageName = imageName
    }
}
