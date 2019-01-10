//
//  trial.swift
//  instantiateViewController
//
//  Created by Shama Ahlawat on 10/01/19.
//

import Foundation
import UIKit

class trialFile : UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        print("hello")
        do
        {
            let testHTML = Bundle.main.path(forResource: "index", ofType: "html")
            let contents =  try NSString(contentsOfFile: testHTML!, encoding: String.Encoding.utf8.rawValue)
            let baseUrl = NSURL(fileURLWithPath: testHTML!) //for load css file
            
           webview.loadHTMLString(contents as String, baseURL: baseUrl as URL)
        }
        catch
        {
            
        }
    }
}

