Thank you for your helpful comments! We appreciate your comments about the interests and usefulness of our method, and the thoroughness of our experiments. We address your questions below, including several new analyses following your suggestions.


> __Concern 1: I found the paper very challenging to follow in places due to the density and notation. Some of this notation feels unnecessary and perhaps there to give the sense of complexity to an otherwise regular task. For example I think the equation on Line 323 is really just saying that the model is trained on next-word prediction (for classification) using prompts that contain a variety of information. Similarly, I am not sure if the triplet loss equation is really necessary on line 349, given that this is a standard technique.__

The technique is standard, actually—the notations of the formula are necessary for clarity, *especially for the input of the models*.
  - Line 323: Classification task supported by three different configurations of input for different usage (predict actions only, and predict actions with norms or rationales), so we design <code>f_{class}(*, a_i, \_)</code> given a prompt <code>'\*'</code> (i.e., $p_1$, $p_2$ and $p_3$) and a placeholder <code>'\_'</code> (i.e., ∅, r_i and n_i).
  - Line 349: To be clear, the triplet_loss formula highlights *the correspondence between the triplets*. Anchor: $a_m^{n_i}$, positive: $a_{im}^{n_i}$ and negative: $a_m^{n_j}$. Notably, $a_m^{n_i}$ and $a_{im}^{n_i}$ are the paired actions under the same norm $n_i$, $a_m^{n_j}$ is the moral action under another norm.

> __Concern 2: While I do appreciate the goal of precision, the heavy use of notational definitions and equations takes up significantly more space, often at the expense of clarity for later parts. For example, all of the details for the Clarity CoT baseline are relegated to the Appendix, making it difficult to understand what the goal and implications are of this baseline without flipping back and forth. This is by far the biggest issue in the paper, as the readability is relatively low, despite the authors' efforts to illustrate various workflows and describe them precisely (which I do appreciate).__

ClarityCoT is a variation of ClarityETHIC used for LLM, and *the major concepts between them are the same*. Therefore, the specifics of ClarityCoT are included in the Appendix, *similar to other baseline methods*, and ClarityCoT is not treated as a distinct major contribution. 


> __Concern 3: The comparisons aren't always fair. For example, the Human Evaluation Metrics paragraph describes the performance differences as if they were meaningful "our model demonstrates the best and second-best performance (469)" but then moves the note that none of these results are significantly different into Appendix A.6. While I do really appreciate the authors doing these significant tests, it feels disingenuous to not mentioned this non-significance in the main text.__

There seems to be some misunderstanding here. The p-values of T5-large, Flan-T5-large, and BART-large are less than 0.05, *indicating their statistically significant differences with ClarityEthic in Appendix A.6.* 

While we reveal that our method is not significantly different from GPT-3.5, it performs comparably well, indicating that our task-specific models in small sizes are as competitive as strong LLMs. Meanwhile, the standard deviations of ClarityEthic are smaller than GPT-3.5, showing stability.

> __Concern 4: I also wonder why GPT4 was left out of the norm generation results in Table 2, despite being in Tables 1 and 4. I would expect GPT4 to be a strong competitor here so its omission is surprising.__

As Section 3.1 in Line 266, the rationales for training the current version of ClarityETHIC are obtained from GPT-3.5. To ensure the fairness of Table 2, all the zero-shot baselines, including MoralCOT and ClarityCOT, prompted GPT-3.5. 

> __Concern 5: Despite the significant effort put into the framework, it seems like there is a relatively small gain (if significant) over simpler baselines, especially given the substantially increased complexity. This is most evident with the T5-large model which is just a 0.032 F1 score behind the proposed model. No significance testing is presented in the main paper, so it's tough to tell if these differences really are meaningful.__

Our paper provides multiple metrics to facilitate a comprehensive performance evaluation of each method. T5-large lags behind ClarityETHIC by 8.7% (Accuracy) and 22.8% (F1) in the ETHICS dataset. In addition, the fine-tune baselines, including T5-large, have a larger variance than ClarityETHIC and have lower performance stability, as shown in Table 11.

> __Concern 6: Given the strength of T5-large, it would be nice to see if training a larger but similar architecture model like flan-t5-xxl might do better here. Do we just need more parameters?__
  This is an interesting research question, but it is not the primary focus of our paper. Regarding concern 3, our method provides a small-size (770M) model with competitive performance in moral judgment compared with strong LLMs.

  Based on the existing results, it seems that more parameters are not the only thing we need. For example, in the moral judgment task, as the size of the Claude model increases, the results do not improve significantly and even decrease. In addition, it is suggested that the models of GPT-3.5 (MoralCOT and ClarityCoT) have a more stable performance than GPT-4.

> Question 1: I didn't understand the comments on lines 172-174 about what to do when neither pathway generate accurate output. Could you provide more details or an example here? I'm not sure how often this happens or what is being generated. The same goes for what is the "filler function" on line 382.

  The filter function aims to select the most reasonable path, which is defined in line 369 and 376: <code>\max\{f_{class}(p_3, a_i,\hat{n}_{m}),f_{class}(p_3, a_i, \hat{n}_{{im}})\}</code> if <code>f_{class}(p_1, a_i)\!< \!\tau</code>; or <code>f_{class}(p_1, a_i)</code> otherwise.

  

> Question 2: Are any of the results in Table 3 significantly different from the best system?

> Question 3: Table 1 has the T5-Large with an 0.806 accuracy and 0.811 macro F1, while Table 3 has these as 0.811 and 0.813. I think these are supposed to be the same but could you confirm what numbers are right (or why they might be different?)

  They should be different. In Table 1, T5-large is finetuned with actions as input for classification; otherwise, in Table 3, the T5-large baseline makes judgments with action and generated norm as input to ensure fairness. Notably, the norm is generated by finetuned baseline T5-large. Therefore, the accuracy performance is increased from 0.806 to 0.811.

> Question 4: Any idea why T5-Large would have such a strong performance drop off when testing with the ETHICS dataset?

> Question 5: In table 5, the norms for the example of Logan cheating are almost the same, yet the two actions are different. Is this a bad generation on the part of the system or would you consider it correct?

  The action is the same and the rationales is different. 
