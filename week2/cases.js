const factorial = n => {
    if(n === 0) return 1;

    let result = 1;
    while(n>1){
        result *= n;
        n--;
    }
    return result;
};

const permutation = (n,r) => {
    return factorial(n) / factorial(n-r);
};

const combination = (n,r) => {
    return factorial(n) / (factorial(n-r)*factorial(r));
};

const multiPermutation = (n,r) => {
    return n ** r;
};

const multiCombination = (n,r) => {
    return combination(n+r-1, r);
};

module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination
};