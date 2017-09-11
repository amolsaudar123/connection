package connection

import grails.transaction.Transactional


@Transactional
class DashboardService {

    List<AccountSummary> calculateBalance() {
        List<AccountSummary> accountSummaries = new ArrayList<>()

        Account.findAll().each { account ->
            Integer totalSpend = Expense.findAllByAccount(account).sum { expense -> expense.amount }
            int currentBalance = totalSpend ? account.initialBalance.intValue() - totalSpend.intValue() :account.initialBalance
            accountSummaries.add(new AccountSummary(account: account, balance: (currentBalance )))
        }
        accountSummaries
    }
}
