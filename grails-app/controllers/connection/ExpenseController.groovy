package connection

class ExpenseController {
def expenseService


    def index1(){
        //def expense=Expense.list()
        List<String> bankNames = expenseService.getBankName(session.user)
        def newList=expenseService.getByUserName(session.user)

        def expenses = Transaction.findAllByUserAndType(session.user,"expense")
        def incomes = Transaction.findAllByUserAndType(session.user,"income")

        render(view: 'index1', model: [bankNames:bankNames,expenses: expenses,incomes:incomes, newList:newList])
    }

    def save(){
        def newExpense=new Expense(params)
        newExpense.account = Account.findByBankName(params.bankName)
        newExpense.save(failOnError: true)

        Transaction transaction = new Transaction(
                account: Account.findByBankName(params.bankName),
                amount: params.amount,
                type: params.transactionType,
                date:params.date,
                tag:params.tag,
                user: session.user
        )
         if("expense".equals(params.transactionType)) {
             transaction.payee = params.payee
         }  else {
             transaction.payer = params.payee
         }

        transaction.save(failOnError: true)

        redirect action: "index1", controller: "expense"

    }

    def delete (){
        def deleteExpense = Transaction.get(params.id)
        deleteExpense.delete flush: true, failOnError: true
        redirect action: "index1", controller: "expense"
    }
    def edit(){

        def editExpense=Transaction.get(params.id)
        List<String> bankNames = expenseService.getBankName(session.user)
        [editExpense:editExpense, id:params.id, bankNames: bankNames]
    }
    def update(){
        def updateId=params.id
        def updateExpense=Transaction.get(updateId)
        updateExpense.properties=params
        updateExpense.save flush: true, failOnError: true
        redirect action: "index1", controller: "expense"
    }
    def editTransaction(){
        def editTransaction=Transaction.get(params.id)
        List<String> bankNames = expenseService.getBankName(session.user)
        [editTransaction:editTransaction, id:params.id, bankNames: bankNames]
    }
    def updateTransaction(){
        def updateId=params.id
        def updateTransaction=Transaction.get(updateId)
        updateTransaction.properties=params
        updateTransaction.save flush: true, failOnError: true
        redirect action: "index1", controller: "expense"
    }

}
