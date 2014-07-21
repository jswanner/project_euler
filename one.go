package main

import (
	"fmt"
	"math"
)

// sum multiples of 3 or 5 under 1000
func main() {
	divisors := []uint{3, 5}
	multiples := findMultiples(divisors, 1000)
	sum := sum(multiples)
	fmt.Println(multiples)
	fmt.Println(sum)
}

func findMultiples(divisors []uint, ceil uint) (multiples []uint) {
	current := ceil - 1
	for current > 0 {
		if isMultipleOf(divisors, current) {
			multiples = append(multiples, current)
		}
		current--
	}
	return
}

func isMultipleOf(divisors []uint, num uint) (isMultiple bool) {
	for _, v := range divisors {
		isMultiple = math.Mod(float64(num), float64(v)) == 0.0
		if isMultiple {
			break
		}
	}
	return
}

func sum(list []uint) (sum uint) {
	for _, v := range list {
		sum += v
	}
	return
}
