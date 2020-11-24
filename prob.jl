function probability(n::Int, x::Int, p::Number, q::Number)::Number
    # n = Number of attempts (dice rolls)
    # x = Number of times the attempt (roll) is successful
    # p = Probability of successful roll
    # q = Probability of failure
    #
    # What is the probability the number 5 will appear exactly once when I roll
    # a 6-sided dice four times?
    # n=4, x=1, p=1/6, q=5/6
    return binomial(n, x)*(p^x)*(q^(n - x))
end

function probability_at_least(n::Int, p::Number, q::Number)::Number
    # n = Number of attempts (dice rolls)
    # x = Number of times the attempt (roll) is successful
    # p = Probability of successful roll
    # q = Probability of failure
    #
    # What is the probability the number 5, will appear at least once when I roll a 6-sided dice four times?
    # This is provided by the sum of the probabilities of a 5 appearing once, twice, three times, or all four times
    # probability(4, 1, 2/6, 4/6) + probability(4, 2, 2/6, 4/6) + probability(4, 3, 2/6, 4/6) + probability(4, 4, 2/6, 4/6)
    return mapreduce(f->probability(n, f, p, q), +, [1:n;])
end

println("Probability of at least one dice being 15 or higher when rolling 4 D20: ", round(probability_at_least(4,6/20,14/20)*100))
println("Probability of only one dice being 15 or higher when rolling 4 D20: ", round(probability(4,1,6/20,14/20)*100))
println("Probability of two dice being 15 or higher when rolling 4 D20: ", round(probability(4,2,6/20,14/20)*100))
