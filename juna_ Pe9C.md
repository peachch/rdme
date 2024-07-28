Thank you for your valubale comments and beleive our method is clear, well-motivated and well-decribed. We also appreciate taht you found our experiments is rich and solid. We address your questions and suggestions below.

> __Weakness 1:Section 4.1 needs a better explanation of the composition of the dataset, which is too important to appear only in the appendix. Such a description is critical to understanding the experiments and answer the following questions:__

In order to highlight the main contribution in the main body of paper, we put the baseline's details in the Appendix. 

> __Weakness 2: what makes ClarityEthic better? The fact that it achieves better morality classification? The fact that it can generate valuable/plausible/relevant norms? I would appreciate a clearer overview of why the experiments are performed and what they intend to prove. The authors could consider moving some experiments to the Appendix and maintaining only the most important ones in the main paper while justifying and explaining them properly.__

Overall, our approach benefits from *leveraging the generated competitive norms to assist actions for classification judgments.* So both the generation and classification models make ClarityEthic better. Therefore, we introduce the framework and the corresponding basic experimental results in the main section of our paper.

> __Question 1:The baselines are trained as binary classifiers on the morality annotations of Moral Stories, while the LLMs are used zero-shot?__

Yes. The classification tasks on the two datasets are binary judgments, and the close-sourced LLMs are zero-shot prompts.

> __Question 2:Instead, your method is trained with the whole pipeline described in Section 3? So ClarityEthic is trained with (1) the moral/non-moral judgments present in the dataset + (2) GPT3.5-generated rationales + (3) human-written norms (as described in section 3.1->Norm Generator)?__

Yes. Our framework includes 1) pre-training three distinct task-specific language models by leveraging the moral reasoning extraction from LLMs, and 2) fine-tuning the two pre-trained generators with contrastive learning.

> __Question 3: Are the human-written norms sourced from the Moral Stories dataset?__

Yes. The dataset provides the human-written norms that respond to actions.

> __Question 4: how are the labels used to train and evaluate the model? Are they used as norms?__

Thank you for pointing out this inaccurate statement. The labels should be replaced by ground truth.

> __Question 5: what do you mean that you treat the corresponding rationale as a norm?__

We explain in lines 214-217 - "In particular, when no explicit norm can be generated, we use the generated rationale $\hat{r}_i$ $=frgen(a_i)$ as a substitution of $\hat{n}_i$ in $f$ to infer the final moral judgment (see §3.3)." 

> __Question 6: the threshold function is not fully clear to me. I would appreciate a verbal explanation of the rationale behind the function defined in lines 377-378.__

We Clarify the filter function. Please see Common Response 3.

> __Suggestion 1: Also, I would appreciate a discussion (in the Limitations or Ethical Considerations) on using GPT3.5 generated rationales as ground truth.__

We mention it in Section 7 - "the concerns about potential ethical issues with rationales generated by LLMs still persists. To address this concern, we randomly select 50 rationales used in training and engage three participants to perform a human check."


In addition, we appreciate your shared references.