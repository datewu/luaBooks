local foo
function foo() 
	print(x)
end
print(2)
_ENV = nil
foo()
