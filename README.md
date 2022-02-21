# Svelte Rating App

This project was initially created by [Brad Traversy](https://github.com/bradtraversy) and is based on his [svelte-feedback-app](https://github.com/bradtraversy/svelte-feedback-app).

I took the opportunity to code and learn along his [video crash course](https://youtu.be/3TVy6GdtNuQ) and decided to use SCSS and TypeScript instead of using plain JavaScript und CSS.

## Getting started

_Note that you will need to have [Node.js](https://nodejs.org) installed._

First change into the cloned directory and install the dependencies...

```bash
cd svelte-rating-app
npm install # you can also use yarn install
```

...then start the app with [Rollup](https://rollupjs.org):

```bash
npm run dev # or use yarn dev
```

Navigate to [localhost:8080](http://localhost:8080). You should see your app running.

By default, the server will only respond to requests from localhost.

## Building and running in production mode with docker

To create an optimised version of the app and create a docker image run the following command inside of the projects directory where the `Dockerfile` is present:

```bash
docker build -t svelte/svelte-rating-app .
```

You can run the newly built app with docker after the build like this:

```
docker run -it --rm --name svelte -p 5000:8080 svelte/svelte-rating-app
```

Navigate to [localhost:5000](http://localhost:5000). You should see your app running.

The container gets removed if you press `Ctrl+C` in the terminal window where you started the app
