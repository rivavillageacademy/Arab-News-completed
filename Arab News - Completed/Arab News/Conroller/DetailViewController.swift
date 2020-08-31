//
//  DetailViewController.swift
//  Arab News
//
//  Created by Muhamed Alkhatib on 29/08/2020.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var urllink:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lable1.text=urllink
        
        if NSURL(string: urllink!) != nil {
        webView.load(NSURLRequest(url: NSURL(string: urllink!)! as URL) as URLRequest)
        } else {
            print ("URL not found")
        }
        
    }
    
    @IBOutlet weak var lable1: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    

}
