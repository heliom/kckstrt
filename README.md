# Kckstrt
> Even designers can kickstart a project.

Generate a Sinatra app in 4 easy steps:

```
kckstrt generate MyApp
cd my_app
script/setup
foreman start
```

See a generated app example: [kckstrt-hello-world][helloworld]

## Features
- [Heroku]-ready
- One-step [installation script][installation]
- Sprockets ([Stylus][] & [Nib][] enabled)
- [Assets helpers][helpers]

## Todo
- `[ ]` Add CSS preprocessors (Sass/SCSS, Less)
- `[ ]` Add HTML template engines (Haml)

## Credits
[Rafael][rafBM] & [Etienne][EtienneLem]

## Copyright
© 2012 Heliom. See [LICENSE][] for details.

[helloworld]: https://github.com/heliom/kckstrt-hello-world
[Heroku]: http://www.heroku.com
[installation]: lib/kckstrt/templates/script/setup
[Stylus]: https://github.com/learnBoost/stylus
[Nib]: https://github.com/visionmedia/nib
[helpers]: lib/kckstrt/templates/app/helpers/helpers.rb
[rafBM]: https://github.com/rafBM
[EtienneLem]: https://github.com/EtienneLem
[LICENSE]: ./LICENSE.md
