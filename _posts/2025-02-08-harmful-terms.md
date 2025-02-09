---
title: 'LLM-Based Analysis of 1.8M Shopping Terms: Finding Unfavorable Terms at Scale'
date: 2025-02-08
permalink: /posts/2025/02/harmful-terms/
tags:
  - web-security
  - llm
  - research
---
# The Problem: Who Reads the T&Cs Anyway?

Let’s be honest --- no one actually reads the Terms & Conditions before clicking "I agree." And that’s exactly what some businesses are counting on. Hidden in the fine print of shopping websites are unfavorable financial terms --- sneaky term that can charge you unexpected fees or lock you into unwanted subscriptions.


![Example of social-engineering scam facilitated by unfavorable terms](/images/harmful_terms/scam_example_tone_fit_pro.jpg)

The figure shows a scam where a website giving away cheap earbuds for free, only charging for the shipping. But buries an $86-per-month fitness subscription in the T&Cs. The victim complaint shows how deceptive these terms are. They bought the earbuds, unaware they were also enrolled in a subscription. Weeks later, unexpected charges appeared on their card, but they still didn’t link them to the T&Cs. 

You might be thinking, "This is obviously a scam! I’d never fall for this." But here’s the bad news --- these tactics aren’t limited to scam websites. Legitimate companies also use sneaky T&Cs to charge hidden fees, enforce strict no-refund policies, or make canceling subscriptions a nightmare. Below is the [Terms of Use](https://celsius.network/terms-of-use) of Celsius, a crypto company that went bankrupt in 2022.

> In the event that you, Celsius or any Third Party Custodian becomes subject to an insolvency proceeding, it is unclear how your Digital Assets would be treated and what rights you would have to such Digital Assets. [...]. You explicitly understand and acknowledge that the treatment of Digital Assets in the event of such an insolvency proceeding is unsettled, not guaranteed, and may result in a number of outcomes that are impossible to predict reliably, including but not limited to **you being treated as an unsecured creditor and/or the total loss of any and all Digital Assets reflected in your Celsius Account**, including those in a Custody Wallet.

In simple words, if Celsius went bankrupt, their users' crypto  became company property. Later, a judge ruled that Celsius actually owned all user deposits, citing their Terms of Use [1]. 


We call terms that are unfair or unfavorable, with immediate or future financial impact on users, **"unfavorable financial terms."** At the very least, consumers deserve to be warned. That’s why we set out to **measure, understand, and detect these terms at scale**, revealing how they appear in real-world shopping websites.


# References

[1] Washington Post. Bad news for thousands of crypto investors: They don’t own their accounts. January 5, 2023. https://www.washingtonpost.com/technology/2023/01/05/celsius-crypto-bankruptcy-ruling/

