We are grateful to all reviewers for their insightful comments. We appreciate that reviewers found ClarityEthic to be novelty and interesting (Pe9C, tJvT, DNa8) the method is well-descrived (tJvT, Pe9C) and motivated (Pe9C).  We also appreciate that all reviewers noted that the experiments are rich and solid.

We now display several new experiments and analyses based on your suggestions. We further address each of your questions in the individual responses, in addition to three common items that we’d like to highlight here.

## Clarity of case study in Table 5 （tJvT, gjqp）.


## filter function (DNa8, tJvT)


## Additional significant test (DNa8, tJvT).

Now, we provide the significant test of Table 1, and we will add this to the main body of the paper later. We utilize a dependent t-test for paired samples. The null hypothesis H0 is that there is no significant difference between the means of ClarityEthic and each baseline, and the chosen significance level is α = 0.05.
|  Model   | P-value (Accuracy) | P-value (F1) |
|  ----  | ----  | ----|
|  RoBERTa-large  | $3.4969 \times 10^{-5}$| $4.6329 \times 10^{-5}$|
| DeBERTa-large  | 0.0006 |0.0015|
| BART-large  | 0.0118 |0.0058|
| T5-large  | 0.0393 |0.0746|
| GPT-3.5  | 0.0012 |0.0234|
| Claude-3-haiku  | $1.5918 \times 10^{-5}$ |0.0007|


## We need a minor revision of the main body and Appendix (DNa8, Pe9C, tJvT).

1) We will move the significant test results for human evaluation from the Appendix to Table 2 and add the above results to Table 1.

2) In the Limitation section, we will add that the binary classification task itself may poorly explain complex social behavior which may decrease the model's meaningful generalization.
