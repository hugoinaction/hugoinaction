Debugging Hugo made easy
=========================



Usage
------

Import as a Hugo module
```bash
hugo mod get github.com/atishay/hugo-debug-utils
```

Add in your template.

```go-html-template
{{- partial "debug/debug.html" (dict "context" .) -}}
```

If you need the template information, in each template provide

```go-html-template
{{- partial "debug/debug.html" (dict "context" . "template" "layouts/<your template location>") -}}
```


For printing to JavaScript console while development:
```go-html-template
{{ partial "console" $someVariable }}
```


Contents
--------

### Debug Menu

* Based on JugglerX's debug bar - https://github.com/JugglerX/hugo-debug-bar
* Which includes Kaushal modi's debug print - https://github.com/kaushalmodi/hugo-debugprint


### Debug JSON helper
* Based on Scherb's helper - https://discourse.gohugo.io/t/easier-debugging-hugo-variables-using-the-javascript-console/22873
