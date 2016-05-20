//
//  ViewController.swift
//  LoginChallenge
//
//  Created by Antonio Radovcic on 18.05.16.
//  Copyright © 2016 Niorad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var emailCaptionLbl: UILabel!
    @IBOutlet weak var salutationLbl: UILabel!
    @IBOutlet weak var passwordCaptionLbl: UILabel!
    @IBOutlet weak var emailBorder: UIView!
    @IBOutlet weak var passwordBorder: UIView!
    @IBOutlet weak var emailSpinner: UIImageView!
    @IBOutlet weak var passwordSpinner: UIImageView!
    @IBOutlet weak var accessGrantedLbl: UILabel!
    @IBOutlet weak var creditsLbl: UILabel!
    
    var passwordEntryIsVisible = false
    var logoRotation: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideAllElements()
        emailInput.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        passwordInput.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)

        introduceTitle()
        introduceEmailEntry()
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.rotateLogo), userInfo: nil, repeats: true)
        
    }
    
    func hideAllElements() {
        appLogo.alpha = 0
        titleLbl.alpha = 0
        emailCaptionLbl.alpha = 0
        salutationLbl.alpha = 0
        passwordCaptionLbl.alpha = 0
        emailBorder.alpha = 0
        passwordBorder.alpha = 0
        emailInput.alpha = 0
        passwordInput.alpha = 0
        emailSpinner.alpha = 0
        accessGrantedLbl.alpha = 0
        passwordSpinner.alpha = 0
        creditsLbl.alpha = 0
    }

    
    func fadeOutAllButTitle() {
        
        UIView.animateWithDuration(1, delay: 0, options: .CurveEaseInOut, animations: {
            self.emailCaptionLbl.alpha = 0
            self.salutationLbl.alpha = 0
            self.passwordCaptionLbl.alpha = 0
            self.emailBorder.alpha = 0
            self.passwordBorder.alpha = 0
            self.emailInput.alpha = 0
            self.passwordInput.alpha = 0
            self.emailSpinner.alpha = 0
            self.passwordSpinner.alpha = 0
            self.accessGrantedLbl.alpha = 1
            }, completion: nil)
        
        
        let delay = 0.3 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            SfxService.instance.playSound(.Login)
        }


        UIView.animateWithDuration(0.5, delay: 2, options: .CurveEaseInOut, animations: {
            self.accessGrantedLbl.alpha = 1
            self.creditsLbl.alpha = 1
            }, completion: nil)

        
    }
    
    
    
    func introduceTitle() {
        
        self.appLogo.frame.origin.x -= 100
        
        let delay = 1.25 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            SfxService.instance.playSound(.Woosh)
        }

        
        UIView.animateWithDuration(1, delay: 1, options: [.CurveEaseOut, .BeginFromCurrentState], animations: {
            self.appLogo.frame.origin.x += 100
            self.appLogo.alpha = 1
            }, completion: {
                (finished: Bool) in
                UIView.animateWithDuration(1, delay: 0, options: .CurveEaseOut, animations: {
                    self.titleLbl.alpha = 1
                    }, completion:nil)})
    }
    
    func rotateLogo() {
        self.logoRotation += 0.02
        appLogo.transform = CGAffineTransformMakeRotation(self.logoRotation)
    }
    
    
    
    func moveTitleDown() {
        
        self.appLogo.frame.origin.x = 0
        
        UIView.animateWithDuration(1, delay: 0.5, options: .CurveEaseOut, animations: {
            self.appLogo.frame.origin.x += 2000
            self.appLogo.transform = CGAffineTransformMakeRotation(3)
            self.titleLbl.alpha = 0
            }, completion:nil)
        
    }

    
    func spinSpinner(spinner: UIImageView) {
        UIView.animateWithDuration(2, delay: 0, options: .CurveEaseOut, animations: {
            spinner.transform = CGAffineTransformMakeRotation(3)
            spinner.alpha = 1
            }, completion: {
                (finished: Bool) in
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                    spinner.transform = CGAffineTransformMakeRotation(1)
                    spinner.alpha = 0
                    }, completion:nil)})
    }
    
    func introduceEmailEntry() {
        self.emailCaptionLbl.frame.origin.y -= 50


        UIView.animateWithDuration(1, delay: 3, options: .CurveEaseOut, animations: {
            self.emailCaptionLbl.frame.origin.y += 50
            self.emailCaptionLbl.alpha = 1
            }, completion: {
                (finished: Bool) in
                UIView.animateWithDuration(1, delay: 0, options: .CurveEaseOut, animations: {
                        self.emailInput.alpha = 1
                        self.emailBorder.alpha = 1
                    }, completion:{
                        (finished: Bool) in
                        self.emailInput.becomeFirstResponder()
                })})

    }

    
    func introducePasswordEntry() {
        self.passwordCaptionLbl.frame.origin.y -= 50
        self.salutationLbl.frame.origin.y -= 50
        self.passwordInput.text = ""
        spinSpinner(self.emailSpinner)
        
        SfxService.instance.playSound(.Affirm)
        
        let delay = 2 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            SfxService.instance.playSound(.Woosh)
        }


        UIView.animateWithDuration(1, delay: 2, options: .CurveEaseOut, animations: {
            self.salutationLbl.frame.origin.y += 50
            self.salutationLbl.alpha = 1
            }, completion: nil)

        
        
        UIView.animateWithDuration(1, delay: 3, options: .CurveEaseOut, animations: {
            self.passwordCaptionLbl.frame.origin.y += 50
            self.passwordCaptionLbl.alpha = 1
            }, completion: {
                (finished: Bool) in
                UIView.animateWithDuration(1, delay: 0, options: .CurveEaseOut, animations: {
                    self.passwordInput.alpha = 1
                    self.passwordBorder.alpha = 1
                    }, completion: {
                        (finished: Bool) in
                        self.passwordInput.becomeFirstResponder()
                })})
    }
    
    func hidePasswordEntry() {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: {
            self.salutationLbl.alpha = 0
            self.passwordCaptionLbl.alpha = 0
            self.passwordBorder.alpha = 0
            self.passwordInput.alpha = 0
            }, completion: nil)
    }
    

    func defocusFromEmailInput() {
        self.emailInput.resignFirstResponder()
    }
    
    
    @IBAction func onTextChanged(sender: UITextField) {
        if let currentText = sender.text {
            if(isValidEmail(currentText) && passwordEntryIsVisible == false) {
                introducePasswordEntry()
                defocusFromEmailInput()
                passwordEntryIsVisible = true
            } else {
                if(passwordEntryIsVisible == true) {
                    hidePasswordEntry()
                    passwordEntryIsVisible = false
                }
            }
        }
    }
    
    
    @IBAction func onPasswordChanged(sender: UITextField) {
        if let currentText = sender.text {
            if currentText.characters.count >= 8 {
                sender.resignFirstResponder()
                spinSpinner(passwordSpinner)

                let delay1 = 0.5 * Double(NSEC_PER_SEC)
                let time1 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay1))
                dispatch_after(time1, dispatch_get_main_queue()) {
                    SfxService.instance.playSound(.Affirm)
                }

                let delay2 = 2 * Double(NSEC_PER_SEC)
                let time2 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay2))
                dispatch_after(time2, dispatch_get_main_queue()) {
                    self.fadeOutAllButTitle()
                }
            }
        }
    }
    
    
    
}



func isValidEmail(email: String) -> Bool {
    
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return emailTest.evaluateWithObject(email)
}

