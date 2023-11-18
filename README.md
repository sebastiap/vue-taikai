# vue-taikai

# ![WebApp](https://www.fayerwayer.com/resizer/nLOUNkJxSJesU5gLLGTz3vzAYQI=/800x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/I5V3NPJ4NVG2HNATNW5PJEI2JE.jpg)
<table>
<tr>
<td>
  A webapp using Vue to show a concept game based on the popular franchise Dragon Ball Super.
</td>
</tr>
</table>


## Demo
Here is a working live demo :  
https://scintillating-maamoul-ff980a.netlify.app/

## Concepts 

### Array copied by value and reference :

 * https://midu.dev/como-clonar-un-array-en-javascript/
 
### CSS Positioning 

 * https://www.youtube.com/watch?v=MxEtxo_AaZ4&list=WL&index=174

### CSS calc

 * https://css-tricks.com/a-complete-guide-to-calc-in-css/

## Tools

### CSS gradient

 * https://cssgradient.io/

### Favicon Generator

 * https://favicon.io/

## [Usage](https://iharsh234.github.io/WebApp/) 

### Color Palette
 * https://coolors.co/659157-f7ffe0-faa43d-55a8fd-e05263

### Other Tools
 * https://doodlenerd.com/html-control/css-dropdown-generator

### Development
Want to contribute? Great!

### Bug / Feature Request

## Built with 

- [Vue](https://es.vuejs.org/v2/cookbook/) - Vue is a JavaScript framework that facilitates the UI (user interface) development of websites and single-page applications. A progressive JavaScript framework, Vue makes creating user interfaces simpler and more enjoyable.
- [Vite](https://vitejs.dev/guide/) - Vite aims to address the slow feedback loop of multiple js layers by leveraging new advancements in the ecosystem: the availability of native ES modules in the browser, and the rise of JavaScript tools written in compile-to-native languages.
- [Docker](https://es.vuejs.org/v2/cookbook/dockerize-vuejs-app) - Extensive list of components and  Bundled Javascript plugins.

### Vue Tools Used
- v-on directive to listen to DOM events. Used to call methods.
- v-bind directive for style variables.
- v-model directive to select characters and forms.

## To-do
 * Add Logic
 * Improve Visuals
 * Promote the site

### Add Logic - Game Content
- [x] Game Intro
- [x] Energy Bar
- [x] Result Dialogs
- [x] Improve ZenoState 
- [x] Fallen Characters and Fallen Game Over
- [x] run away method
- [x] empujar method
- [x] Apply Techniques
- [x] Show Points
- [x] Blackout Game Over
- [x] Remove Comments
- [x] More variation in random
- [ ] Bring Balance to the world

### Improve Visuals - Visual Content to add
- [x] fichaDatos class
- [x] puntaje class
- [x] Dialogs transition
- [x] Blackout Effect
- [x] ATTACK Animation
- [x] RUN AWAY Animation
- [x] PUSH Animation
- [x] Improve Character Animation
- [x] Improve Character change Animation
- [x] Improve Enemy Animation
- [x] Improve Dialogs
- [x] Audio Effects
- [x] Improve Ending Dialogs
- [x] All in one page
- [x] Diferent resolutions
- [x] CSS vars
- [x] try in different devices

### Promote the site 
* youtube comments
* Make a twitter
* Add to Gamer portfolio
* Board Game version

### Expansion
* Better energy bar
* Filter usable tranformations?
* Unlimited/Arcade Mode
* Public surprise when a special action happens
* More Characters
* More techniques 
* Sounds,graphics and animation for techniques
* Amazon Enemys
* Boss Mode
* Card Game
* Unlockeable Characters & Techniques
* Setting the team before playing (Each character has a cost and you have a limited amount of point to make the team)

## Team

[![Sebastian Picardi](https://avatars.githubusercontent.com/u/36540321?v=4)](https://github.com/sebastiap)  
Sebastian Picardi

## Recommended IDE Setup for this project

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=Autoclosetag).

## Problem Solved

* How do I add CSS animations when updating a value with vue.js? 
Used by poderactual
https://stackoverflow.com/questions/42537359/how-do-i-add-css-animations-when-updating-a-value-with-vue-js

* How do I pass an array of values to another without passing the reference? This avoid the problem of updating every reference.
Used by personajes
this.personajes = JSON.parse(JSON.stringify(this.personajesRst));

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```
