import Foundation
import FirebaseAuth
import UIKit

class AuthService {
    
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    private var currentUser: User? {
        return auth.currentUser
    }
    
    func singUp(email: String, password: String, nameAndSurname: String, phoneNumber: String, completion: @escaping (Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
