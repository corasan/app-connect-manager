//
//  AppConnectAuthorization.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import Foundation
import SwiftJWT
import Alamofire

struct Claim: Claims {
    var iss: String
    var exp: Date
    var aud: String
}

struct AppConnectAuthorization {
    static func getToken() -> String {
        return signedJWT()
    }

    static func signedJWT() -> String {
        var jwt = createJWT()
        let privateKeyPath = URL(fileURLWithPath: "/Users/henry/AppStoreConnect_Key.p8")
        let privateKey = try! Data(contentsOf: privateKeyPath)
        let jwtSigner = JWTSigner.es256(privateKey: privateKey)
        let signedJWT = try! jwt.sign(using: jwtSigner)
        return signedJWT
    }

    static func createJWT() -> JWT<Claim> {
        let issuer = "ec31a5f5-f529-4866-b50e-b7bac8e4c14c"
        let header = Header(kid: "6M9WM259ST")
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .minute, value: 20, to: Date())!
        let claims = Claim(iss: issuer, exp: date, aud: "appstoreconnect-v1")
        return JWT(header: header, claims: claims)
    }
}

