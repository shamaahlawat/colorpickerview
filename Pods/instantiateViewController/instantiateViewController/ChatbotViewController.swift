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
        
        let obj = "{\"psid\": \"ori-40\"}"

        
        var newpsid = "\(getPSID())"
        
        savePSID(psid : "newpsid");
        
        let obj1 = "{\"psid\" : \(newpsid) }"
//        let str = String(myobj)
        print("obj1 will be",obj1)
        
        ChatbotWebview.stringByEvaluatingJavaScript(from: "window.androidObj.updateFromAndroid(\'android\',\'\');");
        ChatbotWebview.stringByEvaluatingJavaScript(from :"window.androidObj.updateFromAndroid(\'psid\',\'"+obj1+"\');");
        
//
//        let dataString = String()
//        let json = JSONSerialization.jsonObject(with: obj, options: .mutableContainers)
        
        //Getting text from webview
        textFromWeb(obj: "{\"psid\": \"ori\"}")
        s4()
//        JSONObject json = new JSONObject();
        let uuid = UUID().uuidString
        print("uuid will be ===>>>> ",uuid)
        
//        let restoredpsid = UserDefaults.integer(forKey: "vc_number")
//        var storedVcNumber = UserDefaults.standard.object(forKey: "vc_number")
//        print("return value will be ==>> ",storedVcNumber)
        

    }
    
    func textFromWeb (obj:String){
        print("text from web is ",obj)
    }
    
    func getPSID() -> String {
        var psid = guid()
        return "\(psid)"
        print("psid is",psid)
    }
    
    func guid() -> String {
        var Timestamp: String {
            return "\(NSDate())"
        }
        print("Timestamp: \(Timestamp)")
        
        func getCurrentMillis()-> String {
            return String(Int(Date().timeIntervalSince1970*1000))
        }
        
        var currentTime = getCurrentMillis()
        print("millisec time will be ",currentTime)

        var rand = String(arc4random() % 9000 + 1000)
        let uuid = UUID().uuidString
        let uuidString = UUID().uuidString.replacingOccurrences(of: "-", with: "")
//        return (rand + currentTime)
//        return "1234-56"
        
//        return rand + currentTime;
//        return "\(rand)-\(currentTime)"
//         return "123"
         return "23"
        
        var storedpsid = UserDefaults.standard.integer(forKey: "psid")
        print("stored psid will be ==>> ", storedpsid)
        
//        UserDefaults.standard.set(newpsid, forKey: "psid")
    }
    
    func savePSID(psid:String) -> String {
//         UserDefaults.standard.set(psid, forKey: "storedpsid")
        return ""
    }
    
    func s4(){
        var rand = Int(arc4random() % 9000 + 1000)
//        return rand
        print(rand)
        
        var Timestamp: String {
            return "\(NSDate())"
        }
        print("Timestamp: \(Timestamp)")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Error occured")
    }
}
