//
//  AboutAppViewController.swift
//  JBrechonTopTenShanghai
//
//Name/Author: John Brechon
//Z-ID: Z1750010
//CSCI 321/521, Spring 2018
//Activity: Midterm

import UIKit

class AboutAppViewController: UIViewController {

    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
            //this runs to the author view
    @IBAction func aboutAuthorButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AboutAuthorViewController") as! AboutAuthorViewController
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "About App"
    }
}
