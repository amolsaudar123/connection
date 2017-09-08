<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 28-08-2017
  Time: PM 02:48
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>PEA:DashBoard</title>

    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'account.css')}" type="text/css">
    <asset:stylesheet src="dashboard.css"/>
    <asset:stylesheet src="table2.css"/>
    <asset:stylesheet src="onLoad.css"/>
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'mainPage.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'verticalMenu.css')}" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Cherry Swash' rel='stylesheet'>
</head>
<body >
<div class="mainContainer">
    <div class="topHeader">
        <div class="logoHeader">

            <asset:image class="logo" src="personalLogo.PNG"></asset:image>
            <div class="projectTitle">Personal Expense Analyzer</div>
            <div class="navbar1">
                <g:link action="logout" controller="login">Logout</g:link>
                <a href="#profile">Welcome ${session.user}  |</a>

            </div>
        </div>
    </div>
    <!--LeftSide Menu Starts-->
    <nav class="navbar navbar-default sidebar" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Dashboard<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home "></span></a></li>
                    <li ><g:link controller="account" action="index" >Account<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
                    <li ><g:link controller="expense" action="index1">Expense<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link> </li>
                    <li ><g:link action="index" controller="reminder">Reminder<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></g:link></li>

                </ul>
            </div>
        </div>
    </nav>
    <!--LeftSide Menu End-->
    <div class="accountDetail">Hi, ${session.user} Check Your Spending  </div>
    <table class="table-two" border="3">
        <thead>

        <tr>
            <th>Spent On</th>
            <th>Amount</th>

        </tr>
        </thead>
        <tbody>

        <g:each in="${spending}" status="i" var="spendings" controller="dashboard">
            <tr>
                <td>${spendings.tag}</td>
                <td>${spendings.amount}</td>

                %{--<td><g:link action="delete"  controller="dashboard" id="${dashboards.id}">Delete</g:link></td>--}%
            </tr>
        </g:each>
        </tbody>
    </table>

        <div class="accountDetail2"><b> Account Balance </b>  </div>
    <table class="table-three" border="3">
        <thead>

        <tr>
            <th>Bank Name</th>
            <th>Account Number</th>
            <th>Current Balance</th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${accountSummaries}"  status="i" var="ac" controller="dashboard">
            <tr>
                <td>${ac.account.bankName}</td>
                <td>${ac.account.accountNumber}</td>
                <td>${ac.balance}
                 </td>
            </tr>
        </g:each>

        </tbody>
    </table>

</div>























%{--On Load Operation--}%
<div class="maintext">

    <div class="jquery-script-ads">
        <script type="text/javascript">
            <!--
            google_ad_client="ca-pub-2783044520727903";
            /* jQuery_demo */
            google_ad_slot = "2780937993";
            google_ad_width = 728;
            google_ad_height = 90;
            //-->
        </script>
        <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
    </div>
</div>
<div id="boxes">
    <div style="top: 199.5px; left: 551.5px; display: none;" id="dialog" class="window"> Reminder
        <div id="lorem">
            <p> Check Your Latest Reminders.</p>
        </div>
        <div id="popupfoot"> <a href="#" class="closeagree">No</a> | <br><a href="http://localhost:8080/Connection/reminder/index" class="agree" style="color:red;">Yes</a></div>
    </div>
    <div style="width: 1478px; font-size: 32pt; color:white; height: 602px; display: none; opacity: 0.3;" id="mask"></div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
<asset:javascript src="onLoad.js"/>
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>
</body>

</html>