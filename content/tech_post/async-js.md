---
title: "If not now, then when? Asynchronous JavaScript"
date: 2021-08-17T11:25:53+01:00
draft: false
---

We use Javascript and its type-safe sibling, TypeScript, on a lot of projects. For example, in our work on [Global.health: a Data Science Initiative](https://global.health), we use TypeScript both for the web application and for the API backing it, via the node.js engine. TypeScript gets rewritten into JavaScript before it is run, so I'll just use JavaScript from now on without worrying about how we got that JavaScript.

## JavaScript threads: There can be only one

Whether running in a browser or in node.js, there's only one thread of execution for JavaScript code. This means that only one JavaScript instruction can be running at any one time, and if that instruction takes a long time, then everything else has to wait. It's quite common though for programs to need to do something that will take a while, like fetching information from a database, making a network request, or waiting for a timer to fire. How can we do this in JS without holding up our whole application?

Underlying a JavaScript engine, such as the [v8](https://v8.dev) project that powers both Chrome and node.js, is an _event loop_. This can be thought of as a queue of things that need doing, and a program that asks "is there anything I still need to do?". If there is something to do, the event loop runs the appropriate JS. If not, it either waits until new work arrives, or exits depending on the context.

If you have some long-running task, you can have it do its work in the background and add an event to the queue when it's done for the event loop to pick up and run. Now the question is how do we do that from JS, and the answer is that there are many ways.

## Callback Functions

The first solution provided to scheduling work on the event loop was the callback. You would invoke your long-running task, giving it a function to call when it was finished. The function got access to the result of the task, so you could deal with errors or process the results. It looks like this:

```javascript

const db = ...;
db.query('select * from widgets where price > 10', (err, res) => {
	if (err) {
		console.error(`It went wrong! Error: ${err}`);
		return;
	}
	console.log(`There are ${res.length} expensive widgets available.`);
});

console.log('I have made the query');
```

The anonymous function that is the second argument to `db.query()` doesn't get run straight away, it runs when the query is resolved. So in the node.js or browser console you would see the line "I have made the query" _before_ seeing any output from the callback: the calling code runs to completion before anything else that has been added to the run loop gets to execute.

This approach is entirely acceptable and fully supports asynchronous execution of JavaScript. It just isn't very pleasant to use. If asynchronous tasks are chained—that is, if tasks must be performed in sequence, with one running to completion before the next can begin—then we end up with the "pyramid of doom" in which the callback functions are nested inside each other, making it harder to read what the code does.

```javascript

db.query('select * from widgets where price > 10', (err, res) => {
	if (err) //...
	request(`https://api.example.com/v1/products/images?products=${res}`, (err, images) => {
		if (err) //...
		updateImageCarousel(images, (err) => {
		 	if (err) // ...
		});
	});
});
```

Let's look at a couple of alternative ways to write asynchronous JavaScript. Neither of these add new capabilities, they give us different ways to express the same behaviour.

## Promises, promises

A [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) is an object that encapsulates some asynchronous work to be done, and the code to run on completion or failure. It's the same as the callback except that it separates the creation, the success handler, and the error handler, into three separate pieces, rather than defining them all at the same time.

We won't explain here how to create a Promise, that's covered in the documentation linked above if you're interested. We'll just look at how you use API that provides you with Promises for its asynchronous work. Here's the same database query we wrote before with a callback API, only this time using a Promise:

```javascript

db.query('select * from widgets where price > 10')
.then(res => {
	console.log(`There are ${res.length} expensive widgets available.`);
})
.catch(err => {
	console.error(`It went wrong! Error: ${err}`);
});

console.log('I have made the query');
```

As before, the message "I have made the query" is the first thing you'll see, because calling the Promise API only schedules the promise with the event loop, it will not run until the current JavaScript execution has finished. This design separates the error-handling from the result-handling, so there's no more need to check whether the error was set and bail from the callback function. Even better, Promises can be chained by returning another Promise from the `then` handler, and only one `catch` is needed for the whole chain. So our pyramid of doom example becomes:

```javascript

db.query('select * from widgets where price > 10')
.then(res => {
	return request(`https://api.example.com/v1/products/images?products=${res}`);
})
.then(images => {
	return updateImageCarousel(images);
})
.catch(err => {
	console.error(`It went wrong! Error: ${err}`);
});
```

It's now much clearer that there's a sequence of actions that happen, one after the other, with the results flowing between them. But this is such a common design that there's one more approach we can use that makes this even more concise.

## async functions

JavaScript has two keywords for writing succinct code that uses promises. The `async` decorator on a function indicates that the function uses asynchronous tasks internally, and causes the JavaScript engine to transparently wrap it in a Promise when you call it. Inside an `async` function, you can use the `await` keyword when the function calls an API that returns a Promise. This will pause the calling function until the Promise is resolved, and return the resolved value directly to the calling code.

The result is that there's no chain of `.then()….then()` functions, the code inside the function looks a lot like plain old JavaScript. Its readability is improved, because the _behaviour_ of the code is paramount not the _organisation_ of the asynchronous calls.

Anywhere that you have a Promise, you can `await` it instead of supplying a `.then()` handler. If you have an `async` function, you can either `await` its result or treat it as a Promise by calling `.then()` and `.catch()`. Promises and `async` functions are entirely interchangeable. Here's our sequence of actions, using the same Promise-based APIs as the previous example, wrapped in an `async` function.

```javascript

async function showExpensiveWidgets() {
	try {
		const res = await db.query('select * from widgets where price > 10');
		const images = await request(`https://api.example.com/v1/products/images?products=${res}`);
		await updateImageCarousel(images);
		console.log('I have done everything!');
	}
	catch (err) {
		console.error(`It went wrong! Error: ${err}`);
	}
}
```

The important difference between this and earlier examples is that the `console.log()` call doesn't happen until _after_ everything is resolved, because the `async` function is written in the order that everything happens: the various uses of `await` effectively pause execution of the function while their effects are resolved.


## Gotchas with ordering in asynchronous code

The ordering of behaviour in an `async` function is more natural if you're used to writing plain old sequential vanilla JavaScript, but may be a surprise if you're refactoring asynchronous code using callbacks or Promises to `async` functions. Consider this code:

```javascript

function logSomeMaths(a,b) {
	let r = 0;
	additionPromise(a,b)
	.then((c) => {
		r = c;
	});
	console.log(r);
}
```

and compare it with this:

```javascript
async function logSomeMaths(a,b) {
	let r = 0;
	const c = await additionPromise(a,b);
	r = c;
	console.log(r);
}
```

The first of these two examples _always_ logs 0 regardless of the result of the addition, because the whole function body gets run before the Promise is executed and the `then` handler reassigns the variable. The second one logs the result of the addition, because the function pauses at the `await` line until the promise is resolved.

## Conclusion

Asynchronicity is a useful technique in JavaScript to schedule code to run when other expensive activities have finished (or failed) in the background. You have to be careful that your code runs when you expect and that results of asynchronous tasks are available for you to use. Different techniques, all equivalent in capability, allow you to express asynchronicity in the way that makes most sense to you.
