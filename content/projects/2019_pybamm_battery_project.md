---
title: "PyBaMM Battery Modelling"
client: "[Mathematical Institute, University of Oxford](https://www.maths.ox.ac.uk/)"
description: "Enabling the comparison of battery models."
image: "rse_skyline.svg"
imagealt: ""
date: 2019-01-01
draft: false
---

Battery technology is fundamental to the implementation of a low-carbon economy.
This project is in collaboration with [Prof. Jon Chapman](https://www.maths.ox.ac.uk/people/jon.chapman) and [Prof. Colin Please](https://www.maths.ox.ac.uk/people/colin.please) in the [Oxford Centre for Industrial and Applied Mathematics](https://www.maths.ox.ac.uk/groups/ociam) (OCIAM).
As part of the [Faraday Institute's](https://faraday.ac.uk/#) [Multiscale Modelling](https://faraday.ac.uk/research-projects/battery-system-modelling/) project, they are developing a suite of mathematical models suitable at different scales, and this software engineering project will provide a framework, [PyBaMM](https://github.com/pybamm-team/PyBaMM) in which these models can be simultaneously accessed, to enable comparison between modelling approaches and choice of the appropriate model for particular applications, as well as comparison to data.  

PyBaMM is being developed by a team comprising of Research Software Engineers and DPhil/postdocs from the OCIAM group: [Valentin Sulzer](https://www.maths.ox.ac.uk/people/valentin.sulzer), [Scott Marquis](https://www.maths.ox.ac.uk/study-here/postgraduate-study/industrially-focused-mathematical-modelling-epsrc-cdt/scott-marquis), [Martin Robinson](https://github.com/martinjrobins), and [Rob Timms](https://www.maths.ox.ac.uk/people/robert.timms).
The RSE group assisted in the initial design of the project, ensuring the modularity of the software developed to ensure that the wide range of modelling approaches used across the Faraday collaboration could be integrated into the framework in a consistent manner.
We worked with the team to ensure modern software engineering practices, including comprehensive documentation and unit/integration testing integrated into a continuous integration infrastructure, as well as portability across Linux, Mac and Windows platforms.

The aim is for PyBaMM to become a standard framework for the development of software implementations of new models of battery behaviour.
The underlying research will provide theoretical models that explain battery behaviour, and PyBaMM will allow researchers to develop, assess and validate their models far more quickly than would otherwise occur, reducing the barrier to adoption and drastically reducing the time to impact.
