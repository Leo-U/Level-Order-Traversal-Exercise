## Time and Space Complexity

Here I attempt to learn and define time and space complexity in the context of level-order traversal (level-order traversal is another term for breadth-first search).

### Time Complexity

Let's start with the basics. Why is it called time complexity? You look up the definition and the first thing it says is that time complexity is the amount of time it takes to run an algorithm. But then why call it time "complexity" if it's just an amount of time? To answer that question, you have to first understand that time complexity is a measure of how the running time of an algorithm scales with respect to the size of the input data. Now that you understand that, the answer to the question "why is it called time complexity?" is that the time an algorithm takes can be more complex than just a simple linear function of the input size. The slope might curve up more dramatically, leading to runaway memory cost. 

However, in the case of a binary tree, the relationship is linear, represented by what's called the "big O" notation. The time of complexity of level-order traversal of a binary tree is expressed as O(n).

### Space Complexity

So, if time complexity is the amount of time it takes to finish an algorithm in respect to input size, is space complexity the amount of space required to finish an algorithm in respect to input size?

Yes, it is. More specifically, it's the rate of growth of memory with respect to input size.

Level-order traversal has linear space complexity as well as linear time complexity. The space complexity can also be expressed as O(n).