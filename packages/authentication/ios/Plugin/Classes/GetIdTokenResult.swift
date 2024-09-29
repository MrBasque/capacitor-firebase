import Foundation
import FirebaseAuth
import Capacitor
//import IdTokenResult

@objc class GetIdTokenResult: NSObject {
    let token: String
    let expirationTime: Date
    let authTime: Date
    let issuedAtTime: Date
    let signInProvider: String?
    let signInSecondFactor: String?
    let claims: [String: Any]

    init(idTokenResult: AuthTokenResult) {
        self.token = idTokenResult.token
        self.expirationTime = idTokenResult.expirationDate
        self.authTime = idTokenResult.authDate
        self.issuedAtTime = idTokenResult.issuedAtDate
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
        //result["claims"] = self.claims
        return result
    }
}
