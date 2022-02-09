#!/bin/bash

PREAMBLE='🌈 TailwindCSS NOW Script:  '

## Init a project
echo "${PREAMBLE}Initializing NPM project..."
npm init -y > /dev/null

## Modify NPM scripts for better DX by overwriting package.json
# TODO: use sed to replace instead of wholesale overwriting
echo "${PREAMBLE}Creating special package.json..."
cat >package.json <<EOF
{
  "name": "tailwindcss-now",
  "version": "1.0.0",
  "description": "TailwindCSS Now Project",
  "main": "index.js",
  "scripts": {
    "start": "live-server ./src --no-css-inject"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "serve": "^13.0.2"
  }
}
EOF

## Install other utilities to make this nice DX
## was using browser-sync, but it's broken watching changes
echo "${PREAMBLE}Installing other packages..."
npm install -D open-cli live-server &>/dev/null

echo "${PREAMBLE}create our src directory..."
mkdir src

## Create our HTML file
cat >src/index.html <<EOF
<!doctype html>
<html>
<head>
  <title>TailwindCSS Now Playground!</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    module.exports = {
        content: ["./src/**/*.{html,js}"],
        theme: {
        extend: {},
        },
        plugins: [],
    }
  </script>
</head>
<body>
  <div class="min-h-screen bg-gray-50 py-6 flex flex-col justify-center relative overflow-hidden sm:py-12">
    <div class="absolute inset-0 bg-[url(/img/grid.svg)] bg-center [mask-image:linear-gradient(180deg,white,rgba(255,255,255,0))]"></div>
    <div class="relative px-6 pt-10 pb-8 bg-white shadow-xl ring-1 ring-gray-900/5 sm:max-w-lg sm:mx-auto sm:rounded-lg sm:px-10">
      <div class="max-w-md mx-auto">
        <div class="divide-y divide-gray-300/50">
          <h1 class="text-lg">🌈  TailwindCSS Now!</h1>
          <div class="py-8 text-base leading-7 space-y-6 text-gray-600">
            <p>A local playground for Tailwind CSS.</p><p>Edit the <code>index.html</code> file to see live changes!</p>
            <p>Perfect for learning how the framework works, prototyping a new idea, or creating a demo to share online.</p>
          </div>
          <div class="pt-8 text-base leading-7 font-semibold">
            <p class="text-gray-900">Want to dig deeper into Tailwind?</p>
            <p>
              <a href="https://tailwindcss.com/docs" class="text-sky-500 hover:text-sky-600">Read the docs &rarr;</a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
EOF

## Watch the files now! Go forth and create awesome UIs!
echo "${PREAMBLE}Starting the watch process now. Edit your input.css and index.html!"
npm run start