//
//  AppDelegate.swift
//  googleloginn
//
//  Created by 김민섭 on 3/10/24.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    // User 정보를 서버로 부터 가져올경우 다음 싱글톤 객체 사용 (user.profile.suerId 등등)
    public static var user: GIDGoogleUser!
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if(error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("not signed in before or signed out")
            } else {
                print(error.localizedDescription)
            }
        }
        
        // singleton 객체 - user가 로그인을 하면, AppDelegate.user로 다른곳에서 사용 가능
        AppDelegate.user = user
        
        return
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        GIDSignIn.sharedInstance()?.clientID = "7779744068-7al71n9pa84q2i6pfek6ak2lmj7ubp8i.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return (GIDSignIn.sharedInstance()?.handle(url))!
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

