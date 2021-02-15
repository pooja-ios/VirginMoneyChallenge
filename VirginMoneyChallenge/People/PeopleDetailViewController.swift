//
//  PeopleDetailViewController.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import UIKit
import SDWebImage
import MapKit
import CoreLocation

class PeopleDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var people: People?
    private var peopleViewModel : PeopleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setAccessibility()
        populateData()
        fetchPeopleDetail()
    }
    
    func fetchPeopleDetail() {
        peopleViewModel = PeopleViewModel(peopleId: people?.id ?? "")
        peopleViewModel?.updatePeopleDetail = {
            if self.people != self.peopleViewModel?.people {
                self.people = self.peopleViewModel?.people
                self.populateData()
            }
        }
    }
    
    func setupUI() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderWidth = 4
        nameLabel.textColor = BRAND_COLOR
    }
    
    func setAccessibility() {
        avatarImageView.accessibilityLabel = people?.getFullName()
        avatarImageView.isAccessibilityElement = true
    }
    
    func populateData() {
        self.navigationItem.title = self.people?.firstName
        
        avatarImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        if let avatar = people?.avatar {
            avatarImageView.sd_setImage(with: URL(string: avatar), completed: nil)
        }
        if let favColor = people?.favouriteColor {
            avatarImageView.layer.borderColor = UIColor(hexString: favColor).cgColor
        }
            
        nameLabel.text = people?.getFullName()
        jobTitleLabel.text = people?.jobTitle
        emailLabel.text = people?.email
        phoneLabel.text = people?.phone
        createdAtLabel.attributedText = people?.getCreatedAtString()
        
        if let latitude = people?.latitude, let longitude = people?.longitude {
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            mapView.addAnnotation(annotation)
        }
    }
}
