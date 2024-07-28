Thank you for your helpful comments! We appreciate your comments about the interests and usefulness of our method, as well as the thoroughness of our experiments. We address your questions below, including several new analyses following your suggestions.


> __Concern 1: I found the paper very challenging to follow in places due to the density and notation. Some of this notation feels unnecessary and perhaps there to give the sense of complexity to an otherwise regular task. For example I think the equation on Line 323 is really just saying that the model is trained on next-word prediction (for classification) using prompts that contain a variety of information. Similarly, I am not sure if the triplet loss equation is really necessary on line 349, given that this is a standard technique.__

Indeed, the technique is standard, actually—the notations of the formula are necessary for clarifying the method, *especially for the input of the models*.
  - Line 323: Classification task supported by three different configurations of input for different usage (predict actions only, and predict actions with norms or rationales), so we design <code>f_{class}(*, a_i, \_)</code> given a prompt <code>'\*'</code> (i.e., $p_1$, $p_2$ and $p_3$) and a placeholder <code>'\_'</code> (i.e., ∅, r_i and n_i).
  - Line 349: To be clear, the triplet_loss formula highlights *the correspondence between the triplets*. Anchor: $a_m^{n_i}$, positive: $a_{im}^{n_i}$ and negative: $a_m^{n_j}$. Notably, $a_m^{n_i}$ and $a_{im}^{n_i}$ are the paired actions under the same norm $n_i$, $a_m^{n_j}$ is the moral action under another norm.

> __Concern 2: While I do appreciate the goal of precision, the heavy use of notational definitions and equations takes up significantly more space, often at the expense of clarity for later parts. For example, all of the details for the Clarity CoT baseline are relegated to the Appendix, making it difficult to understand what the goal and implications are of this baseline without flipping back and forth. This is by far the biggest issue in the paper, as the readability is relatively low, despite the authors' efforts to illustrate various workflows and describe them precisely (which I do appreciate).__

Thanks for your suggestion! We will consider moving it to the main body when we have more space. The reason we relegated it to the appendix was that ClarityCoT is a variation of ClarityETHIC used for LLM, and the major concepts between them are the same. Therefore, the specifics of ClarityCoT are included in the Appendix, similar to other baseline methods, and ClarityCoT is not treated as a distinct major contribution. 


> __Concern 3: The comparisons aren't always fair. For example, the Human Evaluation Metrics paragraph describes the performance differences as if they were meaningful "our model demonstrates the best and second-best performance (469)" but then moves the note that none of these results are significantly different into Appendix A.6. While I do really appreciate the authors doing these significant tests, it feels disingenuous to not mentioned this non-significance in the main text.__

Good suggestion, and we will revise it! Please see the Common Response 4. 

In addition, there seems to be some misunderstanding here. The p-values of T5-large, Flan-T5-large, and BART-large are less than 0.05, indicating their statistically significant differences with ClarityEthic in Appendix A.6.

> __Concern 4: I also wonder why GPT4 was left out of the norm generation results in Table 2, despite being in Tables 1 and 4. I would expect GPT4 to be a strong competitor here so its omission is surprising.__

  - As Section 3.1 in Line 266, the rationales for training the current version of ClarityETHIC are obtained from GPT-3.5. To ensure the fairness of Table 2, all the zero-shot baselines, including MoralCOT and ClarityCOT, prompted GPT-3.5.
  - We leave it due to the high cost. If we use GPT-4 as a baseline, we need to collect data (rationales) from GPT-4 to train ClarityEthic for a fair comparison.

> __Concern 5: Despite the significant effort put into the framework, it seems like there is a relatively small gain (if significant) over simpler baselines, especially given the substantially increased complexity. This is most evident with the T5-large model which is just a 0.032 F1 score behind the proposed model. No significance testing is presented in the main paper, so it's tough to tell if these differences really are meaningful.__

Please see the Common Response 2.

> __Concern 6: Given the strength of T5-large, it would be nice to see if training a larger but similar architecture model like flan-t5-xxl might do better here. Do we just need more parameters?__
  This is also an interesting research question, but it is not the primary focus of our paper. Our method provides a small-size (770M) model with competitive performance in moral judgment compared with strong LLMs. We hope to contribute a flexible and adjustable small model that can make accurate moral judgments and provide explanations.

  Moreover, based on the existing results, it seems that more parameters are not the only thing we need. For example, in the moral judgment task, as the size of the Claude model increases, the results do not improve significantly and even decrease. In addition, it is suggested that the models of GPT-3.5 (MoralCOT and ClarityCoT) have a more stable performance than GPT-4.

> __Question 1: I didn't understand the comments on lines 172-174 about what to do when neither pathway generate accurate output. Could you provide more details or an example here? I'm not sure how often this happens or what is being generated. The same goes for what is the "filler function" on line 382.__

  Please see Common Response 3. Meanwhile, the filter function aims to select the most reasonable path, which is defined in lines 369 and 376.


> __Question 2: Table 1 has the T5-Large with an 0.806 accuracy and 0.811 macro F1, while Table 3 has these as 0.811 and 0.813. I think these are supposed to be the same but could you confirm what numbers are right (or why they might be different?)__

  They should be different. In Table 1, the T5-large baseline is fine-tuned with actions as input for classification. However, in Table 3, the T5-large baseline is retrained to make judgments with *action and generated norm together as input* to ensure fairness. Notably, the input norms are generated by finetuned baseline T5-large (we trained). Therefore, the accuracy performance is increased from 0.806 to 0.811.

> __Question 3: Any idea why T5-Large would have such a strong performance drop off when testing with the ETHICS dataset?__
  When obtaining the results of the T5 baseline, we admit that we did not spend much effort optimizing the results. The unstable performance of the ETHICS dataset led to a poor overall average performance. When doing the binary classification task, we combined data from multiple different subcategories for joint training, and the difficulty of these data varies, as shown in Table 8. The non-representative validation may divided during training and influence the results. However, obtaining a more accurate reason may require more analysis.

> __Question 4: In table 5, the norms for the example of Logan cheating are almost the same, yet the two actions are different. Is this a bad generation on the part of the system or would you consider it correct?__

  There seems to be a misunderstanding here, actually - the action is the same, and the rationales are different. For more interpretation, please see Common Response 1. 
