import Foundation
import FirebaseStorage

class StorageManager {
    
    static let shared = StorageManager()
    private init() {}
    
    private let storage = Storage.storage().reference(forURL: "gs://reservation-be.appspot.com")
    //private var menuRef: StorageReference { storage.child("AllDishes")}
    
    func downloadMenuImage(imageData: Data) {
        
        storage.downloadURL { url, error in
            guard let imageUrl = url else { return }
            guard let data = try? Data(contentsOf: imageUrl) else { return }
            
        }
    }
}
