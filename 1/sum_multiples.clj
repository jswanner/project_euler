(ns sum-multiples)

(defn is-multiple-of
  ([number] (fn [divisor] (= 0
                             (rem number divisor)))))

(defn is-multiple-of-some
  ([divisors number] (not= nil
                           (some (is-multiple-of number)
                                 divisors))))

(defn find-multiples [divisors limit]
  (loop [numbers (range 1 limit)
         multiples []]
    (if (and numbers)
      (recur (next numbers)
             (let [number (first numbers)]
               (if (is-multiple-of-some divisors number)
                 (conj multiples number)
                 multiples)))
      multiples)))

(defn sum-multiples [divisors number]
  (reduce + (find-multiples divisors number)))
