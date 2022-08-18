//
//  ProfileSetupViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 30/06/22.
//

import AuthenticationServices
import JWTDecode
import UIKit

class ProfileSetupViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var loginProviderStackView: UIButton!

    private let cloudKitService = CloudKitService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginProviderStackView.layer.cornerRadius = 20
        titleLabel.font = .rounded(ofSize: 24, weight: .semibold)
        loginLabel.font = .rounded(ofSize: 17, weight: .regular)
        skipButton.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        performExistingAccountSetupFlows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // - Tag: perform_appleid_password_request
    /// Prompts the user if an existing iCloud Keychain credential or Apple ID credential is found.
    func performExistingAccountSetupFlows() {
        // Prepare requests for both Apple ID and password providers.
        let requests = [ASAuthorizationAppleIDProvider().createRequest(),
                        ASAuthorizationPasswordProvider().createRequest()]
        
        // Create an authorization controller with the given requests.
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    /// - Tag: perform_appleid_request
    @IBAction func didTapSignInButton() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    @IBAction func btnSkip(_ sender: Any) {
        let nextContactController = ContactViewController()
        self.navigationController?.pushViewController(nextContactController, animated: true)
    }
    
}

extension ProfileSetupViewController: ASAuthorizationControllerDelegate {
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    switch authorization.credential {
    case let appleIDCredential as ASAuthorizationAppleIDCredential:
      if let _ = appleIDCredential.email, let _ = appleIDCredential.fullName {
        registerNewAccount(credential: appleIDCredential)
      } else {
        print("Existing Account...")
        signInWithExistingAccount(credential: appleIDCredential)
      }
    default:
      break
    }
  }

  private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
    if let identityTokenData = credential.identityToken, let identityTokenString = String(data: identityTokenData, encoding: .utf8) {
      SessionManager.shared.setLoggedIn()

      let decodedToken = try? decode(jwt: identityTokenString)
      let userId = decodedToken?.idUser ?? ""

      let name = displayName(name: credential.fullName!)
      let appleId = credential.email!
      let nextContactController = ContactViewController()
      nextContactController.identityTokenString = identityTokenString
      nextContactController.appleId = appleId
      nextContactController.userId = userId
      nextContactController.name = name
      self.navigationController?.pushViewController(nextContactController, animated: true)
    }
  }

  private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
    if let identityTokenData = credential.identityToken, let identityTokenString = String(data: identityTokenData, encoding: .utf8) {
      let decodedToken = try? decode(jwt: identityTokenString)
      let userId = decodedToken?.idUser ?? ""
      cloudKitService.fetchAllAccount(filterBy: userId) { accounts in
        if let account = accounts.first {
          SessionManager.shared.setLoggedIn()
          SessionManager.shared.setRecordId(with: account.recordId.recordName)
          SessionManager.shared.setPersonalNote(with: account.notes)

          DispatchQueue.main.async {
            let nextViewController = MainViewController()
            self.view.window?.rootViewController = nextViewController
          }
        } else {
          print("User not found...")
        }
      }
    }
  }

  /// - Parameter style: The `PersonNameComponentsFormatter.Style` to use for the display.
  private func displayName(name: PersonNameComponents, style: PersonNameComponentsFormatter.Style = .default) -> String {
    PersonNameComponentsFormatter.localizedString(from: name, style: style)
  }

  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    print("Error: \(error.localizedDescription)")
  }
}

extension ProfileSetupViewController: ASAuthorizationControllerPresentationContextProviding {
    /// - Tag: provide_presentation_anchor
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
