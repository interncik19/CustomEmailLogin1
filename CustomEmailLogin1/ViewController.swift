//
//  ViewController.swift
//  CustomEmailLogin1
//
//  Created by Trinidad Garcia on 19/05/18.
//  Copyright © 2018 Trinidad Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn
        if isSignIn{
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }else{
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if let email = textFieldEmail.text, let pass = textFieldPassword.text{
        
        if isSignIn{
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                if let u =  user{
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                }else{
                    
                }
            }

        }else{
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let u =  user{
                     self.performSegue(withIdentifier: "goToHome", sender: self)
                }else{
                    
                }
            }

        }
      }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
    }
}












