//
//  ShanghaiViewController.swift
//  JBrechonTopTenShanghai
//
//Name/Author: John Brechon
//Z-ID: Z1750010
//CSCI 321/521, Spring 2018
//Activity: Midterm

import UIKit

class ShanghaiViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

            //create an object for each type of plist
    var shanghaiAttractions = [Shanghai]()
    var shanghaiHotels = [Shanghai]()
    var shanghaiRestaurants = [Shanghai]()
    
        //segmented control variables
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.rowHeight = 100
        
            //add info button
        addRightNavigationBarInfoButton()
        
            //intital view of attractions
        readPropertyList(tab: 1)
        
    }

        //this function adds the info light button on the navigation bar
    func addRightNavigationBarInfoButton() {
        let button = UIButton(type: .infoDark)
        button.addTarget(self, action: #selector(self.showAboutAppView), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
        //This sends the control to the about app view controller
    @objc func showAboutAppView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AboutAppNavigationController") as! UINavigationController
        
        self.present(controller, animated: true, completion: nil)
    }
    
            //The segmented control function that updates when the value changes
    @IBAction func tapSelected(_ sender: UISegmentedControl)
    {
            //variable for segmented control
        let segIndex = sender.selectedSegmentIndex
        switch segIndex {
                //reading the different property lists and then reload/updating table data
        case 0:
            readPropertyList(tab: 1)
            tableView.reloadData()
        case 1:
            readPropertyList(tab: 2)
            tableView.reloadData()
        case 2:
            readPropertyList(tab: 3)
            tableView.reloadData()
        default:
            break
        }
    }
    
    func readPropertyList(tab: Int) {
        
            //attractions
        if(tab == 1)
        {
                    //remove the current things in the list
            shanghaiAttractions.removeAll()
            
            let path = Bundle.main.path(forResource: "ShanghaiAttraction", ofType: "plist")!
            let shanghaiArray:NSArray = NSArray(contentsOfFile:path)!
            
                    //creating all the items and putting them in the array
            for item in shanghaiArray {
                let dictionary: [String: Any] = (item as? Dictionary)!
                
                let shanghaiName = dictionary["Name"]
                let shanghaiDescription = dictionary["Description"]
                let shanghaiImage_Cell = dictionary["Image_Cell"]
                let shanghaiImage = dictionary["Image"]
                let shanghaiAddress = dictionary["Address"]
                let shanghaiWebsite = dictionary["Website"]
                let shanghaiPhone = dictionary["Phone"]
                let shanghaiHours = dictionary["Hours"]
                let shanghaiLat = dictionary["Latitude"]
                let shanghaiLong = dictionary["Longitude"]
                
                shanghaiAttractions.append(Shanghai(Name: shanghaiName! as! String, Description: shanghaiDescription! as! String, Image_Cell: shanghaiImage_Cell! as! String, Image: shanghaiImage! as! String, Address: shanghaiAddress! as! String, Website: shanghaiWebsite! as! String, Phone: shanghaiPhone! as! String, Hours: shanghaiHours! as! String, Latitude: shanghaiLat as! String, Longitude: shanghaiLong as! String))
            }
        }
            //Hotels
        else if(tab == 2)
        {
                //removing the current items already in the array
            shanghaiHotels.removeAll()
            
            let path = Bundle.main.path(forResource: "ShanghaiHotel", ofType: "plist")!
            let shanghaiArray:NSArray = NSArray(contentsOfFile:path)!
            
                    //create all the items and add them to the array
            for item in shanghaiArray {
                let dictionary: [String: Any] = (item as? Dictionary)!
                
                let shanghaiName = dictionary["Name"]
                let shanghaiDescription = dictionary["Description"]
                let shanghaiImage_Cell = dictionary["Image_Cell"]
                let shanghaiImage = dictionary["Image"]
                let shanghaiAddress = dictionary["Address"]
                let shanghaiWebsite = dictionary["Website"]
                let shanghaiPhone = dictionary["Phone"]
                let shanghaiHours = dictionary["Stars"]
                let shanghaiLat = dictionary["Latitude"]
                let shanghaiLong = dictionary["Longitude"]
                
                shanghaiHotels.append(Shanghai(Name: shanghaiName! as! String, Description: shanghaiDescription! as! String, Image_Cell: shanghaiImage_Cell! as! String, Image: shanghaiImage! as! String, Address: shanghaiAddress! as! String, Website: shanghaiWebsite! as! String, Phone: shanghaiPhone! as! String, Hours: shanghaiHours! as! String, Latitude: shanghaiLat as! String, Longitude: shanghaiLong as! String))
            }
        }
            
            //Restaurants
        else if(tab == 3)
        {
                //remove the current items in the array
            shanghaiRestaurants.removeAll()
            
            let path = Bundle.main.path(forResource: "ShanghaiRestaurants", ofType: "plist")!
            let shanghaiArray:NSArray = NSArray(contentsOfFile:path)!
        
                    //this adds the items into the array
            for item in shanghaiArray {
                let dictionary: [String: Any] = (item as? Dictionary)!
            
                let shanghaiName = dictionary["Name"]
                let shanghaiDescription = dictionary["Description"]
                let shanghaiImage_Cell = dictionary["Image_Cell"]
                let shanghaiImage = dictionary["Image"]
                let shanghaiAddress = dictionary["Address"]
                let shanghaiWebsite = dictionary["Website"]
                let shanghaiPhone = dictionary["Phone"]
                let shanghaiHours = dictionary["Hours"]
                let shanghaiLat = dictionary["Latitude"]
                let shanghaiLong = dictionary["Longitude"]
            
                shanghaiRestaurants.append(Shanghai(Name: shanghaiName! as! String, Description: shanghaiDescription! as! String, Image_Cell: shanghaiImage_Cell! as! String, Image: shanghaiImage! as! String, Address: shanghaiAddress! as! String, Website: shanghaiWebsite! as! String, Phone: shanghaiPhone! as! String, Hours: shanghaiHours! as! String, Latitude: shanghaiLat as! String, Longitude: shanghaiLong as! String))
        
            }
        }
      
        
        
    }
    // MARK: - Table view data source

    /*override*/ func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

            //this functions tells how many items to load
    /*override*/ func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let segIndex = mySegmentedControl.selectedSegmentIndex
        switch segIndex {
        case 0:
            return shanghaiAttractions.count
        case 1:
            return shanghaiHotels.count
        case 2:
            return shanghaiRestaurants.count
        default:
            break
        }
        return shanghaiAttractions.count
    }

    
            //This creates the actual table view items for display
    /*override*/ func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let segIndex = mySegmentedControl.selectedSegmentIndex
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        switch segIndex {
        case 0:
            let shanghai:Shanghai = shanghaiAttractions[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
            
            let cellImage = UIImage(named: shanghai.Image_Cell)
            
            cell.cellImage.image = cellImage
            cell.cellName.text = shanghai.Name
            cell.cellHours.text = shanghai.Hours
            cell.hourLabel.text = "Hours:"
            return cell
        case 1:
            let shanghai:Shanghai = shanghaiHotels[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
            
            let cellImage = UIImage(named: shanghai.Image_Cell)
            
            cell.cellImage.image = cellImage
            cell.cellName.text = shanghai.Name
            cell.cellHours.text = shanghai.Hours
            cell.hourLabel.text = "Stars:"
            return cell
        case 2:
            let shanghai:Shanghai = shanghaiRestaurants[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
            
            let cellImage = UIImage(named: shanghai.Image_Cell)
            
            cell.cellImage.image = cellImage
            cell.cellName.text = shanghai.Name
            cell.cellHours.text = shanghai.Hours
            cell.hourLabel.text = "Hours:"
            return cell
        default:
            break
        }

        return cell
    }


            //preparing for the detail view
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segIndex = mySegmentedControl.selectedSegmentIndex
        switch segIndex {
        case 0:
                    //for attractions
            if(segue.identifier == "CELL") {
                let detailVC = segue.destination as! DetailViewController
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    
                    let shanghai:Shanghai = shanghaiAttractions[indexPath.row]
                    detailVC.tvName = shanghai.Name
                    detailVC.tvImage = shanghai.Image
                    detailVC.tvAddress = shanghai.Address
                    detailVC.tvPhone = shanghai.Phone
                    detailVC.tvHours = shanghai.Hours
                    detailVC.tvDescription = shanghai.Description
                    detailVC.tvWebSite = shanghai.Website
                    detailVC.tvLat = shanghai.Latitude
                    detailVC.tvLong = shanghai.Longitude
                    
                }
            }
        case 1:
                //for hotels
            if(segue.identifier == "CELL") {
                let detailVC = segue.destination as! DetailViewController
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    
                    let shanghai:Shanghai = shanghaiHotels[indexPath.row]
                    detailVC.tvName = shanghai.Name
                    detailVC.tvImage = shanghai.Image
                    detailVC.tvAddress = shanghai.Address
                    detailVC.tvPhone = shanghai.Phone
                    detailVC.tvHours = shanghai.Hours
                    detailVC.tvDescription = shanghai.Description
                    detailVC.tvWebSite = shanghai.Website
                    detailVC.tvLat = shanghai.Latitude
                    detailVC.tvLong = shanghai.Longitude
                    
                }
            }
        case 2:
                //for restaurants
            if(segue.identifier == "CELL") {
                let detailVC = segue.destination as! DetailViewController
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    
                    let shanghai:Shanghai = shanghaiRestaurants[indexPath.row]
                    detailVC.tvName = shanghai.Name
                    detailVC.tvImage = shanghai.Image
                    detailVC.tvAddress = shanghai.Address
                    detailVC.tvPhone = shanghai.Phone
                    detailVC.tvHours = shanghai.Hours
                    detailVC.tvDescription = shanghai.Description
                    detailVC.tvWebSite = shanghai.Website
                    detailVC.tvLat = shanghai.Latitude
                    detailVC.tvLong = shanghai.Longitude
                    
                }
            }
        default:
            break
            
    }
    }
 
}























