package connection

import grails.transaction.Transactional


@Transactional
class DashboardService {

    List<AccountSummary> calculateBalance(String name) {
        List<AccountSummary> accountSummaries = new ArrayList<>()

//        Account.findAll().each { account ->
//            Integer totalSpend = Expense.findAllByAccount(account).sum { expense -> expense.amount }
//            int currentBalance = totalSpend ? account.initialBalance.intValue() - totalSpend.intValue() :account.initialBalance
//            accountSummaries.add(new AccountSummary(account: account, balance: (currentBalance )))
//        }
//        accountSummaries

        Account.findAllByUserName(name).each {account ->
            Integer totalSpend = Transaction.findAllByAccountAndType(account,"expense").sum { expense -> expense.amount }
            Integer totalEarn = Transaction.findAllByAccountAndType(account,"income").sum { income -> income.amount }
                    //Expense.findAllByAccount(account).sum { expense -> expense.amount }
            
            int currentBalance = totalSpend ? account.initialBalance.intValue() - totalSpend.intValue() :account.initialBalance
            currentBalance = totalEarn ? currentBalance + totalEarn.intValue() :currentBalance

            accountSummaries.add(new AccountSummary(account: account, balance: (currentBalance )))
        }
        accountSummaries
    }
}
