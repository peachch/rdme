Thank you for your helpful comments! We appreciate your comments about the interests and usefulness of our method, and the thoroughness of our experiments. We address your questions below, including several new analyses following your suggestions.


> __Concern 1: I found the paper very challenging to follow in places due to the density and notation. Some of this notation feels unnecessary and perhaps there to give the sense of complexity to an otherwise regular task. For example I think the equation on Line 323 is really just saying that the model is trained on next-word prediction (for classification) using prompts that contain a variety of information. Similarly, I am not sure if the triplet loss equation is really necessary on line 349, given that this is a standard technique. While I do appreciate the goal of precision, the heavy use of notational definitions and equations takes up significantly more space, often at the expense of clarity for later parts. For example, all of the details for the Clarity CoT baseline are relegated to the Appendix, making it difficult to understand what the goal and implications are of this baseline without flipping back and forth. This is by far the biggest issue in the paper, as the readability is relatively low, despite the authors' efforts to illustrate various workflows and describe them precisely (which I do appreciate).__

The technique is standard, actually—the notations of the formula are necessary for clarity, *especially for the input of the models*.
  - Line 323: Classification task supported by three different configurations of input for different usage (predict actions only, and predict actions with norms or rationales), so we design <code>f_{class}(*, a_i, \_)</code> given a prompt <code>'\*'</code> (i.e., $p_1$, $p_2$ and $p_3$) and a placeholder <code>'\_'</code> (i.e., ∅, r_i and n_i).
  - Line 349: Similar to the above, the triplet_loss formula highlights the correspondence between the triplets. Anchor: $a_m^{n_i}$, positive: $a_{im}^{n_i}$ and negative: $a_m^{n_j}$. Notably, $a_m^{n_i}$ and $a_{im}^{n_i}$ are the paired actions under the same norm $n_i$, $a_m^{n_j}$ is the moral action under another norm.

ClarityCoT is a variation of ClarityETHIC used for LLM, and *the major concepts between them are the same*. Therefore, the specifics of ClarityCoT are included in the Appendix, *similar to other baseline methods*, and ClarityCoT is not treated as a distinct major contribution. 

> 

> 
