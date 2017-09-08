package connection

class AccountController {

    def index() {
    def account=Account.list()
        [account:account]
    }
    def save() {
        def newAc = new Account(params)
        newAc.save()
        redirect action: "index", controller: "account"
    }
    def delete (Long id){
        def deleteAccount = Account.get(params.id)
        deleteAccount.delete flush: true, failOnError: true
        redirect action: "index", controller: "account"
    }
}

