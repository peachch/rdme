


> Concern 1: Do you fine tune your baseline models on the ethics and moral stories datasets? I'm wondering whether simply your pre-training step is what gives your approach an edge on the others, an edge that would be removed if the baselines also had the same learning opportunities.

Yes, all the baseline models are finetuned with two datasets except close-sourced LLMs to ensure fairness. We display the details in Appendix A.8.


> Concern 2: I actually think that chaining LLMs is this way is not very interpretable. You just push the interpretability issue one layer deeper. I'd like to see you justify this more.

 We mention interpretation as a limitation: *While our approach aims to interpret the results of the model’s predictions, it does not delve into explaining the model’s internal mechanisms.*
 

> Concern 3: table 5. I don't really get the highlighting. "Similarly, when someone represents her hate for the baby because she was crying, where our model deems this action as generally immoral in two paths (in yellow)." I don't get why this is a good thing. Don't you want to come up with contrastive reasons? Isn't the immoral rationale supposed to be about why it is immoral? Isn't that relied on as a necessary part of your loss function? What is the effect of issues like this?

  - Training rationale data from LLMs.
  - The influence of prefixes is limited.

> Concern 4: I think that you should give the intuition behind the equation on 348 more. E.g. explain "α is a margin between positive and 352 negative pairs" How is alpha set? Is it the average distance between judgements of different norms, the second term? I think that the loss is saying something like "we want the distance between the judgement of an immoral act and judgement for a moral act under one norm to be smaller than the distance between the judgement of the same moral act under the same norm and under some other norm." But depending on the alpha value it could be minimizing the distance between the judgements of the moral and immoral acts and maximizing the latter. Frankly, I don't see why this loss is appropriate in this case. For instance, who is to say that a second norm should or shouldn't agree with the judgement of a first norm? Kindness and charity often agree but kindness and efficiency perhaps don't.


> Concern 5: "Existing models (Emelin et al., 2020; Hendrycks et al., 105 2020) often struggle to differentiate between human actions associated with the same social norm due to similar contexts." This claim seems shaky. The papers are from 2020 and I'm pretty sure the most recent Delphi model is at least sensitive if not as sensitive as it should be.

   
> Concern 6: "Understanding these norms is crucial for interpreting human actions and intentions (Forbes et al., 2020)". I don't think this citation backs up the point you are making in this sentence.

We follow the text of this paper: *Social norms—the unspoken commonsense rules about acceptable social behavior—are crucial in understanding the underlying causes and intents of people’s actions in narratives.*


 
> Question 1: You overload the prefixes p1 and p2 around line 281 and 323. Because of this I'm not sure what you refer to on line 378.

  The function in 378 is $f_{class}$, so the prefixes follow the classification model shown in line 323. Otherwise, line 281 represents the generation model $f_{rgen}$.
  
> Question 2: What is the output of your classifier?

  "Moral" or "Immoral".

> Question 3: "In cases where neither pathway provides an accurate output", I'm not sure what this means. Is this just line 378?
 
## Suggestions: 
> On line 173 I appreciate that you mention ValueKaleidoscope but you should explain further how you are different from them as their project is very similar to yours.

> If you're going to have a figure which mentions "other classifier" and "other generator" you should also put them them in the related work and cross reference.

> In table 2 you should report the significance. Your approach is not significantly different from gpt3.5 as you report in the appendix. also on line 473


