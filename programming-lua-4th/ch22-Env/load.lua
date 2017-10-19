f = load("b = 10; return a")
env = { a= 20}
debug.setupvalue(f, 1, env)
print(f(), env.b)


-- or

prefix = "_ENV = ...; "
f = loadwithprefix(prefix, io.lines(filename, "*L"))
env1 = {}
env2 = {}
env3 = {}

f(env1)
f(env2)
f(env3)

