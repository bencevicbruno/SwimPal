//
//  AuthorizationService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

final class AuthorizationService: AuthorizationServiceProtocol {
    
    var onError: ErrorCallback?
    
    var userData: UserData!
    
    func login(onSuccess: ((UserData) -> Void)? = nil) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        guard let topMostViewController = UIApplication.topMostViewController else { return }
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: topMostViewController) { [weak self] user, error in
            if let error = error {
                self?.onError?(error)
                return
            }
            
            guard let user = user,
                  let idToken = user.authentication.idToken,
                  let profileData = user.profile else {
                self?.onError?(AuthorizationServiceError.missingUserData)
                return
            }
            
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.authentication.accessToken)
            
            self?.userData = UserData(
                id: user.userID ?? "",
                name: profileData.name,
                email: profileData.email,
                avatarURL: profileData.imageURL(withDimension: UInt(UIScreen.width / 4)))
            self?.firebaseSignin(credential: credential, onSuccess: onSuccess)
        }
    }
    
    private func firebaseSignin(credential: AuthCredential, onSuccess: ((UserData) -> Void)? = nil) {
        Auth.auth().signIn(with: credential) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                self.onError?(error)
            }
            
            onSuccess?(self.userData)
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch(let error) {
            onError?(error)
        }
        
        GIDSignIn.sharedInstance.signOut()
    }
}
