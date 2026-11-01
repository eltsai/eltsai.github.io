---
permalink: /
author_profile: true
header: false 
redirect_from: 
  - /about/
  - /about.html
---
{% include general-block.html 
    content="
![cat-rex](https://github.com/eltsai/eltsai/raw/master/assets/cat-rex.gif)


🌱I'm Elisa Tsai. I received my Ph.D. in Computer Science and Engineering (CSE) from the University of Michigan, advised by Professor [Atul Prakash](https://web.eecs.umich.edu/~aprakash/). I am currently a software engineer at Google.

We humans extracted silicon from sand and built circuits that perform arithmetic with 0s and 1s. We use these circuits to train and serve models that attempt to capture the statistical structure of the world. I’m interested in understanding how these models learn, reason, and generalize. My current work focuses on making this faster and with less computation.


Outside of work, I occasionally record music ([Soundcloud](https://soundcloud.com/dumblelisa), [网易云](https://music.163.com/#/artist?id=12158117)), and from time to time, I [draw stuff](https://mp.weixin.qq.com/s/McXhW2YoCneXAPumCUx5qg).

My Chinese name is 文韬 (wén tāo), which comes from the Chinese idiom 文韬武略 (wén tāo wǔ lüè), meaning good at writing and good at fighting 💪 

**Links and Contact Info**: [[C.V.](https://eltsai.github.io/assets/resume/Elisa_CV_2025_07.pdf#view=FitH)] (last updated: July 2025) [[Google Scholar](https://scholar.google.com/citations?user=3NA-OTQAAAAJ&hl=en&oi=sra)] [[Github](https://github.com/eltsai)] [[LinkedIn](https://www.linkedin.com/in/elisa-tsai-umich/)]
    "
%}

Selected Publications
------
{% include publication-block.html 
  title="Harmful Terms and Where to Find Them: Measuring and Modeling Unfavorable Financial Terms and Conditions in Shopping Websites at Scale"
  resources='<i class="fas fa-file-pdf"></i> [arXiv](https://www.arxiv.org/abs/2502.01798) <i class="fab fa-github"></i> [Code](https://github.com/eltsai/term_miner) <i class="fas fa-database"> </i> [Dataset](https://huggingface.co/datasets/eltsai/ShopTC-100K) <i class="fab fa-blogger-b"> </i> [Blog Post](https://eltsai.github.io/posts/2025/02/harmful-terms/) <i class="fas fa-bookmark"></i> [NDSS Poster](https://www.ndss-symposium.org/wp-content/uploads/2025-poster-65.pdf)'
  authors="Elisa Tsai, Neal Mangaokar, Boyuan Zheng, Haizhong Zheng, Atul Prakash"
  conference='The Web Conference (WWW) 2025 (<span style="color: #880000">Oral</span>)'
%}

{% include publication-block.html 
    title="ELFS: Label-Free Coreset Selection with Proxy Training Dynamics"
    resources='<i class="fas fa-file-pdf"></i> [arXiv](https://arxiv.org/abs/2406.04273) <i class="fas fa-file-video"></i> [ICLR](https://iclr.cc/virtual/2025/poster/27703) <i class="fab fa-github"></i> [Code](https://github.com/eltsai/elfs) <i class="fas fa-file-pdf"></i> [Slides](https://iclr.cc/media/iclr-2025/Slides/27703.pdf)'
    authors="Haizhong Zheng (co-lead), Elisa Tsai (co-lead), Yifu Lu, Jiachen Sun, Brian R. Bartoldson, Bhavya Kailkhura, Atul Prakash"
    conference="The International Conference on Learning Representations (ICLR) 2025"
%}

{% include publication-block.html 
    title="Class-Proportional Coreset Selection for Difficulty-Separable Data"
    resources='<i class="fas fa-file-pdf"></i> [arXiv](https://arxiv.org/abs/2507.10904)'
    authors="Elisa Tsai, Haizhong Zheng, Atul Prakash"
    conference="ICCV 2025 Workshop on Curated Data for Efficient Learning (CDEL)"
%}

---

For the full publication list, please check out my [Google Scholar](https://scholar.google.com/citations?user=3NA-OTQAAAAJ&hl=en&oi=sra).


Teaching
------
{% include table-block.html 
  header1='Term'
  header2='Course'
  header3='Description'
  row1_col1='Winter 2024'
  row1_col2='[Computer & Network Security](https://docs.google.com/document/d/1DConE68c6UNvePET4EZDsiKxXr8XnWkrZORmxWbESTc/edit)'
  row1_col3='Seminar-based course with extensive reading list on computer and network security topics'
  row2_col1='Fall 2023'
  row2_col2='[EECS 281 Data Structures and Algorithms](https://eecs281staff.github.io/eecs281.org)'
  row2_col3='Core CS course covering fundamental data structures and algorithms'
  row3_col1='Winter 2023'
  row3_col2='[EECS 598-012 Secure and Trustworthy ML](http://www-personal.umich.edu/~rtfeng/wn23_eecs598_012.html)'
  row3_col3='Discusses adversarial ML attacks, defenses, model stealing, poisoning, fairness, and privacy'
%}

Community Service
-------
<mark>University of Michigan</mark>

{% include table-block.html 
  header1='Organization'
  header2='Role'
  header3='Period'
  header4='Description'
  row1_col1='SECRIT Reading Group'
  row1_col2='Co-Host'
  row1_col3='2021-2024'
  row1_col4='Hosted weekly discussions on recent security and privacy papers. [[Wiki](https://wiki.eecs.umich.edu/secrit/index.php/Main_Page)] [[Calendar](https://calendar.google.com/calendar/u/0?cid=Y19haXM3N29xY2Iwb3I4Mms5MHJmcWsxZ2tvNEBncm91cC5jYWxlbmRhci5nb29nbGUuY29t)]'
  row2_col1='CSEG'
  row2_col2='Outreach Chair'
  row2_col3='2022-2023'
  row2_col4='Organized outreach events and workshops.'
  row3_col1='CSEG'
  row3_col2='Social Co-Chair'
  row3_col3='2022-2023'
  row3_col4='Co-organized social events for CSE graduate students.'
%}

<mark>Reviewing Service</mark>

1. Program Committee, WWW'25 Short Paper Track
2. Reviewer, WWW'25 Research Track
3. Reviewer, ICLR 2025 SCOPE Workshop
4. Reviewer, ICLR 2025 
   
   ...

-------

<span style="color: #c3c3c3;">Last Updated: {{ page.last_modified_at | date: "%Y.%m" }}</span>

