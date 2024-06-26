We thank the reviewer for your comments. Regarding your consideration, we've put it into three main parts and given the point-to-point response below.    
We really hope this reply can address some of your concerns.


1\. "Several details missing and questions unanswered."    

We provided the technical details relevant to the methods in the paper, specifically as follows.  

  - "What models are you pre-training?".
      
    **As shown in lines 261-266**, our models **are all based on the same text-to-text framework (T5) in three distinct tasks**: classification, explanation, and summarization.
    
  - "How is the pretraining stage structured?".
     
    **The overview structure is shown in Figure 2; there are three separate tasks/models based on T5 trained with different task-specific prefixes ($P_k$), inputs, and outputs, which are distinguished by the color and equation in Figure 2.**
    Specifically, for classification, the input is action $a_i$, and the output is judgment $j_i$; for the rationale generator (explanation), the input is action $a_i$, and the output is rationale $r_i$; for the norm generator (summarization), the input is rational $r_i$, and the output is norm $n_i$.
       
  - "Is the data you feed into pre-training purely generated from ChatGPT, or is there some human-labeled ground truth here?".
       
    **The pretraining stage contains ground truth from the open-source datasets and data extracted from LLM.**
    **As shown in lines 204-217**, the trained data (action, norm, and judgment) was gained from the open-source dataset (human labeled). Specifically, as equation 1 and lines 293-295 illustrate, **the input (action $a_i$) from the dataset and the output (rationale $r_i$) is extracted from LLM** for the explanation task; similarly, equation 2 and lines 307-309 interpret for summarization task use **the ground-truth norm $n_i$ and corresponding rationale $r_i$ from LLM**; for the classification task, **the input (action $a_i$) and the output (judgment $j_i$) are all from the dataset**. 
   
2\. "Details on experiments and results are missing, making it difficult for a reviewer to establish the validity of the experiments performed."   

 - **The experiment details**:  For ClarityEthic, we display the details of all benchmarks, baselines, automatic metrics, and human evaluation methods. **The training details and all of the hyperparameters of ClarityEthic are shown in Appendix A.6, which can help others reproduce our method**. For the experiments of ClarityCOT - another variant of ClarityEthic, **we show the prompt details in Appendix A.3**. Furthermore, Appendix A.5 provides the dataset's **train/test details**. We also offer a detailed description of the **data processing** process in Appendix A.4.     
 - **The results details**:  We perform the classification and generation performance (automatic and human evaluation), respectively. Moreover, we give the **ablation study** in section 4.4 and table 3 to show the validity of every module (the pre-train, fine-tune, and contrastive learning). Finally, we also **visualize the case study** in section 4.5 and table 4 to illustrate the effectiveness.

3\. "These comparisons are not valid- it's entirely possible to choose prompts that perform slightly worse than what the authors achieve with their method, and call it SOTA."    

**We provide two types of baselines, and we carefully maintain experimental fairness for all approaches. With each is explained as follows.**   
 - The trained baseline (all the baselines are trained/fine-tuned by the same datasets with no rationale): "Word Averaging," "RoBerta," and "DeBerta" **follow the previous work "Aligning ai with shared human values"**(https://arxiv.org/abs/2008.02275) as 405-407 display. Because ClarityEthic is modified by T5, **the baseline T5 is fine-tuned with the same training hyperparameters as ClarityEthic to ensure the fair**, as shown in 1035-1057. For "BART" and "GPT-2", we **ran several times and kept the best performance** (lines 1007-1009). 
    
 - The prompt baseline:  we prompt gpt-3.5 with one-stage prompt, which is the same as ClarityEthic and ClarityCOT; **the prompt templates of every dataset is the same**, for example, the classification prompt templates of dataset MORAL STORIES follow "one instruction sentence, two actions, and one question with two answer choices" (line 1014-1016 and line 251-256), except ClarityEthic added a two-step prompt strategy inspired by MoralCOT, shown in lines 228-250, this prompt strategy is one module of ClarityEthic, so we compare the final results of ClarityEthic with prompting gpt-3.5 directly.
   Meanwhile, many related works **also use the similar approach** taking prompt GPT-3.5 as a baseline: https://arxiv.org/abs/2306.14308 and https://arxiv.org/abs/2210.01478.
