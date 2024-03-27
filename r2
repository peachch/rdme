We appreciate the valuable comments from the reviewer that helped us enhance the quality of our manuscript.  
We really hope this response can address some of your concerns. 

1\. Whether useful of ETHICS results from ClarityEthic.   
This is a very profound concern. Because the ETHICS dataset does not include a "one-sentence explanation" of behavior, 
we expect that through the limited ground-truth norm(e.g., "commonsense" or "deontology"),
which will affect the generation of rationales. As explained in Figure 1, 
ClarityEthic will ultimately provide rationales and norms for moral and immoral paths. Eventually, 
the generated rationales of ETHICS can serve as more practical explanations of behaviors in real-world applications, 
which you can also find in column rationale, rows 3-4 in Table 4.    
Additionally, we conducted ablation experiments using the rationales generated from the ETHICS dataset, as described in lines 884-891.
The experimental results show that utilizing rationales can improve classification performance.


2\. "The approach seems to assume that a given action can have only one moral (or immoral) rationale, 
though in line 188 it is mentioned “two or more moral judgements.” 
Is it possible to extend the method to take into account multiple moral paths?"

Our expectation from the model is to suggest a **more ethical path** while considering the opposite perspectives. 
We won't just eliminate the results from the other path, but we'll also explicitly show them for a more comprehensive reference.    
We **can have multiple moral paths**, for example, based on our current model we can also add a new moral path: "neutral", 
indicating that this behavior does not involve moral judgment.

3.\ "Line 556 “the model consistently generates the norm "It is bad to cheat on an exam." I’m a bit confused about the framing here – is this desired behavior? The norm conflicts with the rationale?"   
As shown in section 3.3 and figure 3, we fine-tuned norm generator with ground-truth norms and utilize constrastive learning to increase the difficulty. 
Meanwhile, in this example, the moral rationale repeated the action again "Logan writes notes on his hand and refers to them during the exam because..." 
as Table 4 row 2 shown. It seems that instead of simply summarizing or simplifying the rationale's sentence, 
the fine-tuned norm generator engaged in a moral comprehension and judgement of the action. 
Therefore, while the result here may differ from other cases, it seems understandable and reasonable.

