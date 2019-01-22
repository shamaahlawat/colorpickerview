import Foundation
import UIKit
import instantiateViewController

let mainBundle = Bundle.main
//print("identifier: \(String(describing: mainBundle.bundleIdentifier))")

class ColorPickerViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    
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
    
    @IBAction func didTaploadWebviewButtonPressed(_ sender: UIButton) {
//        pushwebViewController()
    }
    
    @IBAction func didTapTestButton(_ sender: UIButton) {
        pushTestController()
}
    
    private func  pushTestController() {
        var vcnumber = userTextField.text
        print("vc_number is",vcnumber)
        
        
        UserDefaults.standard.set(userTextField.text, forKey: "vc_number")
        
        vc_number.text = userTextField.text
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
  
    
//    private func pushwebViewController() {
//        print( mainBundle)
//        print("identifier: \(String(describing: mainBundle.bundleIdentifier))")
//        let const =  webviewController.doSomething()
//        print(const)
//
////      let webViewController = JXWebViewController()
////      webViewController.webView.load(URLRequest(url: url))
//        let viewController = UIStoryboard(name: "webview", bundle: nil).instantiateViewController(withIdentifier: "webviewController")
//        self.present(viewController, animated: false, completion: nil)
//    }
//
//    private func pushloadingViewController() {
//        print( mainBundle)
//        print("identifier: \(String(describing: mainBundle.bundleIdentifier))")
//        let const =  loadingController.secondviewcontroller.doSomething()
//        print(const)
////       let bundle = Bundle(for: "com.oriserve.ColorPickerView")
////        let storyboard = UIStoryboard(name: "loading", bundle: nil)
////        let vc = storyboard.instantiateViewController(withIdentifier: "loadingcontroller") as UIViewController
////       let vc = SecondViewController()
////        self.navigationController?.pushViewController(vc, animated: true)
//
////        let vc : loadingController = loadingController()
////        self.present(vc, animated: true, completion: nil)
//
//
////            let vc : loadingController = loadingController()
////            print("vc is", vc)
////            self.present(vc, animated: true)
//        let viewController = UIStoryboard(name: "loading", bundle: nil).instantiateViewController(withIdentifier: "loadingController")
////        self.present(viewController, animated: false, completion: nil)
//        self.navigationController?.pushViewController(viewController, animated: true)
////        self.navigationController?.pushViewController(vc, animated: true)
//
////        let loadingController :UIViewController = loadingController()
////        self.present(loadingController , animated: true, completion: nil)
//
//
////        NSBundle* bun = [NSBundle bundleWithIdentifier:"id"]
////
////        UIStoryboard *storyboard = [UIStoryboard   storyboardWithName:@"StoryboardName"         bundle:bun];
//
//                                //  SAFE PUSH
//
////  if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as? JunctionDetailsVC {
////  if let navigator = navigationController {
////  navigator.pushViewController(viewController, animated: true)
////            }
//
//
////    let storyboard = UIStoryboard(name: "loadingController", bundle: nil)
////    let vc = storyboard.instantiateViewController(withIdentifier: "loadingController") as UIViewController
////   let vc = SecondViewController()
////    self.navigationController?.pushViewController(vc, animated: true)
////
////    let frameworkBundle = Bundle(identifier: "com.oriserve.instantiateViewController")
////    let storyboard = UIStoryboard(name: "loadingcontroller", bundle: frameworkBundle)
////    let vc = storyboard.instantiateViewController(withIdentifier: "loadingcontroller") as  UIViewController
////    let vc = SecondViewController()
////    self.navigationController?.pushViewController(vc, animated: true)
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
