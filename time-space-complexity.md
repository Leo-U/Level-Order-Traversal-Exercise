## Time and Space Complexity
Here I attempt to learn and define time and space complexity in the context of level-order traversal (level-order traversal is another term for breadth-first search).
<br/>
<br/>
### Time Complexity

Let's start with the basics. Why is it called time _complexity_? You look up the definition and the first thing it says is that time complexity is the amount of time it takes to run an algorithm. But then why call it time "complexity" if it's just an amount of time? To answer that question, you have to first understand that time complexity isn't simply measured in seconds or minutes -- it's a measure of how the algorithm's running time scales with respect to the size of the input data. 

Additionally, the time an algorithm takes can be more complex than just a simple linear function of the input size -- in other words, it's not just "speed increases x amount per y amount of input data". The slope might curve up more dramatically, leading to runaway memory cost. 

However, in the case of a binary tree, the relationship is linear, represented by what's called the "big O" notation. The time of complexity of level-order traversal of a binary tree is expressed as O(n).
<br/>
<br/>
### Space Complexity

So, if time complexity is the amount of time it takes to finish an algorithm in respect to input size, is space complexity the amount of space required to finish an algorithm in respect to input size?

Yes, it is. More specifically, it's the rate of growth of memory with respect to input size.

Level-order traversal has linear space complexity as well as linear time complexity. The space complexity can be expressed as O(n) in the worst or average case, and O(1) in the best case.