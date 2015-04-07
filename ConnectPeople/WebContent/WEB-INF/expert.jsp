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
    	var uname="abc@abc.com";
    	$.getJSON( "experts?choice=getcomments&uname="+uname, function( data ) {
				console.log(data);
				var divToAppend="";
				for(var i=0;i<data.length;i++){
            	//var divToAppend = "<figure class=\"mix work-item photography\" style=\"display: inline-block;\"><img alt=\"\" src=\"img/works/item-8.jpg\"><figcaption class=\"overlay\"><a data-toggle=\"modal\" data-target=\"#expertModal\" title=\"Connect to ME\" rel=\"works\"><i class=\"fa fa-eye fa-lg\"></i></a><h4>"+data[i].name+"</h4><p>"+data[i].location+"</p></figcaption></figure>";
                //jQuery("#MixItUp76F363").append(divToAppend);
					divToAppend+="<div class=\"row\" style = \"padding-top:10px\"><div class=\"col-xs-12\"><span><b>Name :</b></span><span>"+ data[i].who +"</span><br><span><b>Suggestion :</b></span><span>" +data[i].tag+"</span><br><span><b>Comment on place:</b></span><span> <i>"+data[i].commentPlace+" </i></span><br><span><b>Comment on user:</b></span><span> <i>"+data[i].commentUser+"</i> </span><br><button type=\"button\" class=\"btn btn-default\"><span class=\"glyphicon glyphicon-thumbs-up\" aria-hidden=\"true\"></span> Helpful</button><button type=\"button\" class=\"btn btn-default\"><span class=\"glyphicon glyphicon-thumbs-down\" aria-hidden=\"true\"></span> Not Helpful</button></div></div>";
            	}
				
				$("#review").append(divToAppend);
				
		});
    	
    	
    	$.getJSON( "experts?choice=getuserinformation&uname="+uname, function( data ) {
			console.log(data);
			$("#name-text").text(data.name);
			$("#Phone-text").text(data.phone);
			$("#Description-text").text(data.desc);
			$("#Location-text").text(data.location);
			
    	});
    	
    	
    	$("#savecomment").click(function(){ 
    	    // adding comment to DB 
    	    var uname="abc@abc.com"
    	    $.post("experts?choice=addcomments&uname="+uname+"&name="+$("#Name").val()+"&tag="+$("#Suggested-Place").val()+"&onplace="+$("#Comment-on-place").val()+"&onuser="+$("#Comment-on-user").val() ,function(data){
    	 		console.log("comments added sucessfully");
    	    });
    	  
    	 });
    });
    
    
    
</script>
	 <script type="text/javascript">
	 
	$(document).ready(function() {
		 $("#name-text").show();
		 $("#name-text-insert").hide();
		 $("#Phone-text").show();
		 $("#Phone-text-insert").hide();
		 $("#Location-text").show();
		 $("#Location-text-insert").hide();
		 $("#sex-text").show();
		 $("#sex-text-insert").hide();
		 $("#interest-text").show();
		 $("#interest-text-insert").hide();
		 $("#Description-text").show();
		 $("#Description-text-insert").hide();
		 $("#edit").show();
		 $("#save").hide();
	     $("#inlineCheckBox1").attr("disabled", true);
	  	 $("#inlineCheckBox2").attr("disabled", true);
	  	 $("#inlineCheckBox3").attr("disabled", true);
	    });
	
	$(function() {
	      $("#edit").click( function()
	           { 
		 		 $("#name-text").hide();
				 $("#name-text-insert").show();
		    	 $("#Full-Name").val($("#name-text").text());
		    	 $("#Phone-text").hide();
				 $("#Phone-text-insert").show();
				 $("#Phone-Number").val($("#Phone-text").text());
				 $("#Location-text").hide();
				 $("#Location-text-insert").show();
				 $("#Location").val($("#Location-text").text());
				 $("#sex-text").hide();
				 $("#sex-text-insert").show();
				 if($("input[type='radio'][name=inlineRadioOptions]:checked" == " Male")){
					 $("#inlineRadio1").prop("checked", true);
				 }else{
					 $("#inlineRadio2").prop("checked", true);
				 }
				 $( "#myselect option:selected" ).text($("#interest-text").text());
				 $("#interest-text").hide();
				 $("#interest-text-insert").show();
				 $("#Description-text").hide();
				 $("#Description-text-insert").show();
				 $("#textareadesp").val($("#Description-text").text());
	    	 	 $("#edit").hide();
	    	  	 $("#save").show();
	    	     $("#inlineCheckBox1").attr("disabled", false);
	    	  	 $("#inlineCheckBox2").attr("disabled", false);
	    	  	 $("#inlineCheckBox3").attr("disabled", false);
	           }
	      );
	});
	
	
$(function() {
    $("#save").click( function()
         {
		 
    	var phone=$("#Phone-Number").val();
    	var location=$("#Location").val();
    	var aboutme=$("#textareadesp").val();
    	var isPhone=1;
    	var isMessage=1;
    	var isVideo=1;
    	var isAudio=1;
    	
    	
    	
		$.post("experts?choice=updateinfo&phone="+phone+"&location="+location+"&aboutme="+aboutme+"&isphone="+isPhone+"&isAduio="+isAudio+"&isVideo="+isVideo+"&isMessage="+isMessage ,function(data){
	 		console.log("comments added sucessfully");
	    });
    	 $("#name-text").show();
		 $("#name-text-insert").hide();
    	 $("#name-text").text($("#Full-Name").val());
    	 $("#Phone-text").show();
		 $("#Phone-text-insert").hide();
		 $("#Phone-text").text($("#Phone-Number").val());
		 $("#Location-text").show();
		 $("#Location-text-insert").hide();
		 $("#Location-text").text($("#Location").val());
		 $("#sex-text").show();
		 $("#sex-text-insert").hide();
		 $("#sex-text").text($("input[type='radio'][name=inlineRadioOptions]:checked").val());
		 $("#interest-text").show();
		 $("#interest-text-insert").hide();
		 $("#interest-text").text($( "#myselect option:selected" ).text());
		 $("#Description-text").show();
		 $("#Description-text-insert").hide();
		 $("#Description-text").text($("#textareadesp").val());
		 $("#edit").show();
		 $("#save").hide();
		 $("#inlineCheckBox1").attr("disabled", true);
		 $("#inlineCheckBox2").attr("disabled", true);
		 $("#inlineCheckBox3").attr("disabled", true);
         }
    );
});

var addReview = function() {
		 	var uname="abc@abc.com"
 	    	$.post("experts?choice=addcomments&uname="+uname+"&name="+$("#Name").val()+"&tag="+$("#Suggested-Place").val()+"&onplace="+$("#Comment-on-place").val()+"&onuser="+$("#Comment-on-user").val() ,function(data){
 	 		console.log("comments added sucessfully");
 	 		$( "#review" ).prepend( "<div class=\"row\" style = \"padding-top:10px\"><div class=\"col-xs-12\"><span><b>Name : </b></span><span>"+$("#Name").val()+"</span><br><span><b>Suggestion : </b></span><span>"+$("#Suggested-Place").val()+"</span><br><span><b>Comment on place : </b></span><span> <i>"+$("#Comment-on-place").val()+"</i></span><br><span><b>Comment on user : </b></span><span> <i>"+$("#Comment-on-user").val()+"</i> </span><br><button type=\"button\" class=\"btn btn-default\"><span class=\"glyphicon glyphicon-thumbs-up\" aria-hidden=\"true\"></span> Helpful</button><button type=\"button\" class=\"btn btn-default\"><span class=\"glyphicon glyphicon-thumbs-down\" aria-hidden=\"true\"></span> Not Helpful</button></div></div>" );
    		$("#Name").val("");
    		$("#Suggested-Place").val("");
    		$("#Comment-on-place").val("");
    		$("#Comment-on-user").val("");
 	    	});
			
};
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
                    <div class="col-xs-2">
                        <img style="width: 100%;height: 188px;border-radius: 179px;-webkit-border-radius: 155px;-moz-border-radius: 150px;" src="img/works/item-1.jpg">
                    </div>
                     <div class="col-xs-10">
                       <ol class="breadcrumb">
                       	<div class="row" >
                       		<div class="col-xs-11" id="description">
	                            	<div class="row">
	                            	<div class="col-xs-6">
		                                <span><b>Name : </b></span>
		                                <span id = "name-text"><i></i></span>
		                                <span id = "name-text-insert"><input type="text" class="form-control" id="Full-Name" placeholder="Full Name" style="display: inline; width:50%;"></span>
		                            </div>
		                            <div class="col-xs-6">    
		                                <span><b>Phone Number : </b></span>
		                                <span id = "Phone-text"><i></i></span>
		                                <span id = "Phone-text-insert"><input type="text" class="form-control" id="Phone-Number" placeholder="+1923456789" style="display: inline; width:50%;"></span>
		                             </div>
	                                </div>
	                                <div class="row">
		                            	<div class="col-xs-6">
		                               	<span><b>Sex :</b></span> 
		                               	<span id = "sex-text"><i>Male</i></span>
		                               	<span id = "sex-text-insert">
		                               		<label class="radio-inline">
											  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Male"> Male
											</label>
											<label class="radio-inline">
											  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="Female"> Female
											</label>
		                               	</span>
		                               	</div>
		                               	<div class="col-xs-6">
		                               	    <input type="checkbox" name="inlineCheckOptions" id="inlineCheckBox1" value="Male"> Call
		                               	    <input type="checkbox" name="inlineCheckOptions" id="inlineCheckBox2" value="Male"> Video
		                               	    <input type="checkbox" name="inlineCheckOptions" id="inlineCheckBox3" value="Male"> Audio
			                             </div>
	                                </div>
	                                <div class="row">
		                            	<div class="col-xs-6">
			                                <span><b>Interest :</b></span> 
			                                <span id = "interest-text"><i>Bars</i></span>
			                                <span id = "interest-text-insert">
			                                	<select id = "myselect" class="form-control" style="display: inline; width:50%;">
												  <option>Bars</option>
												  <option>Restaurants</option>
												  <option>Amusements</option>
												  <option>Hangouts</option>
												  <option>Dance Floors</option>
												</select>
			                                </span>
	                                	</div>
	                                	<div class="col-xs-6">
		                                	<span><b>Location : </b></span>
			                                <span id = "Location-text"><i></i></span>
			                                <span id = "Location-text-insert"><input type="text" class="form-control" id="Location" placeholder="Dallas" style="display: inline; width:50%;"></span>
	                                	</div>
	                                </div>
	                            <span><b>Description :</b></span> 
	                            <span id = "Description-text">
	                            	<i></i>
	                            </span>
	                            <span id = "Description-text-insert"><textarea class="form-control" rows="3" id="textareadesp"></textarea></span><br>
	                            <span class = "Rating">
	                            <b>Ratings :</b>
	                            	<img style="width: 20px;height: 20px;" src="http://png-5.findicons.com/files/icons/1620/crystal_project/128/keditbookmarks.png">
	                            	<img style="width: 20px;height: 20px;" src="http://png-5.findicons.com/files/icons/1620/crystal_project/128/keditbookmarks.png">
	                            	<img style="width: 20px;height: 20px;" src="http://png-5.findicons.com/files/icons/1620/crystal_project/128/keditbookmarks.png">
	                            	<img style="width: 20px;height: 20px;" src="http://png-5.findicons.com/files/icons/1620/crystal_project/128/keditbookmarks.png">
	                            	<img style="width: 20px;height: 20px;" src="https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/star-128.png">
	                            </span>
	                            <span class = "Rating-hover">
	                            	<i>You need to complete xyz for 5 star</i>
	                            </span>
	                         </div>
                            <div class="col-xs-1">
                           	   <button type="button" class="btn btn-default" id="edit">
									  <img style="width: 20px;height: 20px;" src="https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/512/edit.png">
								</button>
								<button type="button" class="btn btn-default" id="save">
									  <img style="width: 20px;height: 20px;" src="https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/128/save.png">
								</button>
                            </div>
                          </div>
                        </ol>
                    </div>
                	</div>
                <a id="incomingCall" data-toggle="modal" data-target="#expertModal" title="Incoming Call" rel="works" style="display:none"></a>
               
               <div class="row">
	               <div class="col-xs-12">
	               		<p><br></p>
	               </div>
               </div>
               
                   
                <div class="row">
                    
                    <div class="col-xs-8">
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
                    
                    <div class="col-xs-4">
                       		<div class="panel panel-green">
                            <div class="panel-heading">
                                 <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Reviews</h3>
                            </div>
                            <div class="panel-body" style= "max-height: 660px !important;overflow: scroll;">
                                <div id="review">
                                	<!-- add all the comments here -->
                                </div>
                            </div>
                            </div>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
                            	<img style="width: 20px;height: 20px;" src="https://cdn0.iconfinder.com/data/icons/customicondesignoffice5/256/tests.png"> Write Review
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">Write a review</h4>
							      </div>
							      <div class="modal-body">
							      	<form class="form-horizontal">
									  <div class="form-group">
									    <label for="Name" class="col-sm-2 control-label">Full Name</label>
									    <div class="col-sm-10">
									      <input type="text" class="form-control" id="Name" placeholder="Full Name">
									    </div>
									  </div>
									  <div class="form-group">
									    <label for="Suggested-Place" class="col-sm-2 control-label">Suggested Place</label>
									    <div class="col-sm-10">
									      <input type="text" class="form-control" id="Suggested-Place" placeholder="Suggestion">
									    </div>
									  </div>
									  <div class="form-group">
									    <label for="Comment-on-place" class="col-sm-2 control-label">Comment on place</label>
									    <div class="col-sm-10">
									      <input type="text" class="form-control" id="Comment-on-place" placeholder="Comments...">
									    </div>
									  </div>
									  <div class="form-group">
									    <label for="Comment-on-user" class="col-sm-2 control-label">Comment on user</label>
									    <div class="col-sm-10">
									      <input type="text" class="form-control" id="Comment-on-user" placeholder="Comments...">
									    </div>
									  </div>
									</form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							        <button type="button" class="btn btn-primary" id="submit" onClick= "addReview()" data-dismiss="modal">Save changes</button>
							      </div>
							    </div>
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
