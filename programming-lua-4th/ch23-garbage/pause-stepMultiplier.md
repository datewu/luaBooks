> The two parameters pause and stepmul control the collector's character. Any garbage collector trades
memory for CPU time. At one extreme, the collector might not run at all. It would spend zero CPU time,
at the price of a huge memory consumption. At the other extreme, the collector might run a complete cycle
after every single assignment. The program would use the minimum memory necessary, at the price of
a huge CPU consumption. The default values for pause and stepmul try to find a balance between
those two extremes and are good enough for most applications. In some scenarios, however, it is worth
trying to optimize them.


The pause parameter controls how long the collector waits between finishing a collection and starting
a new one. A pause of zero makes Lua start a new collection as soon as the previous one ends. A pause
of 200% waits for memory usage to double before restarting the collector. We can set a lower pause if
we want to trade more CPU time for lower memory usage. Typically, we should keep this value between
0 and 200%.

The step-multiplier parameter (stepmul) controls how much work the collector does for each kilobyte of
memory allocated. The higher this value the less incremental the collector. A huge value like 100000000%
makes the collector work like a non-incremental collector. The default value is 200%. Values lower than
100% make the collector so slow that it may never finish a collection.


The other options of collectgarbage give us control over when the collector runs. Again, the default
control is good enough for most programs, but some specific applications may benefit from a manual
control. Games often need this kind of control. For instance, if we do not want any garbage-collection
work during some periods, we can stop it with a call collectgarbage("stop") and then restart it
with collectgarbage("restart"). In systems where we have periodic idle phases, we can keep
the collector stopped and call collectgarbage("step", n) during the idle time. To set how much
work to do at each idle period, we can either choose experimentally an appropriate value for n or call
collectgarbage in a loop, with n set to zero (meaning minimal steps), until the idle period expires.
