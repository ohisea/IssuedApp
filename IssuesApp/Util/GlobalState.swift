//
//  GlobalState.swift
//  IssuesApp
//
//  Created by CHOI MIN KYU on 2017. 10. 28..
//  Copyright © 2017년 CHOI MIN KYU. All rights reserved.
//

import Foundation

final class GlobalState {
	
	private init() {
		
	}
	
	static let instance = GlobalState()
	
	enum Constants: String {
		case tokenKey
		case refreshTokenKey
	}
	
	var token: String? {
		get {
			let token = UserDefaults.standard.string(forKey: Constants.tokenKey.rawValue)
			return token
		}
		
		set {
			UserDefaults.standard.setValue(newValue, forKey: Constants.tokenKey.rawValue)
		}
	}
	
	var refreshToken: String? {
		get {
			let token = UserDefaults.standard.string(forKey: Constants.refreshTokenKey.rawValue)
			return token
		}
		
		set {
			UserDefaults.standard.setValue(newValue, forKey: Constants.refreshTokenKey.rawValue)
		}
	}
}
