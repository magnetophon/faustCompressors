# faustCompressor
A library of compressor building blocks, compressors and some general utilities.


## Features:

- Any number of channels
- Can work as a hard limiter, and beyond.
- Adjustable link, from multi mono to fully linked.
- Adjustable knee
- True RMS detector with highly optimized algorithm
- Feed forward, feed back, and various hybrids available
- attack/release switchable to before or after the gain-calculator,
  turning it from a linear return-to-zero detector
  to a log domain return-to-threshold detector
