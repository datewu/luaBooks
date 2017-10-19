function name2node (graph, name)
	local node = graph[name]
	if not node then
		node = {name = name, adj = {}}
		graph[name] = node
	end
	return node
end

function readGraph ()
	local graph = {}
	for line in io.lines() do
		-- split line in two names
		local nameForm, nameTo = string.match(line, "(%S+)%s+(%S+)")
		-- find corresponding nodes
		local from = name2node(graph, nameForm)
		local to = name2node(graph, nameTo)
		--  adds 'to' to the adjacent set of 'from'
		from.adj[to] = true
	end
	return graph
end


function findPath (curr, to, path, visited)
	path = path or {}
	visited = visited or {}
	if visited[curr] then -- node already visited, no path here
		return nil
	end
	visited[curr] = true -- mark node as visited
	path[#path +1 ] = curr -- addd it to path
	if curr == to then -- final node, return path
		return path
	end
	-- try all adjacent nodes
	for node in pairs(curr.adj) do
		local p = findPath(node, to, path, visited)
		if p then return p end
	end
	table.remove(path) -- remove the last element in path
end

function printPath (path)
	for i = 1, #path do
		print(path[i].name)
	end
end

io.input("graph.txt")
g  = readGraph()

a = name2node(g, "lol")
b = name2node(g, "dota")
p = findPath(a, b)
print("form",a.name, "to", b.name)
if p then
	printPath(p)
else
	print("no path found")
end

