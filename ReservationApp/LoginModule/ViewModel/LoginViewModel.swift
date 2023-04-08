//
//  RegistrationViewModel.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 07.04.2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    
    func logInUser(email: String, password: String) {
        AuthService.shared.signIn(email: email, password: password) { result in
            switch result {
            case .success(let user):
                print("\(user)")
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}


