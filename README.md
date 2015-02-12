#PyroCMS 3 Semantic-ui Theme

Semantic offers complete design freedom. High level variables and an intuitive inheritance system lets you change the look and feel of your components with just a handful of lines

## Instructions 

* Inside your PyroCMS 3 intallation's `addons` folder, create either `default` (or `shared`) folder.

* Copy your theme's files into the Vendor sub-folder `addons/default/websemantics`
  
* In your distribution config file `config/distribution.php` set the value of `public_theme` to `Websemantics\SemanticuiTheme\SemanticuiTheme`

* Go to `addons/default/websemantics/semanticui-theme/resources/build/` folder and run the bash file `./build.sh`. This will install all the required node modules, compile semantic-ui and copy css, js etc files to the respective theme folders (css, js, fonts etc). You might be prompted to enter the root password.

* To override the theme, write your styles in `addons/default/websemantics/semanticui-theme/resources/build/semantic-site`, then re-run `addons/default/websemantics/semanticui-theme/resources/build/build.sh`

* Link your views to the theme layout, i.e. `addons/default/websemantics/some-module/resources/views/index.twig`

```
{% extends "theme::layouts/default" %}

{% block content %}

<div> CONTENT </div>

{% endblock %}
```

* Enjoy

## Open Source Project 

https://github.com/Semantic-Org/Semantic-UI

Generated by, Boxed - http://websemantics.github.io/boxed/
