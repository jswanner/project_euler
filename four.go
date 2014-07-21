package main

import (
	"fmt"
	"strconv"
)

// largest palindrome made from the product of two 3-digit numbers
func main() {
	pairs := make(chan []uint)
	palindromes := make(chan []uint)
	go genPairs(pairs, uint(999), uint(100))
	go filterPalindromes(pairs, palindromes)
	fmt.Println(largest(palindromes))
}

func filterPalindromes(in chan []uint, out chan []uint) {
	for pair := range in {
		if isPalindrome(pair) {
			out <- pair
		}
	}
	close(out)
}

func genPairs(out chan []uint, ceiling uint, floor uint) {
	for i := ceiling; i >= floor; i-- {
		for j := i-1; j >= floor; j-- {
			out <- []uint{i, j}
		}
	}
	close(out)
}

func isPalindrome(pair []uint) (out bool) {
	product := uint64(pair[0] * pair[1])
	str := strconv.FormatUint(product, 10)
	head, tail := 0, len(str) - 1

	out = true
	for tail > head && out == true {
		out = str[head] == str[tail]
		head++
		tail--
	}
	return
}

func printer(in <-chan []uint) {
	for pair := range in {
		fmt.Println(pair)
	}
	return
}

func largest(in <-chan []uint) (largest []uint) {
	largest = []uint{0, 0}
	for pair := range in {
		if (pair[0] + pair[1]) > (largest[0] + largest[1]) {
			largest = pair
		}
	}
	return
}
