import Foundation
import UIKit

class newFile: UIViewController {
    
    @IBOutlet var myWeb: UIWebView!
    @IBOutlet var Activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        print("In here")
        Activity.isHidden = false
        Activity.startAnimating()
        do
        {
            let testHTML = Bundle.main.path(forResource: "index", ofType: "html")
            let contents =  try NSString(contentsOfFile: testHTML!, encoding: String.Encoding.utf8.rawValue)
            let baseUrl = NSURL(fileURLWithPath: testHTML!) //for load css file
            
            myWeb.loadHTMLString(contents as String, baseURL: baseUrl as URL)
        }
        catch
        {
            
        }
    }
    
    @IBAction func ActionNew(_ sender: UIButton){
        print("new")
        Activity.isHidden = true
        
        Activity.stopAnimating()
    }
    
}
