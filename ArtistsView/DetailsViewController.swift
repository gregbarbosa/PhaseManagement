//
//  DetailsViewController.swift
//  ArtistsView
//
//  Created by Developer on 10/24/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var artistBioTextView: UITextView!
    @IBOutlet weak var artistFacebookLabel: UILabel!
    @IBOutlet weak var artistTwitterLabel: UILabel!
    @IBOutlet weak var artistSoundcloudLabel: UILabel!
    @IBOutlet weak var artistBookingLabel: UILabel!
    @IBOutlet weak var artistManagementLabel: UILabel!
    
    var artistName = String()
    var artistBio = String()
    var artistFacebook = String()
    var artistTwitter = String()
    var artistSoundcloud = String()
    var artistImage = String()
    var artistsBooking = String()
    var artistsManagement = String()
    
    func configureView() {
        self.title = artistName
        artistBioTextView.text = artistBio
        artistFacebookLabel.text = artistFacebook
        artistTwitterLabel.text = artistTwitter
        artistSoundcloudLabel.text = artistSoundcloud
        artistBookingLabel.text = artistsBooking
        artistManagementLabel.text = artistsManagement
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
