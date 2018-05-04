//
//  DetailViewController.swift
//  JBrechonTopTenShanghai
//
//Name/Author: John Brechon
//Z-ID: Z1750010
//CSCI 321/521, Spring 2018
//Activity: Midterm

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var shanghaiName: UILabel!
    @IBOutlet weak var shanghaiImage: UIImageView!
    @IBOutlet weak var shanghaiAddress: UITextView!
    @IBOutlet weak var shanghaiPhone: UILabel!
    @IBOutlet weak var shanghaiHours: UILabel!
    @IBOutlet weak var shanghaiDescription: UITextView!
    
    var tvName: String!
    var tvImage: String!
    var tvAddress: String!
    var tvPhone: String!
    var tvHours: String!
    var tvDescription: String!
    var tvWebSite: String!
    var tvLat: String!
    var tvLong: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shanghaiName.text = tvName
        shanghaiImage.image = UIImage(named: tvImage)
        shanghaiAddress.text = tvAddress
        shanghaiPhone.text = tvPhone
        shanghaiHours.text = tvHours
        shanghaiDescription.text = tvDescription
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "WWW") {
            let destVC = segue.destination as! WebSiteViewController
            destVC.navigationItem.title = tvName
            destVC.dtvWebSite = tvWebSite
        }
            
        else if(segue.identifier == "MAP") {
            let destVM = segue.destination as! MapViewController
            destVM.navigationItem.title = tvName
            destVM.dtvLat = tvLat
            destVM.dtvLong = tvLong
        }
    }
}
