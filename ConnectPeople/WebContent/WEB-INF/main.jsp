<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths" lang="en">
    <head>
    	<!-- meta charec set -->
        <meta charset="utf-8">
		<!-- Always force latest IE rendering engine or request Chrome Frame -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<!-- Page Title -->
        <title>MrAdvisor</title>		
		<!-- Meta Description -->
        <meta name="description" content="">
		<!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css">
            .gm-style .gm-style-cc span,.gm-style .gm-style-cc a,.gm-style .gm-style-mtc div{font-size:10px}
        </style>

		
		<!-- Google Font -->
		<link rel="stylesheet" href="css/style.css" />	
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800">
        <style type="text/css">
        
            @media print { .gm-style .gmnoprint, .gmnoprint { display:none }}@media screen { .gm-style .gmnoscreen, .gmnoscreen { display:none }}
        </style>
        <style type="text/css">
            .gm-style{font-family:Roboto,Arial,sans-serif;font-size:11px;font-weight:400;text-decoration:none}
        </style>
        <style type="text/css">
            .fancybox-margin{margin-right:16px;}
        </style>

		<!-- CSS
		================================================== -->
		<!-- Fontawesome Icon font -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<!-- Twitter Bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- jquery.fancybox  -->
        <link rel="stylesheet" href="css/jquery.fancybox.css">
		<!-- animate -->
        <link rel="stylesheet" href="css/animate.css">
		<!-- Main Stylesheet -->
        <link rel="stylesheet" href="css/main.css">
		<!-- media-queries -->
        <link rel="stylesheet" href="css/media-queries.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        

		<!-- Modernizer Script for old Browsers -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <script type="text/javascript" charset="UTF-8" src="http://maps.gstatic.com/maps-api-v3/api/js/19/9/common.js"></script>
        <script type="text/javascript" charset="UTF-8" src="http://maps.gstatic.com/maps-api-v3/api/js/19/9/map.js"></script>
        <script type="text/javascript" charset="UTF-8" src="http://maps.gstatic.com/maps-api-v3/api/js/19/9/util.js"></script>
        <script type="text/javascript" charset="UTF-8" src="http://maps.gstatic.com/maps-api-v3/api/js/19/9/marker.js"></script>
        <script type="text/javascript" charset="UTF-8" src="http://maps.gstatic.com/maps-api-v3/api/js/19/9/onion.js"></script>
        <script type="text/javascript" charset="UTF-8" src="http://maps.gstatic.com/maps-api-v3/api/js/19/9/controls.js"></script>
        <script type="text/javascript" charset="UTF-8" src="http://maps.gstatic.com/maps-api-v3/api/js/19/9/stats.js"></script>

		<!--Kandy script calls start change-->
<script src="https://kandy-portal.s3.amazonaws.com/public/javascript/fcs/3.0.1/fcs.js"></script>
<script src="https://kandy-portal.s3.amazonaws.com/public/javascript/kandy/2.1.0/kandy.js"></script>
<script language="JavaScript">

var uiState = '';
var callId = null;
var audio = null;
var needVideo = true;
var ProjAPIKey = "DAKfeca60d26a4e4ce28638d678bd10e8be";
var userID = "user1@bstorm.com";
var pwd = "1ralhtym1";
var PSTNnumber;

setupAudio = function () {
    ringInAudioSrcs = [
        {src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringin.mp3', type: 'audio/mp3'},
        {src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringin.ogg', type: 'audio/ogg'}
    ];
    ringOutAudioSrcs = [
        {src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringout.mp3', type: 'audio/mp3'},
        {src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringout.ogg', type: 'audio/ogg'}
    ];
    msgInAudioSrcs = [
        {src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/msgin.mp3', type: 'audio/mp3'},
        {src: 'https://kandy-portal.s3.amazonaws.com/public/sounds/msgin.ogg', type: 'audio/ogg'}
    ];

    audio = {
        ringIn: $('<audio/>', {loop: 'loop', id: 'ringInAudio'})[0],
        ringOut: $('<audio/>', {loop: 'loop', id: 'ringOutAudio'})[0],
        msgIn: $('<audio/>', {id: 'msgInAudio'})[0]
    };

    // setup Msg sources
    for (var i = 0; i < msgInAudioSrcs.length; i++) {
        audio.msgIn.appendChild($('<source/>', msgInAudioSrcs[i])[0]);
    }

    // setup RingIn sources
    for (var i = 0; i < ringInAudioSrcs.length; i++) {
        audio.ringIn.appendChild($('<source/>', ringInAudioSrcs[i])[0]);
    }

    // setup RingOut sources
    for (var i = 0; i < ringOutAudioSrcs.length; i++) {
        audio.ringOut.appendChild($('<source/>', ringOutAudioSrcs[i])[0]);
    }
};

// called when page is done loading to initialize KandyAPI
setup = function () {
    setupAudio();

    try {
        if (KandyAPI === undefined) {
            alert("KandyAPI object undefined (not finding kandy.js)");
        } else if (fcs === undefined) {
            alert("fcs object undefined (not finding fcs.js)");
        } else {
            //changeUIState('LOGGED_OUT');
            //KandyAPI.Phone.login(ProjAPIKey, userID, pwd);
            KandyAPI.Phone.setup({
                remoteVideoContainer: $('#videoPane')[0],
                // respond to Kandy events...
                listeners: {
                    loginsuccess: function () {
                        console.debug('loginsuccess');
                        KandyAPI.Phone.updatePresence(0);
                        setInterval(getIms, 5000);
                        changeUIState('READY_FOR_CALLING');
                    },
                    loginfailed: function () {
                        console.debug('loginfailed');
                        alert("Login failed");
                    },
                    // you successfully initiated a call (waiting for callee to answer)
                    callinitiated: function (call, number) {
                        console.debug('callinitiated');
                        audio.ringOut.play();
                        callId = call.getId();
                        $('#otherPartyName').val($('#callOutId').val());
                        changeUIState('CALLING');
                    },
                    callinitiatefailed: function (message) {
                        console.debug('callinitiatefailed');
                        audio.ringOut.pause();
                        if (message !== undefined && message.length > 0) {
                            alert(message);
                        }
                        $('#statusMsg').html("Call initiation failed.");
                        changeUIState("READY_FOR_CALLING");
                    },
                    // your call was declined by callee
                    callrejected: function () {
                        console.debug('callrejected');
                        audio.ringIn.pause();
                        changeUIState("READY_FOR_CALLING");
                        $('#statusMsg').html("Call declined.");
                    },
                    callrejectfailed: function () {
                        console.debug('callrejectfailed')
                        $('#statusMsg').html("Call decline failed.");
                    },
                    callignored: function () {
                        console.debug('callignored');
                        audio.ringIn.pause();
                        changeUIState("READY_FOR_CALLING");
                        $('#statusMsg').html("Call declined.");
                    },
                    callignorefailed: function () {
                        console.debug('callignorefailed');
                    },
                    // you are being called, time to answer or reject
                    callincoming: function (call, isAnonymous) {
                        console.debug('callincoming');
                        audio.ringIn.play();
                        callId = call.getId();
                        if (!isAnonymous) {
                            $('#otherPartyName').val(call.callerName);
                        } else {
                            $('#otherPartyName').val('anonymous');
                        }
                        changeUIState('BEING_CALLED');
                    },
                    // you indicated that you are answering the call
                    callanswered: function (call) {
                        console.debug('callanswered');
                        audio.ringIn.pause();
                        changeUIState("ON_CALL");
                    },
                    callanswerfailed: function (call) {
                        console.debug('callanswerfailed');
                    },
                    // you are connected to other party (either they called you or you called them),
                    oncall: function (call) {
                        console.debug('oncall');
                        audio.ringOut.pause();
                        changeUIState("ON_CALL");
                    },
                    // call connection ended
                    callended: function (call) {
                        console.debug('callended');
                        audio.ringOut.pause();
                        audio.ringIn.pause();

                        callId = null;
                        if (uiState != 'LOGGED_OUT') {
                            changeUIState("READY_FOR_CALLING");
                            $('#statusMsg').html("Call ended.");
                        }
                    },
                    callendfailed: function () {
                        console.debug('callendfailed');
                    },
                    // presense notifications (are your contacts available, away, offline?) not handled in this demo
                    presencenotification: function (username, state, description, activity) {
                        console.debug('presencenotification');
                    }
                }
            });
        }
    } catch (err) {
        alert("Error initializing KandyAPI.Phone:" + err.message + "\n" + err.stack);
    }
};

login = function () {
    try {
        //KandyAPI.Phone.login($("#domainApiId").val(), $("#loginId").val(), $('#passwd').val());
        KandyAPI.Phone.login(ProjAPIKey, userID, pwd);
    } catch (err) {
        alert("Error in login(): " + err.message);
    }
};

makeCall = function() {
    KandyAPI.Phone.makeCall('user2@bstorm.com', needVideo);
    //KandyAPI.Phone.makePSTNCall($('#callOutId').val(),null);
};

function makeVideoCall(){
    KandyAPI.Phone.makeCall('user2@bstorm.com', true);
};

function makeAudioCall(){
    KandyAPI.Phone.makeCall('user2@bstorm.com', false);
};

function pstncall(){
	KandyAPI.Phone.makePSTNCall("14696059591", null);
}
makePSTNCall = function () {
    KandyAPI.Phone.makePSTNCall(PSTNnumber, null);
};

answerVideoCall = function () {
    changeUIState("ANSWERING_CALL");
    KandyAPI.Phone.answerCall(callId, true);
};
rejectCall = function () {
    KandyAPI.Phone.rejectCall(callId);
};
holdCall = function () {
    KandyAPI.Phone.holdCall(callId);
    changeUIState('CALL_HELD');
};
unholdCall = function () {
    KandyAPI.Phone.unHoldCall(callId);
    changeUIState('ON_CALL')
};
hangUpCall = function () {
    KandyAPI.Phone.endCall(callId);
};

isOnCall = function () {
    return (uiState == 'ON_CALL' || uiState == 'BEING_CALLED' || uiState == 'CALLING' || uiState == 'CALL_HELD');
};

logout = function () {
    try {
        if (isOnCall()) {
            if (confirm("End call and log out?")) {
                KandyAPI.Phone.endCall(callId);
                KandyAPI.Phone.logout(function () {
                    changeUIState('LOGGED_OUT');
                });
            }
        } else {
            KandyAPI.Phone.logout(function () {
                changeUIState('LOGGED_OUT');
            });
        }
    } catch (err) {
        alert("Error in logout(): " + err.message)
    }
};

changeUIState = function (state) {
    uiState = state;
    switch (uiState) {
        case 'LOGGED_OUT':
            $("#login").show();
            $("#logout").css('visibility', 'hidden');
            $("#someonesCalling").hide();
            $('#readyForCalling').hide();
            $('#onCall').hide();
            $("#statusMsg").html('');
            $('#videoPane').hide();
            break;
        case 'READY_FOR_CALLING':
            $("#login").hide();  //hide();
            $("#logout").css('visibility', 'visible');
            $('#someonesCalling').hide();
            $('#callingOut').hide();
            $('#onCall').hide();
            $('#statusMsg').html("");
            $('#videoPane').empty();
//            $('#videoPane').show();
            break;
        case 'CALLING':
            $('#someonesCalling').hide();
            $('#readyForCalling').hide();
            $('#callingOut').show();
            $('#onCall').hide();
            $('#statusMsg').html("Calling " + $('#callOutId').val());
            break;
        case 'ON_CALL':
            $('#someonesCalling').hide();
            $('#readyForCalling').hide();
            $('#callingOut').hide();
            $('#onCall').show();
            $('#holdBtn').css('display', 'inline');
            $('#unholdBtn').hide();
            $('#statusMsg').html("Connected to " + $('#otherPartyName').val());
            break;
        case 'BEING_CALLED':
            $('#someonesCalling').show();
            $('#readyForCalling').hide();
            $('#callingOut').hide();
            $('#onCall').hide();
            $('#statusMsg').html("Incoming call from " + $('#otherPartyName').val() + "...");
            break;
        case 'ANSWERING_CALL':
            $('#someonesCalling').hide();
            $('#statusMsg').html("Establishing connection with " + $('#otherPartyName').val() + "...");
            break;
        case 'CALL_HELD':
            $('#someonesCalling').hide();
            $('#readyForCalling').hide();
            $('#callingOut').hide();
            $('#onCall').show();
            $('#holdBtn').hide();
            $('#unholdBtn').css('display', 'inline');
            $('#statusMsg').html("On hold with " + $('#otherPartyName').val() + "...");
            break;
    }
}

sendIm = function () {
	var name ='Anonymous';
    var uuid = KandyAPI.Phone.sendIm('user2@bstorm.com', $('#imMessageToSend').val(),
            function (result) {
                $('#messages').append('<div>' +
                        '<span class="imUsername">' + name + '</span>' +
                        '<span class="imMessage">' + $('#imMessageToSend').val() + '</span>' +
                        '</div>');
                $('#imMessageToSend').val('');
            },
            function (message, status) {
                alert("IM send failed");
            }
    );
};

getIms = function () {
    KandyAPI.Phone.getIm(
            function (data) {
                var i = 0;
                for (i = 0; i < data.messages.length; ++i) {
                    var msg = data.messages[i];
                    if (msg.messageType == 'chat') {
                        var username = data.messages[i].sender.user_id;
                        console.log(username+"this is hte username only");
                        //change
                        var sendersUsername = "<p id=\"senderUname\" style=\"display:none\">"+username+"@bstorm.com"+"</p>";
                        console.log(sendersUsername+"hidden p tag");
                        $('#imMessageToSend').append(sendersUsername);
                        var msg = data.messages[i].message.text;

                        $('#messages').append('<div>' +
                                '<span class="imUsername">' + username + '</span>' +
                                '<span class="imMessage">' + msg + '</span>' +
                                '</div>');
                    } else {
                        //alert("received " + msg.messageType + ": ");
                    }
                }
            },
            function () {
                alert("error receiving IMs");
            }
    )
};

$(window).bind('beforeunload', function (e) {
    console.debug('leaving page');
    try {
        if (isOnCall()) {
            KandyAPI.Phone.endCall(callId);
        }
        KandyAPI.Phone.logout(function () {
        });
    } catch (err) {
        //swallow it
    }
    var message = null;
    e.returnValue = null;
    return message;
});

</script>
<!--kandy script calls ends change-->

<!--change kandy css -->
<style>
    #videoPane {
        border: 2px solid #0eb493;
        width: 334px;
        height: 250px;
        background-image: url("/images/kandy/GenbandPresentsKandy.png");
        background-repeat: no-repeat;
        background-size: 334px 250px
    }
</style>
<!--change kandy css ends-->
    </head>
	
    <body id="body" onload="setup()">
	
		<!-- preloader -->
		<div id="preloader">
			<img src="img/preloader.gif" alt="Preloader">
		</div>
		<!-- end preloader -->

        <!-- 
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top navbar">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-bars fa-2x"></i>
                    </button>
					<!-- /responsive nav button -->
					
					<!-- logo -->
                    <a class="navbar-brand" href="#body">
						<h1 id="logo">
							MrAdvisor
						</h1>
					</a>
					<!-- /logo -->
                </div>

				<!-- main nav -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <ul id="nav" class="nav navbar-nav">
                        <li class="current"><a href="#body">Home</a></li>
                        <li><a href="#features">What We Do</a></li>                                                                       
                        <li><a href="#team">Team</a></li>
                        <li><a href="#contact">Contact</a></li>
                        <li id="signin"><a data-toggle="modal" data-target="#login-modal" href="">SignIn</a></li>
                   		<li><a id="whoWe" href="#works" style="display:none">Work</a></li>
                    </ul>
                </nav>
				<!-- /main nav -->
				
            </div>
        </header>
        <!--
        End Fixed Navigation
        ==================================== -->
		
		
		
        <!--
        Home Slider
        ==================================== -->
		
		<section id="slider">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			
				<!-- Indicators bullet -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				</ol>
				<!-- End Indicators bullet -->				
				
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					
					<!-- single slide -->
					<div class="item active" style="background-image: url(img/banner.jpg);">
						<div class="carousel-caption" style="top:30%;">
							<h2 data-wow-duration="700ms" data-wow-delay="500ms" class="wow bounceInDown animated">Let's<span> Talk</span>!</h2>
							<h3 data-wow-duration="2000ms" class="wow slideInLeft animated"><span class="color"> <input type="text" 
							class="form-control" id="placeTextField" style="margin-left:20%;margin-top:1%;height:40px;width:60%;"
							placeholder="Hola, What are you looking for?"
                   name="place"></span> at <input type="text" 
							class="form-control" id="placeTextField1" style="margin-left:30%;margin-top:1%;height:40px;width:40%;"
							placeholder="What location?"
                   name="place">
                   	<a href="#" id="getpeople" class="btn btn-success modal-login-btn" style="width:200px;">Find People</a>
                   </h3>
							<p data-wow-duration="1000ms" class="wow slideInRight animated">We are a team of Unknown People</p>
							
							<ul class="social-links text-center">
								<li><a href=""><i class="fa fa-twitter fa-lg"></i></a></li>
								<li><a href=""><i class="fa fa-facebook fa-lg"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>
								<li><a href=""><i class="fa fa-dribbble fa-lg"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- end single slide -->
					
					<!-- single slide -->
					<!-- <div class="item" style="background-image: url(img/banner.jpg);">
						<div class="carousel-caption">
							<h2 data-wow-duration="500ms" data-wow-delay="500ms" class="wow bounceInDown animated">Meet<span> Team</span>!</h2>
							<h3 data-wow-duration="500ms" class="wow slideInLeft animated"><span class="color">/creative</span> one page template.</h3>
							<p data-wow-duration="500ms" class="wow slideInRight animated">We are a team of professionals</p>
							
							<ul class="social-links text-center">
								<li><a href=""><i class="fa fa-twitter fa-lg"></i></a></li>
								<li><a href=""><i class="fa fa-facebook fa-lg"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>
								<li><a href=""><i class="fa fa-dribbble fa-lg"></i></a></li>
							</ul>
						</div>
					</div> -->
					<!-- end single slide -->
					
				</div>
				<!-- End Wrapper for slides -->
				
			</div>
		</section>
		
        <!--
        End Home SliderEnd
        ==================================== -->
		
        <!--
        Features
        ==================================== -->
		
		<section id="features" class="features">
			<div class="container">
				<div class="row">
				
					<div class="sec-title text-center mb50 wow bounceInDown animated" data-wow-duration="500ms">
						<h2>Who We Connect</h2>
						<div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
					</div>

					<!-- service item -->
					<div class="col-md-4 wow fadeInLeft" data-wow-duration="500ms">
						<div class="service-item">
							<div class="service-icon">
								<i class="fa fa-github fa-2x"></i>
							</div>
							
							<div class="service-desc">
								<h3>You</h3>
								<p>You are our top priority. We want to connect you to as many domain ninjas as possible so that you will be able to form your own opinion about a place that you are interested in. 
								</p>
							</div>
						</div>
					</div>
					<!-- end service item -->
					
					<!-- service item -->
					<div class="col-md-4 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="500ms">
						<div class="service-item">
							<div class="service-icon">
								<i class="fa fa-pencil fa-2x"></i>
							</div>
							
							<div class="service-desc">
								<h3>The Domain Ninjas!</h3>
								<p>They are our pillars! Without them, we would pretty much cease to exist. They know anything about everything. Just like our team member(and in-house bar expert), Prashant!</p>
							</div>
						</div>
					</div>
					<!-- end service item -->
					
					<!-- service item -->
					<div class="col-md-4 wow fadeInRight" data-wow-duration="500ms"  data-wow-delay="900ms">
						<div class="service-item">
							<div class="service-icon">
								<i class="fa fa-bullhorn fa-2x"></i>
							</div>
							
							<div class="service-desc">
								<h3>Various Food Franchises!</h3>
								<p>By connecting our customers to various restaurants, pubs and cafe, we try to sweeten your experience by hooking you up with goodies that you can claim at these places! Sweet huh!</p>
							</div>
						</div>
					</div>
					<!-- end service item -->
						
				</div>
			</div>
		</section>
		
        <!--
        End Features
        ==================================== -->
		
		
        <!--
        Our Works
        ==================================== -->
		
		<section id="works" class="works clearfix">
			<div class="container">
				<div class="row">
				
					<div class="sec-title text-center">
						<h2>Here We are</h2>
						<div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
					</div>
					
					<div class="sec-sub-title text-center">
						<p>Hi, We share same interest as you !! Feel free to disturb us.   </p>
					</div>
					
					<!-- <div class="work-filter wow fadeInRight animated" data-wow-duration="500ms">
						<ul class="text-center">
							<li><a href="#" data-filter="*" class="current">All</a></li>
							<li><a href="#" data-filter=".branding">Branding</a></li>
							<li><a href="#" data-filter=".web">web</a></li>
							<li><a href="#" data-filter=".logo-design">logo design</a></li>
							<li><a href="#" data-filter=".photography">photography</a></li>
						</ul>
					</div> -->
					
				</div>
			</div>

            <div class="project-wrapper" id="MixItUp76F363">

               

            </div>
		

		</section>
		
        <!--
        End Our Works
        ==================================== -->
		
        <!--
        Meet Our Team
        ==================================== -->		
		
		<section id="team" class="team">
			<div class="container">
				<div class="row">
		
					<div class="sec-title text-center wow fadeInUp animated" data-wow-duration="700ms">
						<h2>Meet Our Team</h2>
						<div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
					</div>
					
					<div class="sec-sub-title text-center wow fadeInRight animated" data-wow-duration="500ms">
						<p></p>
					</div>

					<!-- single member -->
					<figure class="team-member col-md-2 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms">
						<div class="member-thumb">
							<img src="img/team/member-1.png" alt="Team Member" class="img-responsive">
							<figcaption class="overlay">
								<h5>Prashant Prakash</h5>
								<p>Web Devloper</p>
								<ul class="social-links text-center">
									<li><a href=""><i class="fa fa-twitter fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-facebook fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>
								</ul>
							</figcaption>
						</div>
						<h4>Peeps</h4>
						<span>Hacker</span>
					</figure>
					<!-- end single member -->
					
					<!-- single member -->
					<figure class="team-member col-md-2 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="member-thumb">
							<img src="img/team/member-2.png" alt="Team Member" class="img-responsive" style="width:100%;">
							<figcaption class="overlay">
								<h5>George Koshy </h5>
								<p>Web Developer</p>
								<ul class="social-links text-center">
									<li><a href=""><i class="fa fa-twitter fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-facebook fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>
								</ul>
							</figcaption>
						</div>
						<h4>George</h4>
						<span>Hacker</span>
					</figure>
					<!-- end single member -->
					
					<!-- single member -->
					<figure class="team-member col-md-2 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="600ms">
						<div class="member-thumb">
							<img src="img/team/member-3.png" alt="Team Member" class="img-responsive" style="width:100%;">
							<figcaption class="overlay">
								<h5>Ron Thomas  </h5>
								<p>Web Developer</p>
								<ul class="social-links text-center">
									<li><a href=""><i class="fa fa-twitter fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-facebook fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>
								</ul>
							</figcaption>
						</div>
						<h4>Ron</h4>
						<span>Hacker</span>
					</figure>
					<!-- end single member -->
					
					<!-- single member -->
					<figure class="team-member col-md-2 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="900ms">
						<div class="member-thumb">
							<img src="img/team/member-4.png" alt="Team Member" class="img-responsive" style="width:100%;">
							<figcaption class="overlay">
								<h5>Tien Xuan Tran</h5>
								<p>Web Developer</p>
								<ul class="social-links text-center">
									<li><a href=""><i class="fa fa-twitter fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-facebook fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>
								</ul>
							</figcaption>
						</div>
						<h4>Tien</h4>
						<span>Hacker</span>
					</figure>
					<!-- end single member -->
					
					<!-- single member -->
					<figure class="team-member col-md-2 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="900ms">
						<div class="member-thumb">
							<img src="img/team/member-5.png" alt="Team Member" class="img-responsive">
							<figcaption class="overlay">
								<h5>Sunish Sheth</h5>
								<p>Web Developer</p>
								<ul class="social-links text-center">
									<li><a href=""><i class="fa fa-twitter fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-facebook fa-lg"></i></a></li>
									<li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>
								</ul>
							</figcaption>
						</div>
						<h4>Tien</h4>
						<span>Hacker</span>
					</figure>
					<!-- end single member -->
					
				</div>
			</div>
		</section>
		
        <!--
        End Meet Our Team
        ==================================== -->
		
		<!--
        Some fun facts
        ==================================== -->		
		
		<section id="facts" class="facts">
			<div class="parallax-overlay">
				<div class="container">
					<div class="row number-counters">
						
						<div class="sec-title text-center mb50 wow rubberBand animated" data-wow-duration="1000ms">
							<h2>Some Fun Facts</h2>
							<div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
						</div>
						
						<!-- first count item -->
						<div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms">
							<div class="counters-item">
								<i class="fa fa-comment fa-3x"></i>
								<strong data-to="10800">0</strong>
								<!-- Set Your Number here. i,e. data-to="56" -->
								<p>Messages Exchanged</p>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms">
							<div class="counters-item">
								<i class="fa fa-video-camera fa-3x"></i>
								<strong data-to="1200">0</strong>
								<!-- Set Your Number here. i,e. data-to="56" -->
								<p>Video Calls</p>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="600ms">
							<div class="counters-item">
								<i class="fa fa-headphones fa-3x"></i>
								<strong data-to="3600">0</strong>
								<!-- Set Your Number here. i,e. data-to="56" -->
								<p> Audio Calls </p>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="900ms">
							<div class="counters-item">
								<i class="fa fa-phone fa-3x"></i>
								<strong data-to="6454">0</strong>
								<!-- Set Your Number here. i,e. data-to="56" -->
								<p>Phone Calls</p>
							</div>
						</div>
						<!-- end first count item -->
				
					</div>
				</div>
			</div>
		</section>
		
        <!--
        End Some fun facts
        ==================================== -->
		
		
		<!--
        Contact Us
        ==================================== -->		
		
		<section id="contact" class="contact">
			<div class="container">
				<div class="row mb50">
				
					<div class="sec-title text-center mb50 wow fadeInDown animated" data-wow-duration="500ms">
						<h2>Reach Us</h2>
						<div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
					</div>
					
					<div class="sec-sub-title text-center wow rubberBand animated" data-wow-duration="1000ms">
						<p>Feel free to drop in a mail to us!</p>
					</div>
					
					<!-- contact address -->
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 wow fadeInLeft animated" data-wow-duration="500ms">
						<div class="contact-address">
							<h3>The University of Texas at Dallas</h3>
							<p>Richardson</p>
							<p>TX, United States.</p>							
						</div>
					</div>
					<!-- end contact address -->
					
					<!-- contact form -->
					<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12 wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="contact-form">
							<h3>Say hello!</h3>
							<form action="#" id="contact-form">
								<div class="input-group name-email">
									<div class="input-field">
										<input type="text" name="name" id="name" placeholder="Name" class="form-control">
									</div>
									<div class="input-field">
										<input type="email" name="email" id="email" placeholder="Email" class="form-control">
									</div>
								</div>
								<div class="input-group">
									<textarea name="message" id="message" placeholder="Message" class="form-control"></textarea>
								</div>
								<div class="input-group">
									<input type="submit" id="form-submit" class="pull-right" value="Send message">
								</div>
							</form>
						</div>
					</div>
					<!-- end contact form -->
					
					<!-- footer social links -->
					<div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 wow fadeInRight animated" data-wow-duration="500ms" data-wow-delay="600ms">
						<ul class="footer-social">
							<li><a href="https://www.behance.net/Themefisher"><i class="fa fa-behance fa-2x"></i></a></li>
							<li><a href="https://www.twitter.com/Themefisher"><i class="fa fa-twitter fa-2x"></i></a></li>
							<li><a href="https://dribbble.com/themefisher"><i class="fa fa-dribbble fa-2x"></i></a></li>
							<li><a href="https://www.facebook.com/Themefisher"><i class="fa fa-facebook fa-2x"></i></a></li>
						</ul>
					</div>
					<!-- end footer social links -->
					
				</div>
			</div>
			
			<!-- Google map -->
			<div id="map_canvas" class="wow bounceInDown animated" data-wow-duration="500ms"></div>
			<!-- End Google map -->
			
		</section>
		
        <!--
        End Contact Us
        ==================================== -->
		
		
		<footer id="footer" class="footer">
			<div class="container">
				<div class="row">
				
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp animated" data-wow-duration="500ms">
						<div class="footer-single">
							<h1>MrAdvisor</h1>
							<p>We provide you best and fastest advising and help you to make your life better.</p>
						</div>
					</div>
				
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="footer-single">
							<h6>Subscribe </h6>
							<form action="#" class="subscribe">
								<input type="text" name="subscribe" id="subscribe">
								<input type="submit" value="&#8594;" id="subs">
							</form>
							<p>Made With <3 at UTD. </p>
						</div>
					</div>
				
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="600ms">
						<div class="footer-single">
							<h6>Explore</h6>
							<ul>
								<li><a href="#">Inside Us</a></li>
								<li><a href="#">Flickr</a></li>
								<li><a href="#">Google</a></li>
								<li><a href="#">Forum</a></li>
							</ul>
						</div>
					</div>
				
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="900ms">
						<div class="footer-single">
							<h6>Support</h6>
							<ul>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Market Blog</a></li>
								<li><a href="#">Help Center</a></li>
								<li><a href="#">Pressroom</a></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</footer>
		
		<a href="javascript:void(0);" id="back-top"><i class="fa fa-angle-up fa-3x"></i></a>
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header login_modal_header">
        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h2 class="modal-title" id="myModalLabel">Login to Your Account</h2>
      		</div>
      		<div class="modal-body login-modal">
      			<!--  <p>Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required</p>-->
      			<br/>
      			<div class="clearfix"></div>
      			<div id='social-icons-conatainer'>
	        		<div class='modal-body-left'>
	        			<div class="form-group">
		              		<input type="text" id="username" placeholder="Enter your name" value="" class="form-control login-field">
		              		<i class="fa fa-user login-field-icon"></i>
		            	</div>
		
		            	<div class="form-group">
		            	  	<input type="password" id="login-pass" placeholder="Password" value="" class="form-control login-field">
		              		<i class="fa fa-lock login-field-icon"></i>
		            	</div>
		
		            	<a href="#" id="signins" class="btn btn-success modal-login-btn">Login</a>
		            	<a href="#" class="login-link text-center">Lost your password?</a>
	        		</div>
	        	
	        		<div class='modal-body-right'>
	        			<div class="modal-social-icons">
	        				<a href='#' class="btn btn-default facebook"> <i class="fa fa-facebook modal-icons"></i> Sign In with Facebook </a>
	        				<a href='#' class="btn btn-default twitter"> <i class="fa fa-twitter modal-icons"></i> Sign In with Twitter </a>
	        				<a href='#' class="btn btn-default google"> <i class="fa fa-google-plus modal-icons"></i> Sign In with Google </a>
	        				<a href='#' class="btn btn-default linkedin"> <i class="fa fa-linkedin modal-icons"></i> Sign In with Linkedin </a>
	        			</div> 
	        		</div>	
	        		<div id='center-line'> OR </div>
	        	</div>																												
        		<div class="clearfix"></div>
        		
        		<div class="form-group modal-register-btn">
						<a class="btn btn-success" href="#register-modal" data-toggle="modal" data-dismiss="modal">New User? Sign Up!</a>
        		</div>
      		</div>
      		<div class="clearfix"></div>
      		<div class="modal-footer login_modal_footer">
      		</div>
    	</div>
  	</div>
</div>

      <!--
        New User Registration
        ==================================== -->


<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" ov>
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header login_modal_header">
      		
        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h2 class="modal-title" id="myModalLabel">Sign Up!</h2>
      		</div>
      		<div class="modal-body register-modal">
      			<br/>
      			<div class="clearfix"></div>
       			<div id='social-icons-conatainer'> 
<!-- 	        		<div class='modal-body-left'> -->

        <!--
        Login Credentials
        ==================================== -->
        
						<div class="sec-title text-center mb50 wow fadeInDownBig animated" data-wow-duration="1500ms">
							<h2>Login Credentials</h2>
						</div>
						
	        			<div class="form-group wow slideInLeft animated" data-wow-duration="1500ms">
		              		<input type="text" id="useradd-name" placeholder="Enter your user id" value="" class="form-control login-field">
		              		<i class="fa fa-user-plus login-field-icon"></i>
		            	</div>
		
		            	<div class="form-group wow slideInLeft animated" data-wow-duration="1500ms">
		            	  	<input type="password" id="useradd-pass" placeholder="Password" value="" class="form-control login-field">
		              		<i class="fa fa-lock login-field-icon"></i>
		            	</div>
		            	
		            	<div class="form-group wow slideInLeft animated" data-wow-duration="1500ms">
		            	  	<input type="password" id="useradd-pass-confirm" placeholder="Confirm Password" value="" class="form-control login-field">
		              		<i class="fa fa-lock login-field-icon"></i>
		            	</div>
		            	
		  <!--
        Tell us about yourself
        ==================================== -->
        
		            	<div class="sec-title text-center mb50 wow fadeInDownBig animated" data-wow-duration="1500ms">
							<h2>Tell us about yourself!</h2>
						</div>
						
						<div class="form-group wow slideInLeft animated" data-wow-duration="1500ms">
		            	  	<input type="text" id="useradd-fname" placeholder="First Name" value="" class="form-control login-field">
		              		<i class="fa fa-male login-field-icon"></i>
		            	</div>
		            	
		            	<div class="form-group wow slideInLeft animated" data-wow-duration="1500ms">
		            	  	<input type="text" id="useradd-lname" placeholder="Last Name" value="" class="form-control login-field">
		              		<i class="fa fa-male login-field-icon"></i>
		            	</div>
		            	
		            	<div class="form-group wow slideInLeft animated" data-wow-duration="1500ms">
		            	  	<input type="text" id="useradd-dob" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="Date of Birth" value="" class="form-control login-field" style="margin-right: 20px">
		            	</div>
		            	
		            	<div class="form-group wow slideInLeft animated" data-wow-duration="1500ms">
		            	  	<input type="text" id="useradd-location" placeholder="Where are you located?" value="" class="form-control login-field">
		              		<i class="fa fa-location-arrow login-field-icon"></i>
		            	</div>
		            	
		            			  <!--
        Alright! So what kind of expert are you?
        ==================================== -->
        
		            	<div class="sec-title text-center mb50 wow fadeInDownBig animated" data-wow-duration="1500ms">
							<h2>Alright! So, of what are you an expert of?</h2>
							<h4>You can pick from the options below...</h2>
						</div>
		            	
		
		            	<a id="registerBtn" class="btn btn-success" onclick="validateNRegister()">Register</a>
<!-- 		            	<a href="#" class="login-link text-center">Lost your password?</a> -->
<!-- 	        		</div> -->
	        
	        	</div>																												
        		<div class="clearfix"></div>
        		
      		</div>
      		<div class="clearfix"></div>
      		<div class="modal-footer login_modal_footer">
      		</div>
    	</div>
  	</div>
</div>

<script type="text/javascript">
function validateNRegister() {
	resetColor();
	nullCheck();
	pwdMatchCheck();
	//alert("under Construction");
};
	
function resetColor(){
	console.log("Resetting color");
	document.getElementById("useradd-name").style.background="transparent";
	document.getElementById("useradd-pass").style.background="transparent";
	document.getElementById("useradd-pass-confirm").style.background="transparent";
	document.getElementById("useradd-fname").style.background="transparent";
	document.getElementById("useradd-lname").style.background="transparent";
	document.getElementById("useradd-location").style.background="transparent";
};	

function nullCheck(){
	if(document.getElementById("useradd-name").value=="")
	{
		console.log("User ID field Empty");
		document.getElementById("useradd-name").style.background="#F6D8CE";
		return false;
	}
	else if(document.getElementById("useradd-pass").value=="")
	{
		console.log("Password Field is empty");
		document.getElementById("useradd-pass").style.background="#F6D8CE";
	}
	else if(document.getElementById("useradd-pass-confirm").value=="")
	{
		console.log("Confirm Password field is empty");
		document.getElementById("useradd-pass-confirm").style.background="#F6D8CE";
	}
	else if(document.getElementById("useradd-fname").value=="")
	{
		console.log("First name field is empty");
		document.getElementById("useradd-fname").style.background="#F6D8CE";
	}
	else if(document.getElementById("useradd-lname").value=="")
	{
		console.log("First name field is empty");
		document.getElementById("useradd-lname").style.background="#F6D8CE";
	}
	else if(document.getElementById("useradd-location").value=="")
	{
		console.log("First name field is empty");
		document.getElementById("useradd-location").style.background="#F6D8CE";
	}
};

function pwdMatchCheck(){
	if((document.getElementById("useradd-pass").value)!=(document.getElementById("useradd-pass-confirm").value))
		{
			console.log("Passwords do not match");
		}
};
</script>

		<!-- Essential jQuery Plugins
		================================================== -->
		<!-- Main jQuery -->
        <script src="js/jquery-1.11.1.min.js"></script>
		<!-- Single Page Nav -->
        <script src="js/jquery.singlePageNav.min.js"></script>
		<!-- Twitter Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
		<!-- jquery.fancybox.pack -->
        <script src="js/jquery.fancybox.pack.js"></script>
		<!-- jquery.mixitup -->
        <script src="js/jquery.mixitup.min.js"></script>
		<!-- jquery.parallax -->
        <script src="js/jquery.parallax-1.1.3.js"></script>
		<!-- jquery.countTo -->
        <script src="js/jquery-countTo.js"></script>
		<!-- jquery.appear -->
        <script src="js/jquery.appear.js"></script>
		<!-- Contact form validation -->
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
		<!-- Google Map -->
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
		<!-- jquery easing -->
        <script src="js/jquery.easing.min.js"></script>
		<!-- jquery easing -->
        <script src="js/wow.min.js"></script>
        <script src="js/jquery-ui.js"></script>
		<script>
            var wow = new WOW ({
                        boxClass: 'wow', // animated element css class (default is wow)
                        animateClass: 'animated', // animation css class (default is animated)
                        offset: 120, // distance to the element when triggering the animation (default is 0)
                        mobile: false, // trigger animations on mobile devices (default is true)
                        live: true // act on asynchronously loaded content (default is true)
                    }
            );
            wow.init();
        </script>
		<!-- Custom Functions -->
        <script src="js/custom.js"></script>
		
		<script type="text/javascript">
		$(function(){
			var availableTags ;
			
			$.getJSON( "Location", function( data ) {
		    	  console.log(data);
		    	  availableTags = data;
				  
				   $( "#placeTextField1" ).autocomplete({
		              source: availableTags
		         });
		    });
			
			
			
			$.getJSON( "tags", function( data ) {
		    	  console.log(data);
		    	  availableTags = data;
				  
				   $( "#placeTextField" ).autocomplete({
		              source: availableTags
		         });
		    });
				$("#getpeople").click(function(){
			    	console.log("Asdasdasdas");
			    	jQuery("#MixItUp76F363").empty();
			    	$.getJSON( "experts?choice=getdetails&location="+$("#placeTextField1").val()+"&tag="+$("#placeTextField").val(), function( data ) {
    	  				console.log(data);
    	  				for(var i=0;i<data.length;i++){
                        	var divToAppend = "<figure class=\"mix work-item photography\" style=\"display: inline-block;\"><img alt=\"\" src=\"img/works/item-8.jpg\"><figcaption class=\"overlay\"><a data-toggle=\"modal\" data-target=\"#expertModal\" title=\"Connect to ME\" rel=\"works\"><i class=\"fa fa-eye fa-lg\"></i></a><h4>"+data[i].name+"</h4><p>"+data[i].location+"</p></figcaption></figure>";
                            jQuery("#MixItUp76F363").append(divToAppend);
                        }
    	  				
    	  				$( "#whoWe" ).trigger( "click" );
    	  				
            		});
			    });
			    
			    	
            	
			
				$("#signins").click(function(){
            		console.log("Asdasd");
            		console.log($("#username").val());
            		
            		$.getJSON( "login?uname="+$("#username").val()+"&pwd="+$("#login-pass").val(), function( data ) {
    	  				console.log(data);
    	  				var url = "expertsInfo";    
    	  				$(location).attr('href',url);
    	  				
            		});
				});
            	
            	
           });
            	
            	
        </script>
        
        <script type="text/javascript">
    $( document ).ready(function() {
    	login();
        $('#videoFA').click(function () {
            
        	console.log("helloooo");
            makeVideoCall();
            $("#chat").hide();
            $("#videoPane").show();
        });
        $('#imFA').click(function () {
            $("#videoPane").hide();
            $("#chat").show();
        });
        $('#phoneFA').click(function () {
        	pstncall();
            $("#videoPane").hide();
            $("#chat").hide();
        });
        $('#headFA').click(function () {
        	makeAudioCall();
            $("#videoPane").hide();
            $("#chat").hide();
        });
        $("#viewProfile").click(function(){
            $.ajax({
                url:   "localhost:8080/ConnectPeople/Stats/expert",
                data:  {'uname':'bar'},
                async: false
            });
        })
    });
</script>
    </body>
</html>


<div class="modal fade" id="expertModal" tabindex="-1" role="dialog" aria-labelledby="myExpertLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header login_modal_header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title" id="myExpertLabel" style="font-size:20px">Connect With me</h2>
            </div>
            <div class="modal-body login-modal">
                <!--  <p>Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required</p>-->
                <div id='call_control'>
                    <div id="mainControl">
                        <!-- user is logged in and may log out -->
                        <!--<div id="logout" style="float:right !important;" onclick="logout()">Log out-->
                        <a id="viewProfile" style="float:right !important;" href="localhost:8080/ConnectPeople/expert.jsp">View Profile</a>

                        <!------------------------------------------------------------------>
                        <!-- This DIV will hold the <VIDEO> element when it is given      -->
                        <!-- via callback from the KandyAPI (when connected to other      -->
                        <!-- user).  See comments in the remotevideoinitialized callback. -->
                        <!------------------------------------------------------------------>
                        <center>
                            <img src="img/works/item-8.jpg"
                                 style="margin-left:65px;width: 187px;height: 188px;border-radius: 179px;-webkit-border-radius: 155px;-moz-border-radius: 150px;">
                        </center>
                        <div style="padding-left:100px">
                            <div id="videoFA" class="service-icon" style="margin:20px;">
                                <i class="fa fa-video-camera fa-2x"></i>
                            </div>
                            <div id="phoneFA" class="service-icon" style="margin:20px">
                                <i class="fa fa-phone fa-2x"></i>
                            </div>
                            <div id="headFA" class="service-icon" style="margin:20px">
                                <i class="fa fa-headphones fa-2x"></i>
                            </div>
                            <div id="imFA" class="service-icon" style="margin:20px">
                                <i class="fa fa-comment fa-2x"></i>
                            </div>
                        </div>


                        <div id="videoPane" class="container" style="margin-top:80px;display:none">

                        </div>

                        <!-- login form -->
                        <div id="login" style="display:none">
                            <form id="loginForm" onsubmit="alert('This form should not be submitted!');">
                                <div class="form-group">
                                    Project API Key: <input id="domainApiId" class="form-control" type="text"
                                                            style="width:235px" value=""/>
                                </div>

                                <div class="form-group">
                                    <label for="loginId">Username: </label>
                                    <input id="loginId" class="form-control" type="text" style="width:200px;" value=""
                                           placeholder="username (e.g. user1)"/>
                                </div>
                                <div class="form-group">
                                    <label for="passwd">Password: </label>
                                    <input id="passwd" class="form-control" type="password" style="width:200px"
                                           value=""/>
                                </div>
                                <div clas="form-group">
                                    <input id="loginBtn" class="btn btn-primary" type="button" value="Log in"
                                           onclick="login();return false;"/>
                                </div>
                            </form>
                        </div>

                        <!-- user is logged in, but not on call -->
                        <div id="readyForCalling" style="display:none">
                            <form name="callOutForm" onsubmit="alert('this form should never submit');">
                                <div class="form-group">
                                    <label for="callOutId">User to Call: </label>
                                    <input id="callOutId" class="form-control" type="text" value=""
                                           placeholder="username@domain.com"/>
                                    <input id="callBtn" class="btn btn-primary" type="submit" value="Call"
                                           onclick="makeCall(this);return false;"
                                           style="width:52px;"/>
                                </div>
                            </form>
                        </div>

                        <!-- receiving a call, but haven't answered yet -->
                        <div id="someonesCalling" style="display:none" class="form-group">
                            <label for="callOutId">Incoming Call</label>

                            <input id="answerVideoCallBtn" class="btn btn-primary" type="button" value="Answer"
                                   onclick="answerVideoCall()" />
                            <input id="rejectCallBtn" class="btn btn-primary" type="button" value="Decline"
                                   onclick="rejectCall()" />
                            <input id="otherPartyName" type="hidden"/>
                        </div>

                        <!-- initiated call, waiting for it to be answered -->
                        <div id="callingOut" class="form-group" style="display:none">
                            <input id="hangUpCallOutBtn" class="btn-btn-primary" type="button" value="End Call"
                                   onclick="hangUpCall()"/>
                        </div>

                        <!-- user is on an active call -->
                        <div id="onCall" style="display:none" class="form-group">
                            <input id="holdBtn" type="button" value="Hold" onclick="holdCall()"
                                   style="width:90px;height:23px;"/>
                            <input id="unholdBtn" type="button" value="Unhold" onclick="unholdCall()"
                                   style="width:90px;height:23px;"/>
                            <input id="hangUpBtn" type="button" value="End Call" onclick="hangUpCall()"
                                   style="width:90px;height:23px;"/>
                        </div>
                    </div>

                    <div id="status" style="text-align:center;width:100%" class="form-group">
                        <span class="statusLabel"></span><span id="statusMsg"></span>
                    </div>
                </div>
                <div id="chat" style="display:none">
                    <form id="imForm" onsubmit="return false;">
                        <div class="">
                            <!--<label for="imToContact">User to Contact: </label><input id="imToContact" class="form-control" type="text"/></input>-->
                        </div>
                        <div class="">
                            <!--<label for="imMessageToSend">Message: </label>-->
                            <textarea id="imMessageToSend" class="form-control" type="text"></textarea>
                        </div>

                        <input type="submit" class="btn btn-primary" style="margin-top:10px" onclick="sendIm();return false;" value="Send"/>
                    </form>
                    <div id="messages" style="width:500px" class="form-group"></div>
                </div>

                <div class="clearfix"></div>

                <div class="clearfix"></div>


            </div>
            <div class="modal-footer login_modal_footer">
            </div>
        </div>
    </div>
</div>
<!--new change end-->


