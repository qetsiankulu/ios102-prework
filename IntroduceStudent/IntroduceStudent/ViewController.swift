//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Qetsia Nkulu  on 12/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var introduceSelfButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // RGB values for my UCLA colors
        let redUclaBlue: CGFloat = 56.0 / 255.0
        let greenUclaBlue: CGFloat = 126.0 / 255.0
        let blueUclaBlue: CGFloat = 187.0 / 255.0
        
        let redUclaYellow: CGFloat = 229 / 255.0
        let greenUclaYellow: CGFloat = 184.0 / 255.0
        let blueUclaYellow : CGFloat = 87.0 / 255.0
        
        // custom color for button background
        let uclaBlue = UIColor(red: redUclaBlue, green: greenUclaBlue, blue: blueUclaBlue, alpha: 1.0)
        let uclaYellow = UIColor(red: redUclaYellow, green: greenUclaYellow, blue: blueUclaYellow, alpha: 1.0)
        
        // Change button background color
        introduceSelfButton.backgroundColor = uclaBlue
             
        // Change button text color
        introduceSelfButton.setTitleColor(uclaYellow, for: .normal)
        
        // Make the button rounded
        introduceSelfButton.layer.cornerRadius = 10.0
        introduceSelfButton.clipsToBounds = true
        
    }
    
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
        
    }
    
    // helper function for the "Introduce Self" button tap
    func createIntroduction() -> String {
        
    // Use optional binding to safely unwrap the optionals
    guard let firstName = firstNameTextField.text,
       let lastName = lastNameTextField.text,
       let schoolName = schoolNameTextField.text,
       let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex),
       let numberOfPets = numberOfPetsLabel.text else {
        
        // handle the case where some optionals are nil
        return "some of the required values are nil"
    }
    
    
    // all optionals successfully unwrapped to non-nil values
    //  The introduction receives the values from the outlet connections
    let introduction = "My name is \(firstName) \(lastName) and I attend \(schoolName). I am currently in my \(year) year and I own \(numberOfPets) pets. It is \(morePetsSwitch.isOn) that I want more pets."
    
        
    // debugging: check that the introduction prints correctly after user inputs
    print(introduction)
    
    return introduction

}
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        
        let introduction = createIntroduction()
        
        // create an alert to pass in our introduction as the alert message
        let alertControlller = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert )
        
        // a way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // passing the action to the alert controller so it can be dismissed
        alertControlller.addAction(action)
        
        present(alertControlller, animated: true, completion: nil)
    
    }
    
}
