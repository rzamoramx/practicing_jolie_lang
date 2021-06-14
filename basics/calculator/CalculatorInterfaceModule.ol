
// in jolie the first contract approach is used
// so, we defined the types and operations first
type SumRequest: void {
    // in Jolie the node of data structure can be a vector, in this 
    // case, term is a vector of ints that minimum occurrences is one and 
    // maximum occurences infinite
    term[1,*]: int
}

// in Jolie the data type structures are a tree of nodes
// in this case, we have two, minuend and subtraend
type SubRequest: void {
    minuend: int
    subtraend: int
}

type MulRequest: void {
    factor*: double
}

type DivRequest: void {
    dividend: double
    divisor: double
}

interface CalculatorInterface {
    RequestResponse:
        sum(SumRequest)(int),
        sub(SubRequest)(int),
        mul(MulRequest)(double),
        div(DivRequest)(double),
        shutdown
}