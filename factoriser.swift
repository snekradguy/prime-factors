import Glibc

print("Alpha 2.0")

enum ValueError: Error {
    case tooSmall
}

func checkPrime(number: Int) throws -> Bool {
    if number <= 1 {
        throw ValueError.tooSmall
    }
    if number == 2 || number == 3 {
        return true
    }
    
    let root = sqrt(Double(number))
    for factor in 2...Int(floor(root)) {
        if number % factor == 0 {
            return false
        }
    }
    return true
}

func findFactors(number: Int) -> (Array<Int>, Array<Int>) {
    var primes: [Int] = []
    var exponents: [Int] = []
    primes.append(3)
    exponents.append(2)
    primes.append(5)
    exponents.append(1)
    return (primes, exponents)
}

print("Number to break into prime factors:")
let userInput: Int! = Int(readLine()!)

do {
    let isPrime = try checkPrime(number: userInput)
    print(isPrime)
} catch ValueError.tooSmall {
    print("Value cannot be equal to or smaller than 1")
}

let (primeFactors, factorExponents) = findFactors(number: userInput)

print(primeFactors)
print(factorExponents)
