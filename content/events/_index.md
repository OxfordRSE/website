---
title: "Oxford RSE Events"
date: 2018-05-02T16:20:41+01:00
draft: false
---


<h1>{{ with .Site.GetPage "section" "events" }}{{ .Title }}{{ end }}</h1>

{{ range .Pages }}
        <li>
            <a href="{{.Permalink}}">{{.Date.Format "2006-01-02"}} | {{.Title}}</a>
        </li>
{{ end }}
