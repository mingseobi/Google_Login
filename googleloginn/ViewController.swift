//
//  ViewController.swift
//  googleloginn
//
//  Created by 김민섭 on 3/10/24.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    var loginBtn = GIDSignInButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self // 로그인화면 불러오기
        GIDSignIn.sharedInstance()?.restorePreviousSignIn() // 자동로그인

    }


}

