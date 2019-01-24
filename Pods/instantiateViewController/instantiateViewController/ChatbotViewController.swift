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
        
//        let newpsid =  "\(getPSID())"
//        print("newpsid will be",newpsid)
        let obj1 = "{\"psid\" : \(getPSID()) }"
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
//          getPSID()
//        let currentTime = Date().toMillis()
//        print("current time will be",currentTime)
        
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
//        String timeStamp = new SimpleDateFormat("yyyyMMdd-HHmmss",
//        Locale.getDefault()).format(new Date());
        var Timestamp: String {
            return "\(NSDate())"
        }
        print("Timestamp: \(Timestamp)")
        
        func getCurrentMillis()-> String {
            return String(Date().timeIntervalSince1970 * 1000)
        }
        
        var currentTime = getCurrentMillis()
        print("millisec time will be ",currentTime)

        
        var rand = String(arc4random() % 9000 + 1000)
//        var time = String (10)
        
        return rand + currentTime;
        
//        return "and-"+s4() + "-" +  s4() + "-"+s4() + "-" + CVtimeStamp;
    }
    
    func s4(){
//    var d = (Math.floor((1 + Math.random()) * 0x10000));
//    return Integer.toString(d).substring(1);
//        let rand = Int(arc4random_uniform(10))
        
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
