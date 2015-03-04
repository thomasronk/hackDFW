<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MrAdvisor</title>

    <!-- Bootstrap Core CSS -->
    
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    
	<script type="text/javascript" src="js/jquery.jqplot.min.js"></script>
	<script type="text/javascript" src="js/jqplot.barRenderer.min.js"></script>
	<script type="text/javascript" src="js/jqplot.categoryAxisRenderer.min.js"></script>
	<script type="text/javascript" src="js/jqplot.pointLabels.min.js"></script>

    <script>
    $(document).ready(function(){
    	var s1 = [20,25,30,40,10,35,40];
    	var s2 = [50,15,42,30,24,18,24];
    	var s3 = [35,28,32,30,16,27,30];
    	var s4 = [34,28,32,50,40,25,30];
        var ticks = ['Aug','Sept', 'Oct', 'Nov', 'Dec','Jan','Feb'];
        plotChart('chart1',ticks,s1);
        plotChart('chart2',ticks,s2);
        plotChart('chart3',ticks,s3);
        plotChart('chart4',ticks,s4);
    });
    
    
    function plotChart(chart,ticks,s1){
    	$.jqplot.config.enablePlugins = true;
        
         
        plot1 = $.jqplot(chart, [s1], {
            // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
            animate: !$.jqplot.use_excanvas,
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true }
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks
                }
            },
            highlighter: { show: false }
        });
        $('#'+chart).bind('jqplotDataClick', 
            function (ev, seriesIndex, pointIndex, data) {
                $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
            }
        );
    }
    </script>
   
	<!-- <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script> -->
	<script src="js/bootstrap.min.js"></script>
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/jquery.jqplot.min.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	 
    <!--Kandy script calls start change-->
    <script src="https://kandy-portal.s3.amazonaws.com/public/javascript/fcs/3.0.1/fcs.js"></script>
    <script src="https://kandy-portal.s3.amazonaws.com/public/javascript/kandy/2.1.0/kandy.js"></script>
    <script language="JavaScript">

var uiState = '';
var callId = null;
var audio = null;
var needVideo = true;
var ProjAPIKey = "DAKfeca60d26a4e4ce28638d678bd10e8be";
var userID = "user2@bstorm.com";
var pwd = "22util14e2";
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
                        $( "#incomingCall" ).trigger( "click" );
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

makeCall = function () {
    KandyAPI.Phone.makeCall('user1@bstorm.com', needVideo);
    //KandyAPI.Phone.makePSTNCall($('#callOutId').val(),null);
};

function makeVideoCall(){
    KandyAPI.Phone.makeCall('user1@bstorm.com', true);
};

function makeAudioCall(){
    KandyAPI.Phone.makeCall('user1@bstorm.com', false);
};

function pstncall(){
	KandyAPI.Phone.makePSTNCall("14086638419", null);
}
makePSTNCall = function () {
    KandyAPI.Phone.makePSTNCall(PSTNnumber, null);
};

answerVideoCall = function () {
	
    changeUIState("ANSWERING_CALL");
    KandyAPI.Phone.answerCall(callId, true);
    $("#videoPane").show();
    $("#chat").hide();
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
    var uuid = KandyAPI.Phone.sendIm('user1@bstorm.com', $('#imMessageToSend').val(),
            function (result) {
    			var name ='Prashant';
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
                         $( "#incomingCall" ).trigger( "click" );
                         $("#chat").show();
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
	  <script type="text/javascript">
    $(document).ready(function() {
    	login();
    });
    
    
</script>
	
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

<body onload="setup()">
<div id="wrapper" style="padding-left:0px;">
	 <div id="page-wrapper">

            <div class="container-fluid">
            		<div class="row">
                    <div class="col-xs-4">
                        <img style="width: 187px;height: 188px;border-radius: 179px;-webkit-border-radius: 155px;-moz-border-radius: 150px;" src="img/works/item-1.jpg">
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Prashant Prakash
                            </li>
                        </ol>
                    </div>
                     <div class="col-xs-8">
                        <p>
                        	                        </p>
                    </div>
                	</div>
                <a id="incomingCall" data-toggle="modal" data-target="#expertModal" title="Incoming Call" rel="works" style="display:none"></a>
                	
                	
                	 <div class="row">
                     <div class="col-lg-12">
                        Interest
                     </div>
                   </div>
                   
                <div class="row">
               
                    <div class="col-xs-6">
                       		<div class="panel panel-green">
                            <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> PSTN Call Statistics</h3>
                            </div>
                            <div class="panel-body">
                               <div id="chart1"></div>
                            </div>
                            </div>
                      
                    </div>
                    
                    <div class="col-xs-6">
                        	<div class="panel panel-green">
                            <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Video Call Statistics</h3>
                            </div>
                            <div class="panel-body">
                                <div id="chart2"></div>
                            </div>
                            </div>
                        
                    </div>
                 
                    
                </div>
                
                <div class="row">
               
                    <div class="col-xs-6">
                       		<div class="panel panel-green">
                            <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Audio Call Statistics</h3>
                            </div>
                            <div class="panel-body">
                               <div id="chart3"></div>
                            </div>
                            </div>
                      
                    </div>
                    
                    <div class="col-xs-6">
                        	<div class="panel panel-green">
                            <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Message Call Statistics</h3>
                            </div>
                            <div class="panel-body">
                                <div id="chart4"></div>
                            </div>
                            </div>
                        
                    </div>
                 
                    
                </div>
     </div>

</div>
</div>
 	


<!--changes new scripts-->
<script type="text/javascript">
    $( document ).ready(function() {
        $('#videoFA').click(function () {
            console.log("helloooo");
            $("#chat").hide();
            $("#videoPane").show();
        });
        $('#imFA').click(function () {
            $("#videoPane").hide();
            $("#chat").show();
        });
        $('#phoneFA').click(function () {
            $("#videoPane").hide();
            $("#chat").hide();
        });
        $('#headFA').click(function () {
            $("#videoPane").hide();
            $("#chat").hide();
        });
    });
</script>
</body>
</html>

<!--new change start-->
<div class="modal fade" id="expertModal" tabindex="-1" role="dialog" aria-labelledby="myExpertLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header login_modal_header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title" id="myExpertLabel" style="font-size:20px">Incoming Request</h2>
            </div>
            <div class="modal-body login-modal">
                <!--  <p>Stack Overflow is a question and answer site for professional and enthusiast programmers. It's 100% free, no registration required</p>-->
                <div id='call_control'>
                    <div id="mainControl">
                        <!-- user is logged in and may log out -->
                        <!--<div id="logout" style="float:right !important;" onclick="logout()">Log out-->

                        <!------------------------------------------------------------------>
                        <!-- This DIV will hold the <VIDEO> element when it is given      -->
                        <!-- via callback from the KandyAPI (when connected to other      -->
                        <!-- user).  See comments in the remotevideoinitialized callback. -->
                        <!------------------------------------------------------------------>


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
                            <input id="holdBtn" class="btn btn-primary" type="button" value="Hold" onclick="holdCall()"/>
                            <input id="unholdBtn" type="button" value="Unhold" onclick="unholdCall()"/>
                            <input id="hangUpBtn" class="btn btn-primary" type="button" value="End Call" onclick="hangUpCall()"/>
                        </div>
                    </div>

                    <div id="status" style="text-align:center;width:100%" class="form-group">
                        <span class="statusLabel"></span><span id="statusMsg"></span>
                    </div>
                </div>
                <div id="chat" style="display:block">
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
