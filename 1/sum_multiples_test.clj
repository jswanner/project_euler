(ns sum-multiples-test
  (:use [sum-multiples])
  (:use [clojure.test]))

(deftest test-is-multiple-of
  (is (= false
         ((is-multiple-of 1) 3)))
  (is (= true
         ((is-multiple-of 3) 3)))
  (is (= false
         ((is-multiple-of 4) 3)))
  (is (= true
         ((is-multiple-of 6) 3)))
  (is (= false
         ((is-multiple-of 1) 5)))
  (is (= false
         ((is-multiple-of 3) 5)))
  (is (= true
         ((is-multiple-of 5) 5)))
  (is (= false
         ((is-multiple-of 6) 5)))
  (is (= true
         ((is-multiple-of 10) 5))))

(deftest test-is-multiple-of-some
  (is (= false
         (is-multiple-of-some [3 5] 1)))
  (is (= false
         (is-multiple-of-some [3 5] 2)))
  (is (= true
         (is-multiple-of-some [3 5] 3)))
  (is (= false
         (is-multiple-of-some [3 5] 4)))
  (is (= true
         (is-multiple-of-some [3 5] 5)))
  (is (= true
         (is-multiple-of-some [3 5] 6)))
  (is (=
         (is-multiple-of-some [3 5] 7)))
  (is (= false
         (is-multiple-of-some [3 5] 8)))
  (is (= true
         (is-multiple-of-some [3 5] 9)))
  (is (= true
         (is-multiple-of-some [3 5] 10))))

(deftest test-find-multiples-10
  (is (= [3 5 6 9]
         (find-multiples [3 5] 10))))

(deftest test-find-multiples-15
  (is (= [3 5 6 9 10 12]
         (find-multiples [3 5] 15))))

(deftest test-find-multiples-20
   (is (= [3 5 6 9 10 12 15 18]
          (find-multiples [3 5] 20))))

(deftest test-sum-multiples-10
  (is (= 23
         (sum-multiples [3 5] 10))))

(deftest test-sum-multiples-15
  (is (= 45
         (sum-multiples [3 5] 15))))

(deftest test-sum-multiples-20
   (is (= 78
          (sum-multiples [3 5] 20))))

(run-tests)
