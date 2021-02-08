//
//  ResultScreenViewController.swift
//  IMCCalculator
//
//  Created by Renato Mateus on 05/02/21.
//

import UIKit

class ResultScreenViewController: UIViewController {

    // MARK: Attributes
    
    var IMCValue: Float?
    var Name: String?
    var AgeValue: Float?
    
    //MARK: Fields
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelResultIMC: UILabel!
    
    
    // MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sIMCValue = NSString(format: "%.2f", IMCValue!)
        let sAgeValue = NSString(format: "%.0f", AgeValue!)
        
        labelName.text = "Hello \(Name!)! "
        labelAge.text = "\(sAgeValue) years"
        labelResultIMC.text = "\(sIMCValue)"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
