# Concepts

## Data binding
* interpolation binding: Component -> DOM `{{value}}`
* property binding: component -> DOM `[property] = "value"`
* event binding: DOM -> Component `(event)="handler"` - (event) or on-event
* two-way: DOM <-> Component `[(ng-model)]="property" (e.g. for input box)

## Directives
* a component extends the directive decorator
* structural directives: alter layout by adding, removing or replacing elements in the DOM, e.g. `*ngFor` or `*ngIf`
(<ng-container *ngFor="let absence of absences(date) | async"> triggers change detection constantly, what works is <ng-container *ngFor="let absence of absences | async">)
* attribute directives: alter appearance or behavior of existing element, e.g. `ngModel` (modifies behavior of `<input>`)

## Services
* component: enable user experience
* service: component can delegate processing tasks to service, best to use an injecatable service class by using @Injectable() for class (also use it for component or class that has a dependency, define dependencies in constructor agruments)
(use constructor only for wiring things up, use ngOnInit for logic)
* you must register at least one provider of any service you are going to use, e.g. in the service's own metadata (making service available everywhere), with specific modules or with specific components

# Components & Templates

## Property binding
* in template: `<app-item-detail [childItem]="parentItem></app-item-detail>`
* in component: `@Input() childItem: string;

## Events
* in component: `@Output() deleteRequest = new EventEmitter<Item>(); delete() { this.deleteRequest.emit(this.item); ...}`
* in template of hosting parent component: <app-item-detail (deleteRequest)="deleteItem($event)" [item]="currentItem"></app-item-detail>

## Directives
* NgClass to add or remove several CSS classes simultaneously (`[ngClass]="currentClasses"`)
* NgStyoe to set many inline styles simultaneously and dynamically, based on state of component
* ngModel to display data property and update it when user makes changes `[(ngModel)]="currentItem.name"`

## Template reference variable
* to reference variable in DOM `<input #phone placeholder="phone number" />.. <button (click)="callPhone(phone.value)">Call</button>

## Observables

### Types of notifications an observable can send
* next (required)
* error (optional)
* complete (optional)

### Creation
* `of(...items)` returns Observable instance that synchronically delivers the values provided as arguments
* `from(iterable)` converts its argument to an Observable instance, commonly used for arrays

### Subscribing
```
// Create simple observable that emits three values
const myObservable = of(1, 2, 3);

// Create observer object
const myObserver = {
  next: x => console.log('Observer got a next value: ' + x),
  error: err => console.error('Observer got an error: ' + err),
  complete: () => console.log('Observer got a complete notification'),
};

// Execute with the observer object
myObservable.subscribe(myObserver);
// Logs:
// Observer got a next value: 1
// Observer got a next value: 2
// Observer got a next value: 3
// Observer got a complete notification
```

alternatively:

```
myObservable.subscribe(
  x => console.log('Observer got a next value: ' + x),
  err => console.error('Observer got an error: ' + err),
  () => console.log('Observer got a complete notification')
);
```

data published by an observable (here x) is called stream (can be message string, event object, numeric value, structure, ...)

### Creating observables

use constructor `new Observable(<subscriber function>)`, e.g. instead of above 'of(1, 2, 3)`:

```
// This function runs when subscribe() is called
function sequenceSubscriber(observer) {
  // synchronously deliver 1, 2, and 3, then complete
  observer.next(1);
  observer.next(2);
  observer.next(3);
  observer.complete();

  // unsubscribe function doesn't need to do anything in this
  // because values are delivered synchronously
  return {unsubscribe() {}};
}

// Create a new Observable that will deliver the above sequence
const sequence = new Observable(sequenceSubscriber);

// execute the Observable and print the result of each notification
sequence.subscribe({
  next(num) { console.log(num); },
  complete() { console.log('Finished sequence'); }
});

// Logs:
// 1
// 2
// 3
// Finished sequence
```

### Multicasting

broadcasting to a list of multiple subscribers in a single execution

### RxJS library
for reactive programming (asynchronous proramming paradigm concerned with stat streams and propagation of change) using observables

* creation: from(<promise>), interval(<number>), fromEvent(<element>, <event>)

* operators: `map(x => x*x)`, filter, concat, flatMap
  	     
	     linking multiple operators: pipe(<operator1>, <operator2>, ...)

  	     set of operators is a receipe, only call to subscribe() produces a result

```
import { filter, map } from 'rxjs/operators';

const nums = of(1, 2, 3, 4, 5);

// Create a function that accepts an Observable.
const squareOddVals = pipe(
  filter((n: number) => n % 2 !== 0),
  map(n => n * n)
);

// Create an Observable that will run the filter and map functions
const squareOdd = squareOddVals(nums);

// Subscribe to run the combined functions
squareOdd.subscribe(x => console.log(x));
```

or
```
import { filter, map } from 'rxjs/operators';

const squareOdd = of(1, 2, 3, 4, 5)
  .pipe(
    filter(n => n % 2 !== 0),
    map(n => n * n)
  );

// Subscribe to get values
squareOdd.subscribe(x => console.log(x));
```

Common operators:

AREA	OPERATORS
Creation	from,fromEvent, of
Combination	combineLatest, concat, merge, startWith , withLatestFrom, zip
Filtering	debounceTime, distinctUntilChanged, filter, take, takeUntil
Transformation	bufferTime, concatMap, map, mergeMap, scan, switchMap
Utility		tap
Multicasting	share
Error		retry(<number>), catchError(err => of([]))

* naming convention: <name>$

### Observables in Angular
* define custom events
* handle AJAX requests and responses (HTTP module): `http.get('/api')` returns observable
* listen for and respond to user-input events (Router and Forms modules): 
  	 * `@Output() open = new EventEmitter<any>();` calling `open.emit(null)` passes value to next method
	 * `Router.events` provides events as observables
	 * reactive forms have properties that use observables to monitor form control values, e.g. `heroForm: FormGroup; const nameControl = this.heroForm.get('name'); nameControl.valueChanges.forEach(...)`
* async pipe `{{ time | asyn }}` with time beeing an observable

### Practical usage
* type-ahead suggestions
* exponential backoff
* instead of promises (asynchronous calls)
* instead of events API
* instead of arrays

## Communication tipps
* easiest way to communicate between components (parent and child): input and output(events)
* communication over not directly related components: services via subject as input and observable as output or use a state management like ngrx or redux
* unsubscribe from observables: best using async pipe, for getting data only once: take(1), else takeUntil(unsubscribe$) with unsubscribe$ subject - or alternatively takeUntilDestory() without the need for an usubscribe subject and its call in ngOnDestory
* interesting fact: subscribe is only needed when using side effects, otherwise you can use async pipe
* one possibility for ExpressionChangedAfterItHasBeenCheckedErrorExpressionChangedAfterItHasBeenCheckedError is the use of a synchronous event, use new EventEmitter<...>(true) for asynchonous one
* you can merge observables (using merge pipe) if you have one that is coming from a server request and one from a self-created subject
* more date that is used and needed as in- and output: create a store.service
