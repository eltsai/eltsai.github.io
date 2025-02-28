---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: false
---

## Research Projects
{% assign sorted_projects = site.projects | sort: 'date' | reverse %}

{% for project in sorted_projects %}
  {% include publication-block.html 
    title=project.title
    resources=project.resources
    authors=project.authors
    conference=project.venue
  %}
{% endfor %}

## Hobby Projects

{% assign sorted_hobby_projects = site.hobby | sort: 'date' | reverse %}

{% for hobby in sorted_hobby_projects %}
  {% include publication-block.html 
    title=hobby.title
  %}
{% endfor %}