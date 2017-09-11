package connection

class DashboardController {

    def dashboardService

    def onLogin() {



        def spending = Expense.list()
        def accountDetails=Account.list()
        List<AccountSummary> accountSummaries = dashboardService.calculateBalance()
        render(view: 'onLogin', model: [spending: spending, accountDetails:accountDetails, accountSummaries:accountSummaries])


    }

}