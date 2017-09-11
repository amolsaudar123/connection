package connection

class ExpenseController {
def expenseService


    def index1(){
        def expense=Expense.list()
        List<String> bankNames = expenseService.getBankName()
        render(view: 'index1', model: [bankNames:bankNames,expense: expense])
    }

    def save(){
        def newExpense=new Expense(params)
        newExpense.account = Account.findByBankName(params.bankName)
        newExpense.save()
        redirect action: "index1", controller: "expense"

    }

    def delete (Long id){
        def deleteExpense = Expense.get(params.id)
        deleteExpense.delete flush: true, failOnError: true
        redirect action: "index1", controller: "expense"
    }

}
