import Foundation
import FirebaseAuth
import Capacitor
import IdTokenResult

@objc class GetIdTokenResult: NSObject {
    let token: String
    let expirationTime: String
    let authTime: String
    let issuedAtTime: String
    let signInProvider: String | nil
    let signInSecondFactor: String | nil
    let claims: [String: Any]

    // init(token: String, expirationTime: String, authTime: String, issuedAtTime: String, signInProvider: String | nil, signInSecondFactor: String | nil, claims: [String: Any]) {
    //     self.token = token
    //     self.expirationTime = expirationTime
    //     self.authTime = authTime
    //     self.issuedAtTime = issuedAtTime
    //     self.signInProvider = signInProvider
    //     self.signInSecondFactor = signInSecondFactor
    //     self.claims = claims    
    // }

    init(idTokenResult: IdTokenResult) {
        self.token = idTokenResult.token
        self.expirationTime = idTokenResult.expirationTime
        self.authTime = idTokenResult.authTime
        self.issuedAtTime = idTokenResult.issuedAtTime
        self.signInProvider = idTokenResult.signInProvider
        self.signInSecondFactor = idTokenResult.signInSecondFactor
        self.claims = idTokenResult.claims
    }

    func toJSObject() -> JSObject {
        var result = JSObject()
        result["token"] = self.token
        result["expirationTime"] = self.expirationTime
        result["authTime"] = self.authTime
        result["issuedAtTime"] = self.issuedAtTime
        result["signInProvider"] = self.signInProvider
        result["signInSecondFactor"] = self.signInSecondFactor
        result["claims"] = self.claims
        return result
    }
}
