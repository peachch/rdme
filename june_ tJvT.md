Thank you for being our reviewer again. Your previous comments were very helpful and greatly improved our paper. This time, we still appreciate your acknowledgment of the interesting method and the provision of sufficient experiments. We address your questions below, including several new analyses following your suggestions.


> __Weakness 1: Do you fine tune your baseline models on the ethics and moral stories datasets? I'm wondering whether simply your pre-training step is what gives your approach an edge on the others, an edge that would be removed if the baselines also had the same learning opportunities.__

Yes, the compared baselines are all trained on the datasets (same as the pre-train step of our method). Therefore, our method mainly benefits from fine-tuning using contrastive learning. We display the details in Appendix A.8.

> __Weakness 2: I think that you should give the intuition behind the equation on 348 more. E.g. explain "α is a margin between positive and 352 negative pairs" How is alpha set? Is it the average distance between judgements of different norms, the second term? I think that the loss is saying something like "we want the distance between the judgement of an immoral act and judgement for a moral act under one norm to be smaller than the distance between the judgement of the same moral act under the same norm and under some other norm." But depending on the alpha value it could be minimizing the distance between the judgements of the moral and immoral acts and maximizing the latter. Frankly, I don't see why this loss is appropriate in this case. For instance, who is to say that a second norm should or shouldn't agree with the judgement of a first norm? Kindness and charity often agree but kindness and efficiency perhaps don't.__

  There seems to be some misunderstanding here. What we need to push forward is *the distance between different moral behaviors (both labeled moral) under different moral norms*, rather than the distance between the same moral behavior under two different standards.    
The main purpose of contrastive learning is to enhance feature learning and distinguish actions (under different norms) with similar contexts while also learning the relationship between moral and immoral judgment actions (within the same norm).

  Thanks for the correction. We missed the description of how to get α. The triplet loss function here is a standard technique, and the α is a hyperparameter. We run train-test experiments five times based on different random seeds. Each time renders an α that ranges from 0.1-0.5 for a different run, in which α is determined using a small set of held-out validation data.
  
> __Weakness 3: I actually think that chaining LLMs is this way is not very interpretable. You just push the interpretability issue one layer deeper. I'd like to see you justify this more.__

 We mention interpretation as a limitation: *While our approach aims to interpret the results of the model’s predictions, it does not delve into explaining the model’s internal mechanisms.*
 

> __Weakness 4: table 5. I don't really get the highlighting. "Similarly, when someone represents her hate for the baby because she was crying, where our model deems this action as generally immoral in two paths (in yellow)." I don't get why this is a good thing. Don't you want to come up with contrastive reasons? Isn't the immoral rationale supposed to be about why it is immoral? Isn't that relied on as a necessary part of your loss function? What is the effect of issues like this?__

  Please see the Common Response 1.

   
> __Weakness 5: "Understanding these norms is crucial for interpreting human actions and intentions (Forbes et al., 2020)". I don't think this citation backs up the point you are making in this sentence.__

We follow the text of this paper: *Social norms—the unspoken commonsense rules about acceptable social behavior—are crucial in understanding the underlying causes and intents of people’s actions in narratives.*

 
> __Question 1: You overload the prefixes p1 and p2 around line 281 and 323. Because of this I'm not sure what you refer to on line 378.__

  The function in 378 is $f_{class}$, so the prefixes follow the classification model shown in line 323. Otherwise, line 281 represents the generation model $f_{rgen}$.
  
> __Question 2: What is the output of your classifier?__

  "Moral" or "Immoral".

> __Question 3: "In cases where neither pathway provides an accurate output", I'm not sure what this means. Is this just line 378?__

  Please see the Common Response 3.

> __Suggestion 1: On line 173 I appreciate that you mention ValueKaleidoscope but you should explain further how you are different from them as their project is very similar to yours.__

 Thanks for the suggestions. We will provide the difference later. Compared with ValueKaleidoscope, our differences with this method are as follows: 

 - The frameworks are different. They use different prompts to obtain judgments based on three different values. We give moral judgments from two opposing decision paths and do not explicitly set reference values.__

- Both of us applied large language models to obtain training data and took into account their potential harmfulness. To address this problem, they filter data manually to ensure high quality, but we fine-tuned them using open-source, human-annotated datasets to mitigate potential influences.

> __Suggestion 2: If you're going to have a figure which mentions "other classifier" and "other generator" you should also put them them in the related work and cross reference. "Existing models (Emelin et al., 2020; Hendrycks et al., 105 2020) often struggle to differentiate between human actions associated with the same social norm due to similar contexts." This claim seems shaky. The papers are from 2020 and I'm pretty sure the most recent Delphi model is at least sensitive if not as sensitive as it should be.__

Good points! We will revise them.

> __Suggestion 3: In table 2 you should report the significance. Your approach is not significantly different from gpt3.5 as you report in the appendix. also on line 473__

Please see Common Response 4.


