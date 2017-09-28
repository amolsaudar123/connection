package connection

import grails.converters.JSON

class DashboardController {

    def dashboardService

    def onLogin() {
       def spending = Expense.findAllByUserNameLike(session.user).collect{it}

        def accountDetails=Account.findAllByUserNameLike(session.user).collect{it}
        def newUserName=session.user
        List<AccountSummary> accountSummaries = dashboardService.calculateBalance(newUserName)
        render(view: 'onLogin', model: [spending: spending, accountDetails:accountDetails, accountSummaries:accountSummaries])
    }
    def profile(){


    }
    }

