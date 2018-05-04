//
//  WebSiteViewController.swift
//  JBrechonTopTenShanghai
//
//Name/Author: John Brechon
//Z-ID: Z1750010
//CSCI 321/521, Spring 2018
//Activity: Midterm

import UIKit
import WebKit

        //going to the website view of each of the items
class WebSiteViewController: UIViewController {

    @IBOutlet weak var webSite: WKWebView!
    
    var dtvWebSite:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: dtvWebSite)
        
        let urlRequest = URLRequest(url: myURL!)
        
        webSite.load(urlRequest)
        
    }
}
