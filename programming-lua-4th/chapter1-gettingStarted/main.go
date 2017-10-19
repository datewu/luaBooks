package main

import "fmt"

func main() {
	l := make(map[int]string)
	l[44] = "dfsf"
	for _, s := range l {
		fmt.Println(s)
	}
}
