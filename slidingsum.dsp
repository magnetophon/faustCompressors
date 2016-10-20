import("slidingReduce.lib");

sumNr = int(hslider("sum number", 1, 1, 514228 , 1):max(0));
// sumNr = int(hslider("sum number", 1, 0, 2^19 , 1):max(0));
index = int(hslider("index", 1, 0, maxNrBits , 1));

// process(x) = slidingReduce(sumNr,2^19,max,-INFINITY,x);
// process(x) = slidingReduce(sumNr,2^19,+,0,x);
// process = int2fibonacci(21);
// process(x) =
// fixedFibonacciOp(0,max,0,x),
// fixedFibonacciOp(1,max,0,x),
// fixedFibonacciOp(2,max,0,x),
// process(x) = fixedFibonacciOps(maxNrBits,max,-INFINITY,x):par(i, maxNrBits+1, _*(i==index)):>_;
// fixedFibonacciOp(4,max,0,x);
// fixedFibonacciOp(5,max,0,x);

// process(x) = sumNr;

process(x) = fibReduce(sumNr,maxNrBits,+,0,x) ;
// process(x) = fibReduce(sumNr,maxNrBits,max,-INFINITY,x) ;

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
