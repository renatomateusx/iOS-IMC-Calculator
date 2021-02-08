//
//  ViewController.swift
//  IMCCalculator
//
//  Created by Renato Mateus on 05/02/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Attributes
    var IMCValue: Float = 0.0
    var Name: String = ""
    var AgeValue: Float = 0.0
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var heightField: UITextField!
    
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doCalculate(_ sender: Any) {
        guard let _name = self.nameField.text, self.nameField.text?.isEmpty == false else{
            showAlert()
            return
        }
        guard let _height = self.heightField.text, self.heightField.text?.isEmpty == false else{
            showAlert()
            return
        }
        guard let _weight = self.weightField.text, self.weightField.text?.isEmpty == false else{
            showAlert()
            return
        }
        guard let _age = self.ageField.text, self.ageField.text?.isEmpty == false else{
            showAlert()
            return
        }
        
        // MARK: Converting
        
        let heightFloat = (_height as NSString).floatValue
        let weightFloat = (_weight as NSString).floatValue
        let ageFloat = (_age as NSString).floatValue
        
        IMCValue = ((weightFloat / (heightFloat * heightFloat)) * 100)
        print("VALOR IMC \(IMCValue)")
        Name = _name
        AgeValue = ageFloat
        
        self.performSegue(withIdentifier: "segueResultIMC", sender: nil)
        
    }
    

    @IBAction func btnClearFields(_ sender: Any) {
        nameField.text = nil
        heightField.text = nil
        weightField.text = nil
        ageField.text = nil
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Warning", message: "Fill all fields", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueResultIMC") {
            let resultScreen = segue.destination as? ResultScreenViewController
            resultScreen?.Name = self.Name
            resultScreen?.AgeValue = self.AgeValue
            resultScreen?.IMCValue = self.IMCValue
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.becomeFirstResponder()
    }
    
}

