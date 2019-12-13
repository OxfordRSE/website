---
title: "Survey results"
date: 2018-12-06
draft: false
---

In April 2018 we launched a [short survey](/rse_post/survey_launched/) to assess the need for Research Software Engineering expertise within the University of Oxford.
On the back of an overwhelmingly positive response to that survey, we have formed an RSE group with initial support from the [EPSRC Impact Acceleration Account](https://www.mpls.ox.ac.uk/internal-research-funding/impact-and-innovation/iaa), and are now open for business.
Please [contact us](mailto:rse@cs.ox.ac.uk) if you would like to discuss a software project.


## Who responded to the survey?
We received 375 responses in total from across a broad spectrum of departments, with roughly 60% from [MPLS](https://www.mpls.ox.ac.uk/) and 30% from [Medical Sciences](https://www.medsci.ox.ac.uk/).

### MPLS
{{< figure
src="/images/survey_results/responses_from_mpls_departments.svg"
caption="Number of responses from MPLS departments."
>}}


### Medical Sciences
{{< figure
src="/images/survey_results/responses_from_medical_sciences_departments.svg"
caption="Number of responses from Medical Sciences departments."
>}}


## Do those writing software have the skills they need?
An important question that we wanted to answer was whether those currently developing research software within the University have the skills necessary for that software to be high-quality, maintainable and sustainable.

This is important, as we identified that around 85% of those using research software say it is vital to their research.
The quality of that software, therefore, is integral to the reliability of research outputs.
Despite this high dependence on research software, we found that 70% of those who develop their own software are self-taught, without formal training in software development or software engineering.
This indicates that software is not being developed in line with current best-practices, reducing the likelihood of the resulting software being of high quality.

This, indeed, is backed up by our findings.
[Version control](https://en.wikipedia.org/wiki/Version_control), [unit testing](https://en.wikipedia.org/wiki/Unit_testing), and [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration) are three fundamental tools that are indispensable to the production of high-quality and reliable software.
30% of students and postdocs who develop their own software declared themselves as underconfident in the use of version control, with that figure increasing to 60% for unit testing and to 75% for continuous integration.

These figures are not unexpected, but serve to highlight the lack of industry-standard techniques currently employed by those writing research software in the university.


{{< figure
src="/images/survey_results/how_important_is_research_software_to_your_work.svg"
caption="The overwhelming majority of those using research software say that it is vital to their work."
>}}

{{< figure
src="/images/survey_results/how_do_developers_obtain_the_skills_they_need.svg"
caption="A large majority of those who develop their own research software are self taught."
>}}

{{< figure
src="/images/survey_results/student_postdoc_devs_confident_with_version_control.svg"
caption="A substantial minority of students and postdocs who develop their own software are underconfident with version control."
>}}

{{< figure
src="/images/survey_results/student_postdoc_devs_confident_with_unit_testing.svg"
caption="A majority of students and postdocs who develop their own software are underconfident with unit testing."
>}}

{{< figure
src="/images/survey_results/student_postdoc_devs_confident_with_continuous_integration.svg"
caption="A large majority of students and postdocs who develop their own software are underconfident with continuous integration."
>}}



## Commercialisation of research software

An important aspect of software development in an academic context is the viability of future commercialisation.
We found that many developers (40% of respondents) want to commercialise the software they write.
In light of the previous finding that those writing software tend not to have formal training, we drilled down into this figure to establish whether software is currently being written of a sufficient quality to be ready for commercialisation.

As many as 70% of academics (lectures and group leaders) whose lab develops their own research software said that they felt comfortable sharing their code with an industrial partner.
However, of those academics, as many as 40% were underconfident in unit testing, possibly the most basic tool for ensuring the correctness of software.

This indicates to us that a large proportion of academics are overconfident about the quality of software produced in their labs, and that much of the software with commercialisation potential is likely not written to be robust or sustainable enough to translate to a commercial environment.


{{< figure
src="/images/survey_results/do_developers_want_to_commercialise_their_software.svg"
caption="A substantial proportion of developers would like to commercialise their software."
>}}

{{< figure
src="/images/survey_results/do_they_feel_comfortable_sharing_code_with_an_industrial_partner.svg"
caption="The majority of academics (not including students and postdocs) whose lab develops their own software say they feel comfortable that their code is ready to share with an industrial partner."
>}}


{{< figure
src="/images/survey_results/do_they_unit_test.svg"
caption="Many academics (not including students and postdocs) whose labs develop their own software have not heard of, or are not confident with, unit testing."
>}}


## The current funding for research software expertise

Given the ubiquity of research software in Oxford, how is that work currently funded?
Very few academics who responded to the survey (under 10%) are in a position to hire a full-time software developer.
This leads to the (unsurprising) conclusion that most software is being developed by DPhil students and postdocs.

Given the lack of formal training that those developing software tend to have, it is no surprise that 75% of respondents who develop their own software say they would be interested in receiving expert software engineering assistance.
In addition to this, over 70% of academics responded that they would be very likely to hire a professional software developer, if the facility was available within the university.
There is, therefore, both a demand for software engineering expertise on the part of those writing the research software, and capacity for software engineering expertise on the part of those in a position to pay for it.

In terms of where the funding is coming from, over 40% of academics do explicitly put software development costs in funding proposals, but we found also that over 40% do not, even though they expected to write software as part of the grant.
This result is interesting, as it indicates that many academics see software development as the responsibility of members of their lab, despite most having no formal training and, furthermore, much of their research that is reliant on software is not explicitly reported as such to research councils, hindering policy makers from knowing the true extent of research software within academia.


{{< figure
src="/images/survey_results/could_academics_hire_a_full_time_software_developer.svg"
caption="The overwhelming majority of academics (not including students and postdocs) could not hire a full-time software developer."
>}}

{{< figure
src="/images/survey_results/developers_want_help_with_software.svg"
caption="The vast majority of respondents who develop their own software would be interested in receiving expert software engineering help."
>}}

{{< figure
src="/images/survey_results/would_academics_use_an_rse_service.svg"
caption="Academics (not including students and postdocs) responded that they would be very likely to hire a professional software developer, if the facility was available within the university."
>}}

{{< figure
src="/images/survey_results/do_academics_include_costs_for_software_development_in_proposals.svg"
caption="A substantial proportion of academics (not including students and postdocs) who expect them or their group to be writing software do not include those costs in funding proposals."
>}}


## Conclusions

Putting this all together, we conclude with the following:

* Software is demonstrably vital to a very large proportion of University research output
* The majority of those writing software do not have the formal training or the skills necessary to produce high-quality software
* A substantial amount of software is potentially commercialisable, but is probably of insufficient quality to be directly transferable to a commercial setting
* Many academics explicitly cost for software development in grants, and would use an RSE service if it existed

We found the results of this survey provided a compelling argument for the need for professional software engineering expertise within the University of Oxford.
Such expertise could help both with basic research, and streamline the path to commercialisation.

With these goals, the Oxford Research Software Engineering group now exists and is open for business.
Please [contact us](mailto:rse@cs.ox.ac.uk) if you would like to discuss a software project.