package io.capawesome.capacitorjs.plugins.firebase.authentication.classes;

import androidx.annotation.Nullable;
import com.getcapacitor.JSObject;
import io.capawesome.capacitorjs.plugins.firebase.authentication.interfaces.Result;

public class GetIdTokenResult implements Result {

    private String token;
    private String expirationTime;
    private String authTime;
    private String issuedAtTime;
    @Nullable
    private String signInProvider;
    @Nullable
    private String signInSecondFactor;
    private Map<String, Object> claims;

    // public GetIdTokenResult(@Nullable String token, @Nullable String expirationTime, @Nullable String authTime, @Nullable String issuedAtTime, @Nullable String signInProvider, @Nullable String signInSecondFactor, @Nullable Map<String, Object> claims) {
    //     this.token = token;
    //     this.expirationTime = expirationTime;
    //     this.authTime = authTime;
    //     this.issuedAtTime = issuedAtTime;
    //     this.signInProvider = signInProvider;
    //     this.signInSecondFactor = signInSecondFactor;
    //     this.claims = claims;
    // }

    public GetIdTokenResult(IdTokenResult idTokenResult) {
        this.token = idTokenResult.getToken();
        this.expirationTime = idTokenResult.getExpirationTime();
        this.authTime = idTokenResult.getAuthTime();
        this.issuedAtTime = idTokenResult.getIssuedAtTime();
        this.signInProvider = idTokenResult.getSignInProvider();
        this.signInSecondFactor = idTokenResult.getSignInSecondFactor();
        this.claims = idTokenResult.getClaims();
    }

    public JSObject toJSObject() {
        JSObject result = new JSObject();
        result.put("token", token); 
        result.put("expirationTime", expirationTime);
        result.put("authTime", authTime);
        result.put("issuedAtTime", issuedAtTime);
        result.put("signInProvider", signInProvider);
        result.put("signInSecondFactor", signInSecondFactor);
        if (claims != null) {
            JSObject claimsObject = new JSObject();
            for (Map.Entry<String, Object> entry : claims.entrySet()) {
                claimsObject.put(entry.getKey(), entry.getValue());
            }
            result.put("claims", claimsObject);
        }
        return result;
    }
}
