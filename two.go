package main

import (
	"fmt"
	"math"
)

// sum of even fib numbers under 4M
func main() {
	fibs := make(chan int)
	evens := make(chan int)
	go fib(fibs, 4000000)
	go even(fibs, evens)
	sum := sum(evens)
	fmt.Println(sum)
}

func even(in, out chan int) {
	for v := range in {
		if math.Mod(float64(v), float64(2)) == 0.0 {
			out <- v
		}
	}
	close(out)
}

func fib(out chan int, ceiling int) {
	left, right := 1, 2
	out <- left

	for right < ceiling {
		out <- right
		left, right = right, (left + right)
	}
	close(out)
}

func sum(in <-chan int) (sum int) {
	for v := range in {
		sum += v
	}
	return
}
