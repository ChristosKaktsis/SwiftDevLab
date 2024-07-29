//
//  MapDrawVC.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 1/7/24.
//

import UIKit
import MapKit

class MapDrawVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
    }
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.mapType = .satellite
        mapView.isUserInteractionEnabled = false
        
        // Define coordinates for the polygon
        let coordinates = [
            CLLocationCoordinate2D(latitude: 40.64732299441498, longitude: -4.051358248437318),
            CLLocationCoordinate2D(latitude: 40.647038523114624, longitude: -4.051554018505994),
            CLLocationCoordinate2D(latitude: 40.6471349475145, longitude: -4.052321700189351),
            CLLocationCoordinate2D(latitude: 40.64729093233063, longitude: -4.052632842023265),
            CLLocationCoordinate2D(latitude: 40.64779723317154, longitude: -4.05215623156658),
            CLLocationCoordinate2D(latitude: 40.64732299441498, longitude: -4.051358248437318)
        ]
        
        // Create a polygon with the coordinates
        let polygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
        mapView.addOverlay(polygon)
        
        
        // Center the map around the polygon
        centerMapOnPolygon(polygon)
    }
    
    // Center the map around the polygon
    func centerMapOnPolygon(_ polygon: MKPolygon) {
        var regionRect = polygon.boundingMapRect
        let wPadding = regionRect.size.width * 0.25
        let hPadding = regionRect.size.height * 0.25
        
        // Add padding to the region
        regionRect.size.width += wPadding
        regionRect.size.height += hPadding
        
        // Center the region on the map
        mapView.setRegion(MKCoordinateRegion(regionRect), animated: true)
    }
}

extension MapDrawVC: MKMapViewDelegate {
    // Render the polygon overlay
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polygon = overlay as? MKPolygon {
            let renderer = MKPolygonRenderer(polygon: polygon)
            renderer.fillColor = UIColor.green.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.green
            renderer.lineWidth = 2
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
