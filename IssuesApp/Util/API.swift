//
//  API.swift
//  IssuesApp
//
//  Created by CHOI MIN KYU on 2017. 10. 28..
//  Copyright © 2017년 CHOI MIN KYU. All rights reserved.
//

import Foundation
import OAuthSwift

protocol API {
	func getToken(handler: @escaping (() -> Void))
	func tokenRefresh(handler: @escaping (() -> Void))
}

struct GitHubApi: API {
	let oauth: OAuth2Swift = OAuth2Swift(consumerKey: "f1a1f2f8256e35df0dbe",
	                                     consumerSecret: "53776de4a3287080657ccd7f22cfd9b682a4bc98",
	                                     authorizeUrl: "https://github.com/login/oauth/authorize",
	                                     accessTokenUrl: "https://github.com/login/oauth/access_token",
	                                     responseType: "code")
	
	func getToken(handler: @escaping (() -> Void)) {
		oauth.authorize(withCallbackURL: "issuesapp://oauth-callback/github",
		                scope: "user,repo",
		                state: "state",
		                success: { (credential, _, _) in
							let token = credential.oauthToken
							let refreshToken = credential.oauthRefreshToken
							
							print("token : \(token)")
							
							GlobalState.instance.token = token
							GlobalState.instance.refreshToken = refreshToken
							handler()
		}) { (error) in
			print(error.localizedDescription)
		}
	}
	
	func tokenRefresh(handler: @escaping (() -> Void)) {
		guard let refreshToken = GlobalState.instance.refreshToken else {
			return
		}
		
		oauth.renewAccessToken(withRefreshToken: refreshToken, success: { (credential, _, _) in
			let token = credential.oauthToken
			let refreshToken = credential.oauthRefreshToken
			
			print("token : \(token)")
			
			GlobalState.instance.token = token
			GlobalState.instance.refreshToken = refreshToken
			handler()
		}) { (error) in
			print(error.localizedDescription)
		}
	}
}
