---
title: 'LLM-Based Analysis of 1.8M Shopping Terms: Finding Unfavorable Terms at Scale'
date: 2025-02-08
permalink: /posts/2025/02/harmful-terms/
excerpt: "Let's be honest --- no one actually reads the Terms & Conditions before clicking 'I agree.' However, these terms can cost you dearly. "
author_profile: false
author: "Elisa Tsai"
toc: true
toc_sticky: true
toc_label: "On this page"
toc_icon: "list"
tags:
  - web-security
  - llm
  - measurement
  - research
---
# 🤗 Open Source Code and Dataset

We open sourced [TermMiner](https://github.com/eltsai/term_miner) and [ShopTC-100K](https://huggingface.co/datasets/eltsai/ShopTC-100K) to help researchers and developers build better tools to protect consumers.

<i class="fas fa-file-pdf"></i> [Paper (arXiv)](https://www.arxiv.org/abs/2502.01798) <i class="fab fa-github"></i> [Code (GitHub)](https://github.com/eltsai/term_miner/tree/main) <i class="fas fa-database"></i> [Dataset (HuggingFace)](https://huggingface.co/datasets/eltsai/ShopTC-100K)



# The Problem: Who Reads the T&Cs Anyway?

Let's be honest --- no one actually reads the Terms & Conditions before clicking "I agree." And that's exactly what some businesses are counting on. Hidden in the fine print of shopping websites are unfavorable financial terms --- sneaky term that can charge you unexpected fees or lock you into unwanted subscriptions.

<p align="center">
  <img src="/images/harmful_terms/scam_example_tone_fit_pro.jpg" 
       style="max-width: 50%; 
              width: auto; 
              height: auto; 
              display: block; 
              margin: 0 auto;"
       alt="Example of social-engineering scam facilitated by unfavorable terms">
</p>


The figure shows a scam where a website giving away cheap earbuds for free, only charging for the shipping, but buries an $86-per-month fitness subscription in the T&Cs. The victim complaint shows how deceptive these terms are. They bought the earbuds, unaware they were also enrolled in a subscription. Weeks later, unexpected charges appeared on their card, but the victim still didn't link them to the T&Cs. 

You might be thinking, "This is obviously a scam! I'd never fall for this." But here's the bad news --- these tactics aren't limited to scam websites. Legitimate companies also use sneaky T&Cs to charge hidden fees, enforce strict no-refund policies, or make canceling subscriptions a nightmare. Below is the [Terms of Use](https://celsius.network/terms-of-use) of Celsius, a crypto company that went bankrupt in 2022.

> In the event that you, Celsius or any Third Party Custodian becomes subject to an insolvency proceeding, it is unclear how your Digital Assets would be treated and what rights you would have to such Digital Assets. [...]. You explicitly understand and acknowledge that the treatment of Digital Assets in the event of such an insolvency proceeding is unsettled, not guaranteed, and may result in a number of outcomes that are impossible to predict reliably, including but not limited to **you being treated as an unsecured creditor and/or the total loss of any and all Digital Assets reflected in your Celsius Account**, including those in a Custody Wallet.

In simple words, if Celsius went bankrupt, their users' crypto  became company property. Later, a judge ruled that Celsius actually owned all user deposits, citing their Terms of Use [1]. 


We call terms that are unfair or unfavorable, with immediate or future financial impact on users, **"unfavorable financial terms."** At the very least, consumers deserve to be warned. That's why we set out to **measure, understand, and detect these terms at scale**, revealing how they appear in real-world shopping websites.

# Analyzing Shopping Website T&Cs at Scale

To tackle the problem of unfavorable financial terms, we took a data-driven approach, combining large-scale web measurement and LLM-based text analysis. Our goal was simple: **find these terms, categorize them, and develop a system to detect them automatically.**

First, we built [TermMiner](https://github.com/eltsai/term_miner), a pipeline that collected and analyzed terms and conditions from thousands of shopping websites. Using large language models (LLMs) and topic modeling, we identified recurring patterns in the fine print, clustering terms into different categories based on semantic similarity.


<div style="max-width: 700px; width: 70%; margin: 0 auto;">
  <img src="/images/harmful_terms/termminer_data_collection_pipeline_slides_version.jpg" 
       style="max-width: 100%; 
              width: auto; 
              height: auto; 
              display: block; 
              margin: 0 auto;"
       alt="TermMiner overview">
  <p style="color: #666666; font-size: 0.9em; margin-top: 8px;">
    <em>TermMiner collects English T&Cs from shopping websites, classifies terms into binary categories, and clusters terms to identify topics through manual inspection, GPT-4o, and iterative snowball sampling.</em>
  </p>
</div>

Using TermMiner, we collected a dataset called ShopTC-100K (available on [HuggingFace](https://huggingface.co/datasets/eltsai/ShopTC-100K)), a large-scale repository of terms and conditions about 8,000 shopping websites in the Tranco Top 100K list. This dataset contains 1.8 million extracted terms, making it one of the largest publicly available resources for studying online shopping policies. ShopTC-100K enables large-scale analysis of how financial terms are structured, where they appear, and if they contain unfavorable conditions that can harm consumers.

Beyond detecting unfavorable financial terms, TermMiner is a powerful framework that can be repurposed for a wide range of research on online policies and contractual agreements. Researchers can use it to analyze privacy policies, service agreements, and regulatory compliance across industries. Its modular design allows for custom classification, topic modeling, and large-scale text analysis, making it adaptable to different domains.

Recognizing its broader potential, we are open-sourcing [TermMiner](https://github.com/eltsai/term_miner) to enable further research. 


Based on ShopTC-100K and other two fake ecommerce websites datasets, we developed an Unfavorable Financial Term Taxonomy, classifying **22 types of unfavorable terms into 4 major categories**:

1. **Purchase & Billing Terms**: Hidden fees, auto-renewing subscriptions, retroactive price increases.
2. **Post-Purchase Terms**: Strict no-refund policies, refund restrictions (e.g., store credit only), return shipping costs imposed on customers.
3. **Termination & Account Recovery Terms**: Fees for reactivating accounts, seizure of digital assets upon inactivity or termination.
4. **Legal Terms**: Forced arbitration, waiver of class-action rights, excessive legal document request fees.

Below are some examples of unfavorable financial terms (for more examples, see the [paper](https://arxiv.org/abs/2502.01798)):

| Category                         | Example                                                                                                                                                                                                                                            | Types |
|----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------|
| **Purchase and Billing**         | By clicking "Order Now", you agree to the terms and conditions. You will be charged **\$6.85** for the shipping and handling of your free smartwatch. Also, as part of the promotion, you will receive **a subscription to the FitHabit Fitness App for only \$86**. | 6     |
| **Post-Purchase**                | Refund Policy: Refunds are not in cash but in the form of a **"coupon"**.                                                                                                                                                                       | 10    |
| **Termination and Account Recovery** | Please be noted that if your account is **dormant** for a period of 12 consecutive calendar months or longer, ..., any amounts in your account's balance, including any outstanding fees owed to you, shall be considered as **forfeited and shall be fully deducted** to Appnext. | 3     |
| **Legal**                        | You hereby **waive California Civil Code Section 1542**. You hereby waive any similar provision in law, regulation, or code.                                                                                                                     | 3     |

# Detecting Unfavorable Financial Terms

Next, we developed TermLens, a detection system that automatically flags unfavorable financial terms in real time. By leveraging state-of-the-art LLMs fine-tuned on a small annotated dataset, TermLens can highlight hidden fees, deceptive refund policies, and other predatory terms, helping consumers spot potential risks before they click "I agree."

<div style="max-width: 500px; width: 70%; margin: 0 auto;">
  <img src="/images/harmful_terms/plugin_design.jpg" 
       style="max-width: 100%; 
              width: auto; 
              height: auto; 
              display: block; 
              margin: 0 auto;"
       alt="TermLens demo">
  <p style="color: #666666; font-size: 0.9em; margin-top: 8px;">
    <em>TermLens is a browser plugin designed to detect unfavorable financial terms before they cost you.</em>
  </p>
</div>

TermLens is a browser plugin designed to spot unfavorable financial terms before they cost you. Here's how it works:

1. When you visit a shopping website, TermLens sends the page URL to its backend.
2. It retrieves the Terms & Conditions along with other website data, like HTML and screenshots.
3. Using LLMs, it scans for hidden fees, tricky refund policies, and other unfair terms.
4. If it finds anything suspicious, it alerts you instantly, so you know what you're agreeing to before you buy.

# **Main Takeaways from Evaluation**  

To assess how well we can **detect unfavorable financial terms**, we conducted two key evaluations:  

1. **Annotated Dataset Evaluation** --- We tested various LLMs on a labeled dataset to measure their accuracy in identifying such terms.  
2. **Large-Scale Detection** --- We applied our best-performing model to ShopTC-100K and two fake ecommerce website dataset to measure real-world prevalence.  

## Key Findings from Annotated Dataset Evaluation

**Context Matters** – Adding our taxonomy of unfavorable terms to the prompt boosted zero-shot classification performance, increasing TPR by 4.4% to 27.4% and F1 score by 4.5% to 21.1%. Providing structured context helps LLMs better understand and identify unfavorable financial terms.  

**Fine-Tuning Works** – A fine-tuned GPT-4o model significantly outperformed all other models.  

## Key Takeaways from Large-Scale Detection  

📌 **Unfavorable Terms Are Common** – While only **0.5% of all terms** in T&Cs are classified as unfavorable, **42% of shopping websites contain at least one**, meaning that (1) unfavorable terms are widespread and (2) expecting users to read through T&Cs and spot them is unrealistic.

📌 **Less Popular Websites Are Riskier** – Unfavorable terms are more prevalent on lower-ranked shopping websites, making them a bigger risk for consumers.  

📌 **Current Scam Detection Tools Miss These Terms** – Our findings show that most scam detection tools don't flag websites with unfair T&Cs, since they focus on phishing and fraud, not deceptive financial clauses.  

These insights highlight the urgent need for automated tools like TermLens to help consumers **spot unfair terms before they agree to them.**


# Discussion: Beyond The Paper

This paper is one of the first attempts to understand, categorize,
and detect unfavorable financial terms and conditions on shopping
websites. These terms, which can significantly impact consumer
trust and satisfaction, have not been extensively studied. While our work takes an important step in detecting and categorizing unfavorable financial terms, there are broader implications and open questions that remain. Here, we discuss two key areas: context and regionality.

## Context Matters in Determining Harmfulness

The context in which an unfavorable financial term appears is critical in assessing its severity. For example, a refund policy stating "Refunds are not in cash but in the form of a coupon" is clearly worth flagging for users. However, if this information is clearly presented during checkout through a pop-up or highlighted text, the harm it poses is significantly reduced. On the other hand, if this term is buried deep in T&Cs that users never see, the impact is far greater. Future research could explore how and where these terms are presented to better qualify and quantify their risk and develop more nuanced detection methods.

## Consumer Perception of Unfavorable Financial Terms

While our study detects and categorizes unfavorable financial terms, an important open question is how these terms actually impact consumers. Future research could focus on user studies to understand *how consumers perceive these terms, whether they notice them, and how these terms influence their decision-making*. Additionally, studies could quantify the financial harm these terms cause—whether through unexpected fees, lost refunds, or forced subscriptions. Understanding the psychological and financial effects of these terms would help in designing better interventions, whether through improved transparency, policy recommendations, or automated consumer protection tools.

## Regional Differences in Unfairness

Our study focuses exclusively on English-language T&Cs, using the FTC Act's definition of unfair and deceptive practices [2] as a reference point. However, consumer protection laws vary significantly across regions. For example, the EU's Unfair Commercial Practices Directive or GDPR-related terms may provide alternative legal frameworks for evaluating the fairness of terms. Future research can extend our approach to different languages and jurisdictions, adapting detection models to account for region-specific regulations and cultural norms. Expanding this work globally would provide a more comprehensive understanding of how businesses craft financial terms across different markets.

# References
<div style="font-size: 0.9em; line-height: 1.2;">
<p>[1] Washington Post. Bad news for thousands of crypto investors: They don't own their accounts. January 5, 2023. <a href="https://www.washingtonpost.com/technology/2023/01/05/celsius-crypto-bankruptcy-ruling/">https://www.washingtonpost.com/technology/2023/01/05/celsius-crypto-bankruptcy-ruling/</a></p>

<p>[2] FTC Act, Section 5: <a href="https://www.federalreserve.gov/boarddocs/supmanual/cch/200806/ftca.pdf">https://www.federalreserve.gov/boarddocs/supmanual/cch/200806/ftca.pdf</a></p>
</div>