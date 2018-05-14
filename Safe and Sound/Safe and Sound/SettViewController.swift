//
//  SettViewController.swift
//  Safe&Sound
//
//  Created by Medha Gupta on 3/24/18.
//  Copyright © 2018 HackUVA. All rights reserved.
//

import UIKit

class SettViewController: UIViewController {

    @IBOutlet var policeOutlet: UISwitch!

    @IBAction func policeSwitch(_ sender: Any)
    {
        if (policeOutlet.isOn)
        {
            
            UIApplication.shared.open(URL(string:"https://account-sandbox.safetrek.io/authorize?client_id=m5qXF5ztOdT4cdQtUbZT2grBhF187vw6&scope=openid%20phone%20offline_access&response_type=code&redirect_uri=https://safetrektest6.herokuapp.com/callback")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
