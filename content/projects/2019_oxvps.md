---
title: "Oxford Visual Perception Screen (OxVPS)"
client: "[Department of Experimental Psychology](https://www.psy.ox.ac.uk/), University of Oxford"
description: "A mobile app for screening for visual perception problems after stroke."
date: 2020-10-02
draft: false
---

A large number of stroke patients - up to almost 80% - suffer visual impairment after stroke.
Such impairment can include neglecting objects on one side of vision, visual hallucinations, difficulties recognising faces or objects and impaired motion perception.
Only 20% of patients and carers, however, self-report these impairments.
Systematic screening is therefore essential, but the current assessment methods are slow, resulting in increased time pressure on NHS staff.
The current lack of experts in neuropsychology also means that reliability of assessment could be improved.
     
The OxVPS project is led by [Dr Kathleen Vancleef](https://www.psy.ox.ac.uk/team/kathleen-vancleef) from the [Department of Experimental Psychology](https://www.psy.ox.ac.uk/) at the University of Oxford.
It aims to standardise the administration of assessments, as well as to leverage new technologies to reduce human errors and save precious time through automated scoring and reporting.
At the core of the project is the development of a mobile screening application suitable for assessing stroke patients in Acute Stroke Units.
This app is based on a previously developed paper-based screening tool.
     
## OxRSE involvement

{{< figure src="/images/projects/OxVPS_screenshots.jpg" caption="Screenshots of the mobile application developed by the OxRSE team for the OxVPS project.">}}

OxRSE was involved from the very early stages of the OxVPS project.
Fergus Cooper, Mihaela Duta and Thibault Lestang provided both the software engineering expertise and development work to turn the paper-based assessment into a full-blown mobile app.
The app can be used by clinicians with very limited time and is suitable for stroke patients who have impairments such as neglecting objects on one side or difficulties recognising objects.

The app was developed in [typescript](https://www.typescriptlang.org/) using the [ionic cross-platform framework](https://ionicframework.com/), and primarily targets Android tablets.
A number of specific development challenges had to be addressed, including:
 - ensuring that images, buttons and text remain optimally sized and placed to ensure maximum visibility on all devices, due to the nature of the participants being assessed;
 - ensuring all possibly tablet functionality, other than intended interaction sites, is locked down while participants are interacting with the tablets;
 - ensuring all data is handled in an appropriately secure manner.

OxRSE also worked closely with Dr Vancleef to implement an automatic scoring system, with a results overview being automatically generated at the end of each assessment for the benefit of the clinician performing the screening.
More complete data is securely stored in a cloud database, and can be downloaded for additional processing by Dr Vancleef and her team.

## Outcomes

OxRSE involvement has provided a robust app capable of assessing visual impairment in stroke patients, and the project gathered test data necessary to validate the app-based assessment against trusted paper-based visual perception tests.
On the basis of this initial work, funding is being sought to further develop this app into an approved clinical tool.
