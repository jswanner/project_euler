package main

import (
	"fmt"
)

// largest prime factor of 600851475143
func main() {
	primes := make(chan int)
	factors := make(chan int)
	ceiling := 600851475143
	go prime(primes, ceiling)
	go factor(primes, factors, ceiling)
	fmt.Println(largest(factors))
}

func factor(in, out chan int, ceiling int) {
	for v := range in {
		if ceiling%v == 0 {
			fmt.Println(v)
			out <- v
		}
	}
	close(out)
}

func filter(in chan int, out chan int, prime int) {
	for v := range in {
		if v%prime != 0 {
			out <- v
		}
	}
	close(out)
}

func generate(out chan int, ceiling int) {
	out <- 2
	for i := 3; i < (ceiling / 2); i += 2 {
		out <- i
	}
	close(out)
}

func largest(in <-chan int) (largest int) {
	for v := range in {
		largest = v
	}
	return
}

func prime(out chan int, ceiling int) {
	possibles := make(chan int)
	go generate(possibles, ceiling)
	for prime := <- possibles; prime > 0 ; prime = <- possibles {
		out <- prime
		filtered := make(chan int)
		go filter(possibles, filtered, prime)
		possibles = filtered
	}
	close(out)
}
