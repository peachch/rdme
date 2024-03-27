We sincerely appreciate your thorough and detailed feedback, which undoubtedly greatly assists us in improving our paper. 
Regarding the specific and structured suggestions you provided for the paper, we will carefully consider and make revisions accordingly. 
At this stage, we would like to address your concerns as follows,


1\. "What do you even mean by ground truth in this context? 
Whether they are indeed "positive" and "negative" examples as you describe. Why not just use the rationales verbatim?"   
    - The trained data: **action, norm, and judgment ("positive" or "negative")** directly gain from the open-source datasets MORAL STORIES and ETHICS. 
    These dataset provide the real human behaviors, the corresponding norms and positive or negative moral judgements of this behavior  
    for AI models to understand and interpret. 
    - Why don't we just use rationales as the final results or training data? 
    Firstly, because rationales are often lengthy and not convenient for humans to read and utilize as final results. 
    Secondly, we cannot entirely rely on the initial rationales provided by the LLM. 
    In comparison to the **human annotated and calibrated MORAL STORIES and ETHICS datasets**, 
    we prefer using the **norms** from these two datasets as **the ground-truth or "correct answers"** for training and final restules.
    
2\. "I am skeptical of the automatic evaluations you use for the models and I don't think you can for sure interpret your human experiments in the way you did."   
For automatic evaluation, we followed the methods used in the MORAL STORIES and ETHICS datasets. 
Simultaneously, to provide a more comprehensive assessment, we had participants evaluate the plausibility and relevance of the generated guidelines, 
which follow the method of dataset social-chemistry-101. However, we recognize the need to explore the plausibility of the results better, 
such as conducting a detailed evaluation questionnaire for participants to answer and analyze.

