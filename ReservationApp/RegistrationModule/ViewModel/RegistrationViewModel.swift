//
//  RegistrationViewModel.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 08.04.2023.
//

import Foundation
import FirebaseAuth

class RegistrationViewModel {

    func createNewUser(fullName: String, password: String, phoneNumber: String, email: String) {
        AuthService.shared.singUp(
            email: email,
            password: password,
            nameAndSurname: fullName,
            phoneNumber: phoneNumber) { result in
                switch result {
                case .success(let user):
                    print("\(user)")
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
    }
}
