import Foundation
import UIKit
import instantiateViewController

let mainBundle = Bundle.main
//print("identifier: \(String(describing: mainBundle.bundleIdentifier))")

class ColorPickerViewController: UIViewController {
    
//    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var enter_vc_number: UITextField!
    @IBOutlet weak var vc_number: UILabel!
    @IBAction func didTapRedButton(_ sender: Any) {
        pushViewController(title: "Red", color: UIColor.red)
    }
    
    @IBAction func didTapBlueButton(_ sender: Any) {
        pushViewController(title: "Blue", color: UIColor.blue)
    }
    
    @IBAction func didTapNewView(_ sender: UIButton) {
        pushNewViewController(title: "Blue", color: UIColor.blue)
    }
    
    @IBAction func didTapFrameworkStoryboardButton(_ sender: UIButton) {
//      pushloadingViewController()
    }
    
    @IBAction func didTapTestButton(_ sender: UIButton) {
        pushTestController()
}
    
    private func  pushTestController() {
        var vcnumber = enter_vc_number.text
        print("vc_number is",vcnumber)
        
        
        UserDefaults.standard.set(enter_vc_number.text, forKey: "vc_number")
        
        vc_number.text = enter_vc_number.text
        let storyboard = UIStoryboard(name: "ChatbotWebview", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatbotViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        let sharedPref = UserDefaults.standard
        print(sharedPref)
    }
    
//    private func  pushTestController() {
//        let storyboard = UIStoryboard(name: "test", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "newFile") as UIViewController
//        //   let vc = SecondViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
  
    private func pushNewViewController(title: String, color: UIColor) {
        let storyboard = UIStoryboard(name: "secondview", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as UIViewController
   //   let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func pushViewController(title: String, color: UIColor) {
        let vc = UIViewController()
        vc.view.backgroundColor = color
        vc.title = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // Storing vc_number permanently, presenting it even if user close the app
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "vc_number") as? String {
            vc_number.text = x
        }
    }
}
