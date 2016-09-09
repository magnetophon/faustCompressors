import("slidingReduce.lib");

sumNr = int(vslider("sum number", 8, 0, 27, 1));

// process = slidingSumN(sumNr,8);
// process = int2fibonacci(21);
// process(x) = fixedFibonacciOp(8,max,0,x) ;
// process(x) = FibonacciOp(7,max,-INFINITY,x) ;
// process(x) = fibReduce(7,21,max,-INFINITY,x) ;
// process = int2FibonacciIndexOfLargestPart(7);
// process = Fibonacci2int(int2FibonacciFloored(7));
// process = Fibonacci2int(int2FibonacciIndexOfLargestPart(3));
// process = isFibonacci(8);
// process = par(j, int2FibonacciIndexOfLargestPart(maxN)+1, int2FibonacciIndexOfLargestPart(Fibonacci2int(j) )

// process(i) = FibonacciTable(i);
// process =  Fibonacci2intRecurive(21);
// process = Fibonacci2intSeq(sumNr,28);
process = FibonacciTable(sumNr);
// process =  Fibonacci2int(int(time:min(tablesize)));
// process =  Fibonacci2int(tablesize);
