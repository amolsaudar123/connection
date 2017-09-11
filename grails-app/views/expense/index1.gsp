<%--
  Created by IntelliJ IDEA.
  User: amol.saudar
  Date: 31-08-2017
  Time: PM 03:44
--%>

<%@ page import="connection.Account" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <title>PEA:Expense</title>
    <asset:stylesheet src="acc.css"/>
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'mainPage.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'account.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'verticalMenu.css')}" type="text/css">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Cherry Swash' rel='stylesheet'>
</head>
<body>
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
                    <li><g:link action="onLogin" controller="dashboard"> Dashboard<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home "></span></g:link></li>
                    <li ><g:link action="index" controller="account" >Account<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
                    <li class="active" ><g:link action="index1" controller="expense">Expense<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
                    <li ><g:link action="index" controller="reminder">Reminder<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></g:link></li>
                      </ul>
            </div>
        </div>
    </nav>
    <!--LeftSide Menu End-->
    <div class="accountDetail">Previous Expenses</div>

    <table class="table-two" border="3">
        <thead>
        <tr>
            <th>Payee</th>
            <th>Amount</th>
            <th>Account Paid From</th>
            <th>Date</th>
            <th>Tag</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${expense}" status="i" var="expenses">
            <tr>
                <td>${expenses.payee}</td>
                <td>${expenses.amount}</td>
                <td>${expenses.account.bankName}</td>
                <td>${expenses.date}</td>
                <td>${expenses.tag}</td>
                <td><g:link action="delete"  controller="expense" id="${expenses.id}">Delete</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <script>
        $(document).ready(function(){
            $("#hide").click(function(){
                $("form").hide();
            });
            $("#show").click(function(){
                $("form").show();

            });
        });
    </script>


    <div class="newAccount">To Add new expense click the button:-

        <button  type="button" id="show" class="btn-md btn-info "> Add Expense</button>
        <button id="hide">Hide</button>
    </div>

    <g:form class="form-horizontal" id="form" role="form" action="save">
        <h4>Add Expense</h4>

        <label class="col-sm-3 control-label">Payee</label>
        <div class="col-sm-9">
            <g:textField name="payee" value="${payee}"  id="payee" placeholder="Payment Company.." class="form-control" list="company"/>
            <datalist id="company">
                <option value="MSRTC">
                <option value="MakeMyTrip">
                <option value="TajHotel">
                <option value="PMT">
                <option value="session mall">
                <option value="inGreen">
                <option value="Oberoi">
                <option value="Air India">
                <option value="SpiceJet">
            </datalist>
            <span class="help-block">name of bill company</span>
        </div>
        <label class="col-sm-3 control-label">Amount</label>
        <div class="col-sm-9">

            <g:textField name="amount" value="${amount}"  id="amount" placeholder="amount" class="form-control"/>
            <span class="help-block">amount</span>
        </div>
        <label class="col-sm-3 control-label">AccountPaidFrom</label>
        <div class="col-sm-9">
            <g:select id="bankName" class="form-control" value="${account}" name="bankName" from="${bankNames}">
            </g:select>
            <span class="help-block">Bank Name</span>
        </div>

        <label class="col-sm-3 control-label">Date</label>
        <div class="col-sm-9">

            <g:datePicker name="date" value="${date}"
            default="${new Date()}" relativeYears="[0..0]"/>
            <span class="help-block">date</span>
        </div>
    <div>
    <g:hiddenField name="userName" value="${session.user}"  class="form-control"/>
    </div>
        <label class="col-sm-3 control-label">Tag</label>
        <div class="col-sm-9">

            <g:textField name="tag" value="${tag}"  id="tag" placeholder="add tag.." class="form-control" list="tags"/>
            <datalist id="tags">
                <option value="Shopping">
                <option value="Entertainment">
                <option value="Movies">
                <option value="Dinner">
                <option value="Break Fast">
                <option value="Help">

            </datalist>
            <span class="help-block">date</span>
        </div>

        <div class="col-sm-9 col-sm-offset-3">

            <g:submitButton class="btn btn-primary btn-block" value="save" name="save" controller="expense">add expense</g:submitButton>
        </div>


    </g:form>

<!--[ footer ] -->
    <div id="footer">
        <div class="container">
            <p class="footer-block"> &copy; 2017 Personal Expense Analyzer

            &nbsp;&nbsp;&nbsp;&nbsp;

            Design by Amol <a HREF="www.sptr.co"> (SyS +)</a></p>
        </div>
    </div>
</div>

</body>
</html>
