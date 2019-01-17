import Foundation
import UIKit

class ChatbotViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var ChatbotWebview: UIWebView!
    @IBOutlet var Activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
       ChatbotWebview.delegate = self //For mywebDidFinishLoad to be called
        print("In here")
        Activity.isHidden = false
        Activity.startAnimating()
        do
        {
            let testHTML = Bundle.main.path(forResource: "index", ofType: "html")
            let contents =  try NSString(contentsOfFile: testHTML!, encoding: String.Encoding.utf8.rawValue)
            let baseUrl = NSURL(fileURLWithPath: testHTML!) //for load css file
            
            ChatbotWebview.loadHTMLString(contents as String, baseURL: baseUrl as URL)
        }
        catch
        {
            print("Not found")
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
            print("when webview starts loading")
            Activity.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("when webview finish loading")
            Activity.stopAnimating()
            Activity.isHidden = true
        let htmlTitle = ChatbotWebview.stringByEvaluatingJavaScript(from: "someFunction();");
        //    let htmlTitle = ChatbotWebview.stringByEvaluatingJavaScript(from: "document.title.innerHTML");
        
        
        //   if let returnedString = ChatbotWebview.stringByEvaluatingJavaScript(from: "") {
        //     print("the result is \(returnedString)")
        //  }
        
        
        let filePath = Bundle.main.path(forResource: "javascript", ofType: "js")
        do {
            let jsContent = try String.init(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
//            print(jsContent)
           ChatbotWebview.stringByEvaluatingJavaScript(from: jsContent)
        }
        catch let error as NSError{
            print(error.debugDescription)
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Error occured")
    }
}
