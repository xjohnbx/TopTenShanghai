//
//  MapViewController.swift
//  JBrechonTopTenShanghai
//
//Name/Author: John Brechon
//Z-ID: Z1750010
//CSCI 321/521, Spring 2018
//Activity: Midterm

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapSegment: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    
    var dtvLat:String!
    var dtvLong:String!
    
    
            //segmented view for the different types of map view
    @IBAction func mapViewSegment(_ sender: UISegmentedControl) {
        
        let segIndex = sender.selectedSegmentIndex
        switch segIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            break
        }
        
    }
    
    
            //this centers the map on the intial location
    override func viewDidLoad() {
        super.viewDidLoad()

        let lat = Double(dtvLat)
        let long = Double(dtvLong)
        let initialLocation = CLLocation(latitude: (lat)!, longitude: (long)!)
        centerMapOnLocation(location: initialLocation)
        
        
    }
    
    let Radius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, Radius, Radius)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
}
