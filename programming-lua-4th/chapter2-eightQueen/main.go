package main

import (
	"fmt"
)

func main() {
	fn(1)
	fmt.Println("toatl:", to, "count:", count)
}

var count int64
var to = 6

func fn(n int) {
	if n > to {
		count++
		return
	}
	for i := 0; i < to; i++ {

		fmt.Println(n)
		fn(n + 1)
	}
}
