local foo
do
 local _ENV = _ENV -- preserve the ENV locally
 function foo () print(X) end
end
 X = 13
 _ENV = nil
 foo()
 X = 0
