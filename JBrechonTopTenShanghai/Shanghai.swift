//
//  Shanghai.swift
//  JBrechonTopTenShanghai
//
//Name/Author: John Brechon
//Z-ID: Z1750010
//CSCI 321/521, Spring 2018
//Activity: Midterm

import UIKit
import Foundation

class Shanghai: NSObject {
    
    var Name: String!
    var Description: String!
    var Image_Cell: String!
    var Image: String!
    var Address: String!
    var Website: String!
    var Phone: String!
    var Hours: String!
    var Latitude: String!
    var Longitude: String!
    
    init(Name: String, Description: String, Image_Cell: String, Image: String, Address: String, Website: String, Phone: String, Hours: String, Latitude: String, Longitude: String)
    {
        self.Name = Name
        self.Description = Description
        self.Image_Cell = Image_Cell
        self.Image = Image
        self.Address = Address
        self.Website = Website
        self.Phone = Phone
        self.Hours = Hours
        self.Latitude = Latitude
        self.Longitude = Longitude
    }
}
