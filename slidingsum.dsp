import("slidingReduce.lib");

sumNr = int(hslider("sum number", 1, 0, 514228 , 1):max(0));
index = int(hslider("index", 1, 0, maxNrBits , 1));

// process = slidingSumN(sumNr,8);
// process = int2fibonacci(21);
// process(x) = fixedFibonacciOp(8,max,0,x) ;
// process(x) = FibonacciOp(7,max,-INFINITY,x) ;
// process(x) = sumNr;

process(x) = fibReduce(sumNr,maxNrBits,max,-INFINITY,x) ;


// process = par(i,maxNrBits, int2FibonacciIndexOfLargestPart(i):hbargraph("index %i", 0, maxNrBits));
// process =
// Fibonacci2int(index):hbargraph("int", 0, maxNrBits);
// (int2FibonacciFloat(index):hbargraph("float", 0, maxNrBits)),
// (Fibonacci2int(int2FibonacciFloored(index)):hbargraph("int", 0, maxNrBits)),
// (int2FibonacciFloored(index):hbargraph("floored", 0, maxNrBits)),
// (int2FibonacciIndexOfLargestPart(sumNr):hbargraph("index", 0, maxNrBits));

// process(x)  = fixedFibonacciOp(21,max,-INFINITY,x);
// process = Fibonacci2int(sumNr): hbargraph("fib",0,10946);

// process = Fibonacci2intSeq(sumNr,22): hbargraph("fib",0,10946);
// process = (sumNr/10):(_+0.5:floor) : hbargraph("fib",0,2);

// process = par(i, 21, pow(2,i)* (i==sumNr)):> hbargraph("fib",0,10946);
// process =  Fibonacci2int(sumNr): hbargraph("fib",0,10946);

// process = int2FibonacciIndexOfLargestPart(7);
// process = Fibonacci2int(int2FibonacciFloored(7));
// process = Fibonacci2int(int2FibonacciIndexOfLargestPart(3));
// process = isFibonacci(8);
// process = par(j, int2FibonacciIndexOfLargestPart(maxN)+1, int2FibonacciIndexOfLargestPart(Fibonacci2int(j) )

// process(i) = FibonacciTable(i);
// process =  Fibonacci2intRecurive(21);
// process = Fibonacci2intSeq(sumNr,28);
// process = Fibonacci2int(sumNr);
// process =  Fibonacci2int(int(time:min(tablesize)));
// process =  Fibonacci2int(tablesize);
