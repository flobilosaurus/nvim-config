local global = vim.g

global["test#strategy"] = {
	nearest = "floaterm",
	file = "floaterm",
	suite = "floaterm",
}

-- go test configuration
global["test#go#gotest#options"] = "-v"
