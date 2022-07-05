var OAUTHURL = 'https://accounts.google.com/o/oauth2/auth?';
var VALIDURL = 'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=';
var SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email';
//var CLIENTID = '376385037581-2apk64js46ro779a99ise93oul5q9gpb.apps.googleusercontent.com';
var CLIENTID = '842000196922-909huneg1mrc3h6o8olsrikd11mlctlv.apps.googleusercontent.com';
var REDIRECT = 'https://www.mussika.co.mz';
var LOGOUT = 'https://www.mussika.co.mz';
var TYPE = 'token';
var _url = OAUTHURL + 'scope=' + SCOPE + '&client_id=' + CLIENTID + '&redirect_uri=' + REDIRECT + '&response_type=' + TYPE;
var acToken;
var tokenType;
var expiresIn;
var user;
var loggedIn = false;

function login() {

    var win = window.open(_url, "windowname1", 'width=800, height=600');
    var pollTimer = window.setInterval(function () {
        try {
            console.log(win.document.URL);
            if (win.document.URL.indexOf(REDIRECT) != -1) {
                window.clearInterval(pollTimer);
                var url = win.document.URL;
                acToken = gup(url, 'access_token');
                tokenType = gup(url, 'token_type');
                expiresIn = gup(url, 'expires_in');

                win.close();
                debugger;
                validateToken(acToken);
            }
        }
        catch (e) {

        }
    }, 500);
}

function gup(url, name) {
    namename = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\#&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(url);
    if (results == null)
        return "";
    else
        return results[1];
}

function validateToken(token) {

    getUserInfo();
    $.ajax(

        {

            url: VALIDURL + token,
            data: null,
            success: function (responseText) {


            },

        });

}

function getUserInfo() {

    debugger
    $.ajax({

        url: 'https://www.googleapis.com/oauth2/v1/userinfo?access_token=' + acToken,
        data: null,
        success: function (resp) {
            user = resp;
            loginGmail(resp);
            //console.log(user);
            //informarSucesso(user.name)
            //informarSucesso(user.email)
            //informarSucesso(user.picture)



        },


    });
    
   


}

function loginGmail(resp) {
    $("#dialog_signin_part").LoadingOverlay("show");
   
    $.ajax({

        url: '/Login/GoogleLogin',

        type: 'POST',
        data: {
            email: resp.email,
            id: resp.id,
            name: resp.name,
            given_name: resp.given_name,
            family_name: resp.family_name,
            picture: resp.picture
        },
        success: function (msg) {
            $("#dialog_signin_part").LoadingOverlay("hide", true);
            window.location.href = msg;
        },

        //dataType: "jsonp"

    });
}