## Commands
ng new <project>
: 	create new project (create folder <project> with everything included at this location
ng serve [--port <portNumber>]
:	run angular application (from within project-folder)
:	[can specify port, standard 4200]
:	open URL http://localhost:<portNumber>
ng generate component <component>
:  	creates a component with name <component> for current project


## Important files
### Main project
Main page
:    	<project>/src/index.html
NgModule
:	<project>/src/app/app.module.ts
:	specifies the components (declarations), dependencies of module (imports), dependency injections (providers), top-layer component (bootstrap)
Main application component (Typescript, Template)
:	<project>/src/app/app.component.ts
: 	<project>/src/app/app.component.html

### Component
TypeScript
:	<project>/scr/app/<component>/<component>.component.ts
:	specify tag-name (selector), (html-input (template)), html- (templateUrl) and css-file(s) location (styleUrls) here
:	
Template
:	<project>/scr/app/<component>/<component>.component.html
:	location specified in TypeScript
Style
:	<project>/scr/app/<component>/<component>.component.css
:	location specified in TypeScript

## Code
### Typescript for Component

```typescript
/* import TypeScript objects Component and OnInit from module @angular/core */
import { Component, OnInit } from '@angular/core';

@Component({
	selector: '<tag-name>',		/* tag-name of component */
	templateUrl: './<htmlFile>',	/* location of template (html) file */
	styleUrls: ['.<cssFile>']	/* locations of style (css) files */
})

export class <component> implements OnInit {
	<varname>: <vartype>;		/* declare class property */
       
    constructor(){				/* constructor of class */
       	this.<varname> = <varvalue>;
	}

    ngOnInit(){}
}
```

### HTML for Component
- easy one
```html
<p>
	Hello {{<classvar>}}
</p>
```

- with for-loop
```html
<!-- for an array class variable <classvar> -->
<ul>
	<li *ngFor="let <iterator> of <classvar>">Hello {{<iterator>}}</li> 	<!-- for-loop to create DOM element for every item in collection -->
</ul>
```

- or directly
```html
<!-- for an array class variable <classvar> -->
<ul>
	<li *ngFor="let <iterator> of <classvar>">
	<anotherComponentTag [<iterator>]="<varInAnotherCoponentTemplate>"></anotherComponentTag>	<!-- for-loop to create DOM element for every item in collection -->
</ul>
```