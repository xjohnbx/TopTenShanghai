//
//  AboutAuthorViewController.swift
//  JBrechonTopTenShanghai
//
//Name/Author: John Brechon
//Z-ID: Z1750010
//CSCI 321/521, Spring 2018
//Activity: Midterm

import UIKit
import WebKit

        //loading the html file
class AboutAuthorViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "index", ofType: "html")!
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let html = NSString(data: data, encoding:String.Encoding.utf8.rawValue)
        
        self.webView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)
    }
}
