# Vue Instance
var <instance name> = new Vue({
    el: '#<html-id>'
    data: <data>,
    methods: <methods> (always runs if re-render happends),
    created: <method to run after an instance is created> (see also beforeCreate, beforeMount, mounted, beforeUpdate, updated, beforeDestory, destroyed),
    computed: <computedProperty out of method> (similar to methods, but automatically notices dependences, cached based on their reactive dependencies: updates only if dependences change),
    watch: <watchedProperty> (define data that is beeing watched for changes and define method that is activated if case of changes: generic way to observe and react to data changes - often better to use computed)
})

* exposes instance properties and methods by using $
<instance name>.$data

## Example
var my-instance = new Vue({
  el: '#my-html-id',
  data: {
    my-variable: 'Hello Vue.js!'
  },
  methods: {
    my-function: function () {
      this.my-variable = this.message.split('').reverse().join('')
  },
  created: function () {
    console.log('a is: ' + this.a)
  }
  computed: {
    computed-property: function() {
      return this.my-variable
    }
    fullName: {
      get: function() {
        return this.firstName + ' ' + this.lastName
      }
      set: function(newValue) {
        var names = newValue.split(' ')
	this.firstName = names[0]
	this.lastName = names[names.length - 1]
      }
    }
  }
  watch: {
    my-variable: function(val) {
      this.new-variable = val + 'new'
    }
  }
  
})

# Vue Component - can be used as html-tag <component-name> 
Vue.component('<component-name>', {
			props: [<custom-attribute>] (list of attributes from which the component accepts values as input)
			template: '<html-template(using props)'> (<slot></slot> can be used for custom text inside component)
})
* props is needed to inject data into template
* accepts same options as new Vue (e.g. data, computed, ...)
* data option must be function such that each instance can maintain an independent copy
  (data: function () { return { count: 0 } } instead of data: { count: 0 })
* all included elements have to be wrapped in one parents element
* for specific html-elements (ul, ol, table, select; li, tr, option) have to use something like <li is="component-name"> instead of <component-name>

## Dynamic components
<component v-bind:is=<method to give current component>></component>


# Variables
## variable in html-environment
{{ <var-name> }}
* refers to item e.g. in data-part of vue-instance

## variable in html-attribute
"<var-name>"
"[<var1>, <var2>]"
<h1 v-if="<var-name>">


# Directives
* to reactively apply side effects to DOM when value of its expression changes
* values have to be single javascript expression

## v-html
* replace content of html-environment with value of the given property (e.g. of rawHtml)
<span v-html="rawHtml">

## v-bind
<div v-bind:id="dynamicId">
<div :id="dynamicId">
* reactively update a html attribute with dynamic content

## v-if, v-else-if, v-else
<span v-if="seen">
* conditional rendering
* group elements with <template v-if="ok"> ... </template>
* prefer over v-show if condition is unlikely to change at runtime
* control reusable elements with key-attribute (use 'key' to force re-rendering of this element)
* not recommended to use with v-for

## v-show
<span v-show="seen">
* conditionally displays an element, but will always be rendered and does not work with <template> and v-else
* prefer over v-if if you need to toggle something very often

## v-for
<li v-for="todo in todos">{{todo.message}}</li>
* render list of items base on an array
* todo is alias for array element being iterated on
* use 'in' or 'of' as delimiter
* add key attribute (or v-bind:key) if existing elements should be reordered (recommended!)
<li v-for="(item, index) in items">{{parentMessage}}-{{index}}-{item.message}}</li>
* full access to parent scope properties (here parentMessage)
* optional index argument
<li v-for="value in object">
<li v-for="(value, key) in object">
<li v-for="(value, name, index) in object">
* can also iterate through properties of an object, instead of array entries
<li v-for="n in 10">
* can be normal for-loop
* can use <template> tag to render block fo multiple elements
### Mutation methods for arrays
push, pop, shift, unshift, splice, sort, reverse
### Non-mutating methods
filter, concat, slice, ...
* always return new array - replace old with new array is efficient in Vue

## v-on
<button v-on:click="reverseMessage>
<button @click="reverseMessage>
* listen to DOM elements and run method when directive is triggered
* possible to hand over event implicitely, using function(even) and v-on:click=<functionname> or explicitely via $event v-on:click=<functionname>($event)
### Event modifiers
.stop, .prevent (prevent page refreshing after action), .capture, .self, .once, .passive
### Key Codes (I think for v-on:keyup.<modifier>) or a number
.enter, .tab, .delete, .esc, .space, .up, .down, .left, .right
.ctrl, .alt, .shift, .meta (modifiers to trigger mouse or keyboard event listeners only when key is pressed)
.left, .middle, .right (mouse)

## v-model
<input v-model="message">
to create two-way data bindings on form input, textarea, and select elements
* ignores initial value, checked or selected attributes: declare initial value in data!
### Modifiers
.lazy (syn happens after change events and not after each input event)
.number (typecast input as number)