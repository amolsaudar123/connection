package connection

import grails.transaction.Transactional

@Transactional
class ExpenseService {

    def calculateBalance() {

//        def initialBalance=Account.listOrderByInitialBalance()

//        Account.findByAccountNumber().each {
//
//        }
        //Expense.findAllByAccount().ea




    }

    List<String> getBankName() {
       Account.findAll().collect {it.bankName}
//            return bankNames.collect({it.bankName})

    }
}
