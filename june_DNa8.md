Thank you for your helpful comments! We appreciate your comments about the interest and intuitiveness of our method’s usefulness in practice, and the thoroughness of our experiments. We address your questions below, including several new analyses following your suggestions.


> __Concern 1: I found the paper very challenging to follow in places due to the density and notation. Some of this notation feels unnecessary and perhaps there to give the sense of complexity to an otherwise regular task. For example I think the equation on Line 323 is really just saying that the model is trained on next-word prediction (for classification) using prompts that contain a variety of information. Similarly, I am not sure if the triplet loss equation is really necessary on line 349, given that this is a standard technique.__


We have carefully designed the expression of the formula to ensure that it is concise and clear, especially for the input of the models.
- Line 323: Classification task supported by three different configurations of input (three prefixes correspond to three different inputs), so we design $f_{class}(*,a_i,\_)$ given a prompt * (e.g., $p_{1}$, $p_{2}$, $p_{3}$) and a placeholder `$\_$' (\varnothing, r_i, n_i). 

> 
> 
