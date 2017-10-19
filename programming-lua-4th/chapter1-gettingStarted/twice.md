```lua
➜  chapter1-gettingStarted lua5.3 -llib1 -e "print(twice(4))" 
8.0
➜  chapter1-gettingStarted lua5.3 
Lua 5.3.4  Copyright (C) 1994-2017 Lua.org, PUC-Rio
> dofile("lib1")
cannot open lib1: No such file or directory
stack traceback:
	[C]: in function 'dofile'
	stdin:1: in main chunk
	[C]: in ?
> dofile("lib1.lua")
> twice(5)
10.0
> ^D
```
