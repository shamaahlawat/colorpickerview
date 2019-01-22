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
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
            ChatbotWebview.stopLoading()
            ChatbotWebview.removeFromSuperview()
            ChatbotWebview = nil
        
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            if let cookies = HTTPCookieStorage.shared.cookies {
                for cookie in cookies {
                    HTTPCookieStorage.shared.deleteCookie(cookie)
                }
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
        let htmlTitle = ChatbotWebview.stringByEvaluatingJavaScript(from: "window.pageYOffset;");
        print(htmlTitle)
    
          injectJavaScriptFunction()
    }
    
    private func injectJavaScriptFunction() {
        print("injecting javascript")
        
        let obj = "{\"psid\": \"ori\"}"
        
        ChatbotWebview.stringByEvaluatingJavaScript(from: "window.androidObj.updateFromAndroid(\'android\',\'\');");
        ChatbotWebview.stringByEvaluatingJavaScript(from :"window.androidObj.updateFromAndroid(\'psid\',\'"+obj+"\');");
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Error occured")
    }
}
