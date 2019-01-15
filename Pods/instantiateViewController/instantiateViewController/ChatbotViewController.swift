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
    
    func myWebDidStartLoad(ChatbotWebview : UIWebView) {
        //UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        print("when webview starts loading")
        Activity.startAnimating()
    }
    
    func myWebDidFinishLoad(ChatbotWebview : UIWebView) {
        //UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        print("when webview finish loading")
        Activity.stopAnimating()
        Activity.isHidden = true
    }
//
//    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebView.NavigationType) -> Bool {
//
//        return true
//    }
    
    //    func myWeb(myWeb: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebView.NavigationType) -> Bool {
    ////        myWeb.stringByEvaluatingJavaScriptFromString("something = 42")
    //        myWeb.stringByEvaluatingJavaScript(from: <#T##String#>)
    //    }

    
//    func myWeb(_ChatbotWebview: UIWebView, didFailLoadWithError error: Error)
//    {
//        print("failed to load")
//    }
    
}
