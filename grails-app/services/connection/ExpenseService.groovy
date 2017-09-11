package connection

import grails.transaction.Transactional

@Transactional
class ExpenseService {


    List<String> getBankName() {
       Account.findAll().collect {it.bankName}
    }
}
