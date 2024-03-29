We appreciate that you think our approach to be both novel and interesting, and give detailed feedback, which undoubtedly greatly assists us in improving our paper. 
Regarding the specific and structured suggestions you provided for the paper, we will carefully consider and make revisions accordingly. 
At this stage, we would like to address your concerns as follows.


1\. "296: Why not just use the rationales verbatim? What do you even mean by ground truth in this context? Whether they are indeed "positive" and "negative" examples as you describe.?"   

- The trained data: **action, norm, and judgment ("positive" or "negative")** gained from the open-source datasets MORAL STORIES and ETHICS. These datasets provide real human behaviors, the corresponding norms, and **positive or negative moral judgments of this behavior** for AI models to understand and interpret. 
    
- Why don't we only use rationales as the final results or training data?   
  We cannot entirely rely on the initial rationales provided by the LLM. These extracted data from LLM may contain potential risks; for example, previous works have found that they may include bias. (https://dl.acm.org/doi/pdf/10.1145/3582269.3615599,https://arxiv.org/pdf/2305.14930). Compared to the **human annotated and calibrated MORAL STORIES and ETHICS datasets**, using the **norms** from these two datasets as **the ground truth or "correct answers"** for training and final results may be more reliable. Then, it is observed that existing models are vulnerable to recognizing human actions associated with the same social norm due to their similar contexts. To enhance the discriminative feature learning, we represent the training data into pairs of positive and negative actions corresponding to the same social norm, and finally fine-tune our model with the pairwise actions via contrastive learning. Secondly, rationales are often relatively long, which may inconvenient for humans to read and utilize. 
    
2\. "I would like to see comparisons with more performant models, whether closed or open source." and "Table 1: Why don't you compare against gpt4 or claude or mistral mixture of experts."   

We have selected some typical baselines (Word Averaging, gpt3.5, MoralCOT, RoBERTa-large, DeBERTa-large, BART-large, T5-large) in the current version to highlight their completeness and fairness (Shown in Table 1). Furthermore, it strongly supports the claim we made in this research. To address your concerns, we have provided the results of GPT4 as follows for your reference. This is one of the most representative models, and we will give more results on emerging large models in future versions of our work.   

|       | MORAL STORIES | ETHICS     |
| :---        |    :----:   |          :---: |
| Accurancy      |   0.73     | 0.76   |
| F1   |   0.73      |   0.75    |
3\. "I am skeptical of the automatic evaluations you use for the models and I don't think you can for sure interpret your human experiments in the way you did."  

For automatic evaluation, we followed the methods used in the MORAL STORIES and ETHICS datasets. 
Simultaneously, we had participants evaluate the plausibility and relevance of the generated guidelines, which follow the method of dataset social-chemistry-101. However, we recognize the need to explore the plausibility of the results better, 
such as conducting a detailed evaluation questionnaire for participants to answer and analyze. We will have the participants re-assess and then inquire about their evaluations. This part will then be added to the appendix.

4\. "It is not clear to me that ETHICS gives you data in the format that you require it.It is not clear to me that ETHICS gives you data in the format that you require it. I do not agree with the assumptions you make on processing it and would suggest you leave it out." 
    & "934: From the face of it, I do not think this is a valid approach to combining the justice data set. Please explain why...."   

- The ETHICS does not fully meet our requirements, ETHICS is presented in single sentences but has **the potential** to form pairs. So we provide a detailed processing procedure as stated in lines 391-403 and Appendix A.4. Justice is similar. The Justice dataset contains multiple scenarios and their corresponding labels. We found a certain degree of overlap between adjacent data points. For example, the first and second data are "I deserve to be paid by my boss because I keep her house clean daily"(moral) and "I deserve to be given a brand new car by my boss because I keep her house clean daily,"(immoral) respectively. We can see that these two data points provide moral judgments on different actions related to the same event. Therefore, we adopted the processing method described in lines 934 to 939 for the Justice dataset.   

- Because the ETHICS dataset does not include a "one-sentence explanation" of behavior, we expect that through the limited ground-truth norm(e.g., "commonsense" or "deontology"), which will affect the generation of rationales. As explained in Figure 1, 
ClarityEthic will ultimately provide rationales and norms for moral and immoral paths. Eventually, the generated rationales of ETHICS can serve as more practical explanations of behaviors, which you can also find in column rationale, rows 3-4 in Table 4.    
Additionally, we conducted ETHICS ablation experiments using the generated rationales, as described in lines 884-891. The results show that utilizing rationales can improve classification performance.

The ETHICS does not fully meet our requirements. ETHICS is presented in single sentences but has the potential to form pairs, for example, in the "commonsense" category, the adjacent data "I told my baby I loved her when she cried" and "I told my baby I hated her when she cried" can form a pair used in training. Therefore, we provide a detailed processing procedure as stated in lines 391-403 and Appendix A.4. Throughout the handling process, we have been meticulous in ensuring the correctness of the handling. Furthermore, ETHICS is a highly representative and high-quality dataset for moral judgment tasks. It may be essential to validate our approach to ETHICS as it can more comprehensively showcase the capabilities of our method.

5\. "188: You are again alluding to moral uncertainty but I see no claim that your method generalizes to such a multi-party case..."   

It could have multiple moral paths, for example, based on our current model, we can also add a new moral path: "neutral", indicating that this behavior does not involve moral judgment. Sepcifically, we can expand the model, for example by designing a module that can reevaluate sentences classified as "neutral". Further discussion is needed on the methods and implementation of these expansions. Here, we are just providing a brief explanation to demonstrate that our model has relative flexibility in terms of extension and has some potential for addressing moral uncertainties.

6\. "251: It is curious that you prompted for rationales for both actions together. I would imagine that this introduces a bias..."

Let me briefly explain why we are grouping two actions. Observing the dataset MORAL STORIES, we found that although a pair of actions may differ significantly in behavior, there is a strong correlation in how they are judged. Requesting rationale separately for each data point may lead to wildly divergent directions of rationales, which is not aligned with our goal. Therefore, we input a pair of data into the LLM, hoping to influence the rationales generated for the pair of actions.

7\. "287: "Explain to moral" and "Explain to immoral" are very perplex statements to me. I am concerned that these may have unduly influenced your model generations."  

In the T5 model, as stated in its paper (https://www.jmlr.org/papers/volume21/20-074/20-074.pdf), **the impact of prefixes on the model's effectiveness is limited**. Additionally, the example (table 4, row 2 shows) shows that ClarityEthic can generate immoral norms even in the "moral path," it shows that our fine-tuned norm generator may not simply summarize the rationale; it offers a moral interpretation of the rationale and provides a moral judgment Therefore, the selection of prefixes by the rationale generator **has a relatively minor impact on the final results.**

9\. "948: Similarly, this does not seem reasonable. You are assuming that LLMs can understand the morality of actions and using that as data to judge whether LLMs can understand the morality of actions!"   

Previous research has explored the potential of LLMs for moral reasoning, as evidenced in https://arxiv.org/abs/2210.01478 and https://arxiv.org/pdf/2306.14308.pdf. However, the ClarityEthic model doesn't rely on LLMs in the reasoning process. It targets reason from action to norm. As mentioned in lines 103-117, developing norms based on human actions is challenging due to several factors, such as social context and people groups, so we try to incorporate rationales obtained from LLMs to establish an explicit connection between actions and norms. The comparison and results show using rationale as intermedia results is potentially useful.

10\. "304: And presumably p_1 does not change? it is always "summarize:"?"   

Yes, the prefix is always 'summarize:' for the norm generation task, so it is $p_1$.

11\. "370: Where does this threshold come from?"   

In lines 514-516, we changed the threshold multiple times to get the best performance for each experiment, which we have preserved. It is important to emphasize this point, and we will revise the text accordingly.

12\. "464: I disagree. Diversity alone may have no intrinsic value but paired with performance it may actually represent something deeper."    

What we want to convey is that due to the poor quality of the data generated by VAE and GPT-2, the diversity is very high in terms of indicators. Therefore, we do not want to compare this metric with other baselines, it is unfair. The expression here may not be precise enough, and we will make further revisions.

13\. "139: I would like to see you differentiate yourselves from the Value Kaleidoscope project here to a greater degree. Your approach is different but they are close.https://arxiv.org/abs/2309.00779"    

This is a fascinating and meaningful article. Our differences with this article are as follows: 

- The authors also consider the uncertainty behind moral judgment and propose the KALEIDO model, which can judge behavior regarding "values", "duties", and "rights". Their approach to managing uncertainty is different from ours. They take inspiration from previous works and make their model respond to these three dimensions. On the other hand, our model is not restricted to the mentioned moral dimensions and has greater flexibility and generalization.

- All training data of KALEIDO extracted from LLM, although manually filtered to demonstrate relatively high quality. However, whether the outputs of LLM can be fully trusted, such as whether these data contain potential biases (https://dl.acm.org/doi/pdf/10.1145/3582269.3615599,https://arxiv.org/pdf/2305.14930), is uncertain.
This resembles our concerns in designing ClarityEthic. Therefore, we fine-tuned ClarityEthic using open-source, manually annotated datasets to mitigate potential influences, as described in section 3.3.

Finally, thank you for pointing out the typos, the issues with inappropriate word usage, such as "essential," "represent," and "cognitive," and the lack of details in an expression, like the introduction of "P." We will improve it accordingly.
