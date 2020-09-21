---
title: "Global.health"
client: "[Global.health: a Data Science Initiative](https://global.health/)"
description: "Delivering a scalable platform for epidemic tracking and analysis"
date: 2020-09-18T16:00:00+01:00
draft: false
---

## Global.health: a Data Science Initiative

Researchers at the Boston Children's Hospital and collaborating institutions created [Healthmap](https://healthmap.org/), a tool for tracking the spread of epidemics in humans and animals. First used to great success in the Ebola outbreak of 2014, associating cases of "a mysterious haemmorhagic fever" with confirmed cases of Ebola to allow experts and the public to see a more accurate state of the spread of the virus, Healthmap continued to be applied through the SARS and MERS epidemics, and is regularly used to track seasonal flu.

The rapid global spread of the COVID-19 pandemic overwhelmed both the manual processes used by the Healthmap team, and the digital infrastructure used to record the data. A collaboration between BCH, Oxford University, and Google.org led to [Global.health](https://ghdsi.org): an improved, scalable platform for disease tracking. Real-time acquisition of case data shows where potential hotspots may break out, and the effect of policy changes on the spread of the virus.

## Oxford RSE involvement

The RSE group worked with Dr. Moritz Krämer's group in the Department of Zoology, software engineers at Google.org and the rest of the Global.health collaboration to design, plan, implement and deliver the platform. We replaced a manual spreadsheet-based form for recording data with an automated ingestion pipeline, importing daily updates from government health departments across the world. The platforms is deployed in a scalable cloud-based cluster using Kubernetes, AWS, and a serverless design with a NoSQL data store. Students working with the RSEs delivered many of the scripts that parse the upstream data.

The source code for the Global.health platform is [published on Github](https://github.com/globaldothealth/) under the MIT license.
