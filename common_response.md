We are grateful to all reviewers for their insightful comments. We appreciate that reviewers found ClarityEthic to be novelty and interesting (Pe9C, tJvT, DNa8) the method is well-descrived (tJvT, Pe9C) and motivated (Pe9C).  We also appreciate that all reviewers noted that the experiments are rich and solid.

We now display several new experiments and analyses based on your suggestions. We further address each of your questions in the individual responses, in addition to four common items that we’d like to highlight here.

#### 1. Clarity of the case study in Table 5 （tJvT, gjqp）.   
We show two types (4 cases) in the case study. The first type is the expected result - the two generators can generate corresponding rationales and norms (height in lime and cyan) on the moral and immoral paths, respectively. 

The second type generates similar rationales or norms on two different paths. *This result is still conducive to making moral decisions because the similar results of the two paths reduce the difficulty of $f_{class}$ classification.* 
Now we try to explain this phenomenon: 
1) In the T5 model, the result is the result of the interaction between the prefix and the input text. However, *the prefix has a limited effect on the generator.*  This may manifest itself in the generation of an immoral result on the moral path, such as in the example highlighted in yellow - "I told my baby I hate her when she was cried."
2) Otherwise, in fine-tuning, *we use contrastive learning to bring the generated norms using the rationale of two opposite paths closer*, i.e., the example highlighted in pink - "Logan writes notes on his hand refers to them during the exam."

Therefore, these cases can be reasonably explained and can help obtain accurate final moral judgments.

#### 2. Additional significant test (DNa8, tJvT).

Now, we provide the significant test of Table 1, and we will add this to the main body of the paper later. We utilize a dependent t-test for paired samples. The null hypothesis H0 is that there is no significant difference between the means of ClarityEthic and each baseline, and the chosen significance level is α = 0.05.
|  Model   | P-value (Accuracy) | P-value (F1) |
|  ----  | ----  | ----|
|  RoBERTa-large  | $3.4969 \times 10^{-5}$| $4.6329 \times 10^{-5}$|
| DeBERTa-large  | 0.0006 |0.0015|
| BART-large  | 0.0118 |0.0058|
| T5-large  | 0.0393 |0.0746|
| GPT-3.5  | 0.0012 |0.0234|
| Claude-3-haiku  | $1.5918 \times 10^{-5}$ |0.0007|


#### 3. Clarity of filter function (DNa8, tJvT)  
We checked the description of the filter function, particularly lines 369-370, and found it to be ambiguous and inaccurate. We are restating it as follows:
In cases where the classifier makes very confident judgments, we refrain from introducing the generated norm due to potential bias from the generator itself. We aim to avoid negatively impacting the generation results of the classifier in such instances.


#### 4. Need a minor revision of the Appendix (DNa8, Pe9C, tJvT).

1) We will move the significant test results for human evaluation from the Appendix to Table 2 and add the above results to Table 1.

2) In the Limitation section, we will add that the binary classification task itself may poorly explain complex social behavior, which may decrease the model's meaningful generalization.
