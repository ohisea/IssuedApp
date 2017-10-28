//
//  LoginViewController.swift
//  IssuesApp
//
//  Created by CHOI MIN KYU on 2017. 10. 28..
//  Copyright © 2017년 CHOI MIN KYU. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {

	let oauth: OAuth2Swift = OAuth2Swift(consumerKey: "f1a1f2f8256e35df0dbe",
	                                     consumerSecret: "53776de4a3287080657ccd7f22cfd9b682a4bc98",
	                                     authorizeUrl: "https://github.com/login/oauth/authorize",
	                                     accessTokenUrl: "https://github.com/login/oauth/access_token",
	                                     responseType: "code")
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func loginToGitHubButtonTap() {
		
		oauth.authorize(withCallbackURL: "issuesapp://oauth-callback/github", scope: "user,repo", state: "state", success: { (credential, _, _) in
			let token = credential.oauthToken
			print("token : \(token)")
			
		}) { (error) in
			print(error.localizedDescription)
		}
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
