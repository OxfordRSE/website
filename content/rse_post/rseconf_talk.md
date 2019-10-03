---
title: "RSE Conference 2019 Talk on Engineering Principles"
date: 2019-10-02
draft: false
---

RSE team member [Graham Lee](https://twitter.com/iwasleeg) gave a talk to [the Fourth Conference on Research Software Engineering](https://rse.ac.uk/conf2019/), on how (or whether) principles from software engineering methodologies that arose in commercial contexts apply to research software. This is based on his experience in commercial software teams at various scales: small startups, multinationals based in the UK and US, and at agencies working with all varieties of commercial customers.

Graham recently became an RSE in Oxford. He noted in his talk that this may limit the generality of his observations to other academic contexts: not many corporate management and governance systems have outlived [entire empires](https://en.wikipedia.org/wiki/Ottoman_Empire), so the way things work in Oxford is likely to be quite idiosyncratic. Unless [this sort of thing](https://www.telegraph.co.uk/news/uknews/1314859/Mallard-leads-Oxford-fellows-a-merry-dance.html) is commonplace.

Software engineering, according to our colleagues upstairs at the [Software Engineering Programme](http://www.cs.ox.ac.uk/softeng/), is:

> the application of scientific and engineering principles to the development of software systems—principles of design, analysis, and management—with the aim of:

> - developing software that meets its requirements, even when these requirements change;

> - completing the development on time, and within budget;

> - producing something of lasting value—easy to maintain, re-use, and re-deploy.

This is a great goal, but we don't think it matches with reality. A more accurate, though less precise, definition of software engineering is "things done by people who call themselves software engineers". Plenty of software teams hire for "engineering" roles without necessarily requiring the application of scientific or engineering principles. Software is written by software engineers without explicit consideration of design principles, analysis, or management - and some of it succeeds in its goals. While software engineering arose in a defense context, discussions in commercial software development contexts have downplayed the significance of "completing development on time, and within budget" in favour of steadily providing valuable software.

## Agile Software Development

Various experiments and conversations around the applicability of traditional engineering-style methodology to the software development context came to a focus in 2001 with the publication of the [Manifesto for Agile Software Development](http://agilemanifesto.org/). It was a reaction of sorts to the management-centric methods of software engineering, by people who were "doing it and helping others do it". The manifesto is famous for its values ("individuals and interactions over processes and tools", and so on), the [principles](http://agilemanifesto.org/principles.html) are of more interest. Do they apply to a research software engineering context?

### Questionable Principles

> Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.

This seems straightforward, but what about software is "valuable" to researchers? If it's money, then should we focus on commercial licensing of research software IP, or on the ability of software to support grant applications or win prizes? Is publication output important, and if so do we mean the publication _of research software_ in the literature or the research publications _that are supported by_ the software? Is it the present value, or the future value, of the software that's most important? Or the prestige to an institution of being home to the tool that redefined a discipline? How do we trade these different values?

> Deliver working software frequently...Working software is the primary measure of progress.

As Einstein [may not have said](https://asociologist.com/2010/09/04/adventures-in-fact-checking-einstein-quote-edition/), "If we knew what we were doing, it wouldn't be called 'research', would it?" While testing can tell us whether we built the thing we thought we were going to build, it can be harder to define that the thing we built was the thing that _was needed_ in research domains with lots of unknowns.

And yet, primarily perhaps due to the waterfall nature of research funding, we typically still plan and staff projects around the [Iron Triangle](https://www.stakeholdermap.com/project-management/project-triangle.html) of fixed scope, fixed cost, and fixed quality, where "releasing" the software is a milestone activity somewhere near the end of the project. We have even heard of a research software project that claims to follow "Agile" development principles, but where managers said that they released once a year and were evaluating a move to twice per year. Is this Agile, does it follow the principle of releasing working software frequently?

Incidentally, why should a research software engineer worry about maintainability, reuse, or redeployment, if they do not know whether there will be funding to maintain the software past the release date? Or whether there will even be an activity using the software?

> Business people and developers must work together daily throughout the project.

One blocker to frequent releases in academic contexts is the likelihood of frequent synchronisation of stakeholders. It can be hard enough engaging with your principal investigator on a daily basis, around teaching commitments, committees, working lunches, and the other things we do instead of working. But who else are the relevant "business people"? The editor at the journal where you're submitting? The [anonymous] reviewers of your paper? The purse-holder at your funding body? Public participants? Your institution's lawyers, administrators, public relations staff? Spinout consultants? Do all of those people even _want_ to be involved in the day-to-day of a software project?

This particular concern is relevant in commercial settings too, by the way. Often the CEO and executive team see "agile" as a technical thing to be looked after by the CTO, not realising that:

1. collaboration with all of the experts and stakeholders in the thing being built is a core value;
2. the success or failure of their company hinges strongly on their ability to apply software to advancing their mission.

### Applicable Principles

On the other hand, there are principles from Agile software development that are significantly less contentious, and easy for a research software team to incorporate into their practices.

> At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behaviour accordingly.

> Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely.

> Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done.

### Where did Agile come from?

We should think more critically about the _context_ in which Agile arose. As mentioned, it was a reaction to the software engineering movement started in Garmisch in the 1960s. A common interpretation of software engineering was as a controlling activity, in which managers and analysts could successfully constrain developers into building the right things. In fact, software projects frequently overran their schedule, overspent their budget, or were cancelled without delivering anything of value. The people behind the Agile manifesto experimented with ways in which developers and domain experts could collaborate on incrementally and iteratively building better (more "valuable", that word again) software that evolved with the people building and using it, rather than being defined once and delivered at most once.

And they did this in the context of salaried software teams, working on long-term systems supporting particular businesses. [Extreme Programming](http://www.extremeprogramming.org/), defined by Kent Beck and colleagues, and one of the prototypical methodologies for the Agile movement, supported a payroll application at a large car manufacturer: Chrysler Comprehensive Compensation. Other Agile manifesto signatories were consultants and trainers, supporting similar teams. One of the signatories (Steve Mellor) had some research experience as a programmer at CERN and Lawrence Berkeley National Labs, but had been a commercial consultant for a long time before 2001.

Evolutionary, incremental ways of working, with introspection and improvement, work well in these contexts because there's an assumption that the same team (if not exactly the same collection of individuals) will be supporting the same system (if not exactly the same collection of bits) for a long time. That if I've been hired to work on Chrysler Comprehensive Compensation now, Chrysler will still want a solution to their compensation problem next year. And that as Chrysler changes, that solution will change. Once the headcount decision has been made, and the capital acquisitions to pay for desks, chairs and computers, the team is pretty much ready to go and has the responsibility (and hopefully the authority) delegated to it to solve the problem. There's a lot more leeway on _how_ you solve the problem, than if you have to go to a funding council and ask for exactly this much money to deliver exactly these things over exactly this timeframe.

## Post-Agile

A couple of movements have sprung up over the decades since the publication of the Agile Manifesto, either filling in gaps, rethinking values, or retelling existing stories.

### Software Craftsmanship

Described in depth in Pete McBreen's [Software Craftsmanship: The New Imperative](http://solo.bodleian.ox.ac.uk/primo-explore/fulldisplay?docid=oxfaleph021509836&context=L&vid=SOLO&lang=en_US) in 2001 (the same year that the Agile manifesto was signed), software craftsmanship looks to the medieval guild system as a way to propagate creative crafts. Software developers should be accountable for their work, in return for which they should get to sign for their work. Projects should be awarded based on the expected total future value, not the ticket cost of the developer's day rate.

The same phrase was taken as the call to arms for a new, post-Agile, [Manifesto for Software Craftsmanship](http://manifesto.softwarecraftsmanship.org/). There's really not much meat to the manifesto, though it does raise an interesting question.

> As aspiring Software Craftsmen we are raising the bar of professional software development by practicing it and helping others learn the craft.

Are Research Software Engineers "professional software developers"? Should we be paid for writing software, or for solving research problems or for helping others to do it?

### DevOps

Organised around the book [The Phoenix Project](http://solo.bodleian.ox.ac.uk/primo-explore/fulldisplay?docid=oxfaleph021514142&context=L&vid=SOLO&search_scope=LSCOP_ALL&tab=local&lang=en_US), which is itself a retelling of Eliyahu Goldratt's [The Goal](http://solo.bodleian.ox.ac.uk/primo-explore/fulldisplay?docid=oxfaleph010294438&context=L&vid=SOLO&search_scope=LSCOP_ALL&tab=local&lang=en_US) and an application of the theory of constraints to software delivery. DevOps reminds us of the importance of having people in different functions working toward the same goal, and collaborating on achieving that goal, over departmental conflicts and optimising for local efficiency.

In Oxford's context, RSEs are paid for by a particular pot of money and can be seconded out to research projects, funded by other pots of money. Some of the services and applications we use are provided by IT Services, which is paid for by a central pot of top-sliced funding. Each of these sources of funding comes attached to a different reporting structure, expectations, and needs. Those are going to exert significant pressure on attempts to all align on the same goal, if we can even agree what that goal is.

### Lean Startup

[The Lean Startup: how constant innovation creates radically successful business](http://solo.bodleian.ox.ac.uk/primo-explore/fulldisplay?docid=oxfaleph017845742&context=L&vid=SOLO&search_scope=LSCOP_ALL&isFrbr=true&tab=local&lang=en_US) describes a way of working that's suited to small teams with limited funding who have to quickly and cheaply demonstrate the value (that word again) of their work to increase their chances of gaining more funding in the next round. This sounds familiar to research!

The practices of Lean Startup share a lot with the scientific method. Come up with a hypothesis, then an experiment that confirms or supports the hypothesis. Usually, these hypotheses are around the idea of "product/market fit", i.e. whether there are enough customers who want what we're offering enough to pay for it to continue existing. Perform the experiment, and if it succeeds, iterate from the new position. If it fails, try something else, or "pivot" to a completely new area of interest.

## Lean Research?

There are problems with applying the Lean Startup model to the research context, too: again the project-based funding model implies that we know our goals for a fixed period and can't "pivot" if we find them uninteresting or unsolvable. There are areas where it fits well, too. Going back to the maybe-fake Einstein quote, we often _don't_ know what we're doing, so quick experiments that confirm or reject particular ideas are valuable for helping us to efficiently converge on a framework.

As researchers, we have other values, too. We don't necessarily need our experimental code to be maintainable or re-usable until we've found that underlying framework or paradigm and know that _it_ has value. We want to maintain our tools and libraries if they're going to be used by the wider community, but not if they aren't. So yes, we need to design for maintenance and extensibility, but _judiciously_, and we need to know the value of a good old-fashioned hack when we see one.

But on the other hand, we want our experiments to be _reproducible_, even when they aren't _extensible_ (or there's no value in extending them). We want to demonstrate that the line of reasoning we used, along with the code and data that support our reasoning, lead to the conclusions we drew. This is a reason to adopt practices like reproducible builds, version control, or automated regression tests even on seemingly "throwaway" software tools.

Our conclusion is that we can't just copy and paste whole schools of thought from commercial software engineers, and say that we're doing Agile research software engineering, or RSE Craftsmanship, or similar. We have different values in research software engineering, and to identify the practices that we should engage in, we have to enumerate those values and the principles that will support them.
