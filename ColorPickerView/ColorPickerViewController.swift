import Foundation
import UIKit
import instantiateViewController

let mainBundle = Bundle.main

//print("identifier: \(String(describing: mainBundle.bundleIdentifier))")

class ColorPickerViewController: UIViewController {

//  NSBundle *amazingBundle = [NSBundle bundleForClass:[self class]];
    
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
         pushloadingViewController()
    }
    
    private func pushloadingViewController() {
        print( mainBundle)
        print("identifier: \(String(describing: mainBundle.bundleIdentifier))")
        let const =  loadingController.secondviewcontroller.doSomething()
        print(const)
//       let bundle = Bundle(for: "com.oriserve.ColorPickerView")
//        let storyboard = UIStoryboard(name: "loading", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "loadingcontroller") as UIViewController
//       let vc = SecondViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        let vc : loadingController = loadingController()
//        self.present(vc, animated: true, completion: nil)
        

//            let vc : loadingController = loadingController()
//            print("vc is", vc)
//            self.present(vc, animated: true)
        
        
        let viewController = UIStoryboard(name: "loading", bundle: nil).instantiateViewController(withIdentifier: "loadingController")
        self.present(viewController, animated: false, completion: nil)
        
        
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        let loadingController :UIViewController = loadingController()
//        self.present(loadingController , animated: true, completion: nil)
        
        
//        NSBundle* bun = [NSBundle bundleWithIdentifier:"id"]
//        
//        UIStoryboard *storyboard = [UIStoryboard   storyboardWithName:@"StoryboardName"         bundle:bun];
        
                                //  SAFE PUSH
        
//  if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as? JunctionDetailsVC {
//  if let navigator = navigationController {
//  navigator.pushViewController(viewController, animated: true)
//            }
        
        
//    let storyboard = UIStoryboard(name: "loadingController", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "loadingController") as UIViewController
//   let vc = SecondViewController()
//    self.navigationController?.pushViewController(vc, animated: true)
//
//    let frameworkBundle = Bundle(identifier: "com.oriserve.instantiateViewController")
//    let storyboard = UIStoryboard(name: "loadingcontroller", bundle: frameworkBundle)
//    let vc = storyboard.instantiateViewController(withIdentifier: "loadingcontroller") as  UIViewController
//    let vc = SecondViewController()
//    self.navigationController?.pushViewController(vc, animated: true)
    }
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
}
