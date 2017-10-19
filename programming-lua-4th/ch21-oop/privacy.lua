function newAccount (initialBalance)
	local inner = {balance = initialBalance}

	local withdraw = function (v)
		inner.balance = inner.balance-v
	end

	local deposit = function (v)
		inner.balance = inner.balance +v
	end

	local getBalance = function() return inner.balance end

	return {
		withdraw = withdraw,
		deposit = deposit,
		getBalance = getBalance,
	}
end

a = newAccount(100)
a.withdraw(30)
print(a.getBalance())
print(a.balance)
a.balance = 33
print(a.getBalance())
print(a.balance)
