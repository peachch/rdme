Common Response

We are grateful to all reviewers for their insightful comments. We appreciate that reviewers found ClarityEthic to be novel and interesting (Pe9C, tJvT, DNa8) the method is well-described (tJvT, Pe9C) and motivated (Pe9C).  We also appreciate that all reviewers noted that the experiments are rich and solid.

We further address each of your questions in the individual responses, in addition to four common items that we’d like to highlight here. We also provide several new results of experiments and analyses based on your suggestions. 

#### 1. Clarification of the case study in Table 5 (tJvT, gjqp).   
In Table 5, we show two types of results (with 4 specific cases), including expected and unexpected cases in the case study. The first type is the expected result - the two generators can generate the corresponding rationales (or norms) (highlighted in lime and cyan) that are consistent with the moral and immoral paths. 

The second type generates similar rationales (or norms) on two different pathways, which is a bit unexpected. *However, we would highlight that such results are still conducive to making accurate moral judgments, because the similar results of the two distinct paths could ease $f_{class}$ classification.*  Let us explain this phenomenon further: 
1) In the T5 model, the result is obtained from the interaction between the prefix and the input text. However, in such cases, *the prefix clearly has a limited influence on the generator.*  This may manifest itself in the generation of an immoral result on the moral path, such as in the example highlighted in yellow - "I told my baby I hate her when she cried." - which is unequivocally immoral in the human’s morality sense.
2) Moreover, in fine-tuning, *we use contrastive learning to bridge the generated norms using the similar rationales on the two opposite paths closer*, i.e., the example highlighted in pink - "Logan writes notes on his hand and refers to them during the exam.", which again is clearly immoral in human morality terms.

Therefore, these cases can be reasonably explained as a good thing that can help obtain accurate final moral judgments.

#### 2. Additional significant test (DNa8, tJvT).

Now, we provide the significant test result of Table 1 below, and we will add this to the main body of the paper. We utilize a dependent t-test for paired samples. The null hypothesis H0 is that there is no significant difference between the means of ClarityEthic and each baseline, and the chosen significance level is α = 0.05.
|  Model   | P-value (Accuracy) | P-value (F1) |
|  ----  | ----  | ----|
|  RoBERTa-large  | $3.4969 \times 10^{-5}$| $4.9945 \times 10^{-5}$|
| DeBERTa-large  | 0.0006 |0.0014|
| BART-large  | 0.0118 |0.0040|
| T5-large  | 0.0206 |0.0440|
| GPT-3.5  | 0.0013 |0.0231|
| Claude-3-haiku  | $1.5918 \times 10^{-5}$ |0.0008|


#### 3. Clarification of filter function (DNa8, tJvT, Pe9C)  
We checked the description of the filter function, particularly lines 369-370, and found it misrepresented, causing ambiguity and inaccuracy. We apologize for the misrepresentation. We are restating it as follows:   
“In cases where the classifier makes confident morality judgments, we refrain from introducing the generated norms due to the potential bias from the generator itself. Our goal is to ensure that the generated norms do not negatively impact the classifier's judgments in this case”.

We provide an example to interpret the filter function: In the scenario where "Mary makes a joke and puts food coloring on her brother’s toothbrush," the classifier indicates it is moral and has a high confidence level (i.e., $f_{class}(a_i) = 0.94$), which is accurate. 
However, both of the two paths focus on personal health and dental issues and generate rationales/norms, resulting in immoral judgments that are incorrect. Therefore, the filter function judges that $f_{class}(a_i) > \tau$, 
and will choose to make a moral decision based on the action (the actual answer) without referring to the generated norms ($\tau$ is a confidence level threshold that is determined using a small set of held-out validation data, the details in lines 888-892).

We will clarify the filter function in the paper.

#### 4. Need a minor revision of the Appendix (DNa8, Pe9C, tJvT).

1) We will move the significant test results for human evaluation from the Appendix to the main text to complement the results in Table 2 and add the above significance test results to Table 1.

2) In the Limitation section, we will add that the binary classification task itself might poorly explain complex social behaviors, which might be a factor affecting the model's meaningful generalization.
