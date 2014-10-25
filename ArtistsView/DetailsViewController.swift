//
//  DetailsViewController.swift
//  ArtistsView
//
//  Created by Developer on 10/24/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistBioTextView: UITextView!
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
        artistNameLabel.text = artistName
        artistBioTextView.text = artistBio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

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
