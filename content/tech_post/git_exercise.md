---
title: "Starting out with Git and Version Control"
date: 2018-06-27
draft: true
syntax_highlighting: false
mathjax: false
---

A Version Control system is a set of tools that enables you to track changes in 
text files. It is traditionally used to track changes and allow for 
collaborative editing of source code, although it can be used for just about any 
text file. The basic idea has been around for a long time, with the Source Code 
Control System (SCCS) first released in the 1970s, but I think it is fair to say 
that in recent years Version Control has really entered the mainstream with 
developer community platforms such as [Bitbucket](https://bitbucket.org) and 
[GitHub](https://github.com/), all based around a Version Control system known 
as Git.

Git is a Distributed Version Control System (DVCS). Unlike previous systems such 
as Subversion, which featured a centralised *repository* of files that could be 
checked out and edited by users, a DVCS is characterised by each user having 
their own local repository, with edits to files (also known as *commits*) being 
communicated between individual repositories. Git is often used in conjunction 
with platforms like GitHub, which provide a free (for open-sourced projects and 
education use) service to host your code and perform a variety of project 
management tools to organise a small team of developers around a given project. 



This allows for much more flexibility in the organisation structure imposed on 
the DVCS by its users. It is possible to construct a centralised model, with a 
single main repository that everyone sends their commits to. Or alternatively 
the users could construct a more hierarchical model, with *satellite* 
repositories that single users, or groups of users communicate with, with 
satellite repositories eventually pooling their commits back to the main 
repository. A few good Git organisation structures, or workflows, are discussed 
[here](https://www.atlassian.com/git/tutorials/comparing-workflows) and 
[here](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows), 
although you might want to get more familiar with the basic concepts and 
operations of Git before browsing these links.

k
