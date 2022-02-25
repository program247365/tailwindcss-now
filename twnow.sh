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

echo "${PREAMBLE}Create our src directory..."
mkdir src

## Create our HTML file
cat >src/index.html <<EOF
<!doctype html>
<html>
<head>
  <title>TailwindCSS Now Playground!</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/png" sizes="32x32" href="//tailwindcss.com/favicons/apple-touch-icon.png?v=3"/>
  <!-- Enable core plugins, like forms and typography, using the plugins query parameter. -->
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
  <script>
    tailwind.config = {
      /*
      Add custom config options if you like, more here: https://tailwindcss.com/docs/configuration
      theme: {
        extend: {
          colors: {
            clifford: '#da373d',
          }
        }
      }
    */
    }
  </script>
  <style type="text/tailwindcss">
    // Add custom CSS that supports all of Tailwind's CSS Features
    // @layer utilities {
    //  .content-auto {
    //    content-visibility: auto;
    //  }
    // }
  </style>
</head>
<body>
  <div class="min-h-screen bg-gray-50 flex flex-col justify-center relative overflow-hidden">
    <div class="absolute inset-0 bg-center [mask-image:linear-gradient(180deg,white,rgba(255,255,255,0))]"></div>
    <div class="relative px-6 pt-10 pb-8 bg-white shadow-xl ring-1 ring-gray-900/5 sm:max-w-lg sm:mx-auto sm:rounded-lg sm:px-10">
      <div class="max-w-md mx-auto">
        <div class="divide-y divide-gray-300/50">
          <h1 class="text-sky-600 text-xl pb-4"><span class="pr-4">🌈</span>  TailwindCSS Now!</h1>
          <ul class="py-4 text-base leading-7 space-y-2 text-gray-600">
            <li><span class="pr-4">🕹️</span>A local playground for Tailwind CSS.</li>
            <li class="pl-0 pt-4 pr-4 pb-4 p rotate-10 rounded-xl"><span class="pr-4 pl-0">✏️</span>Edit the <code>index.html</code> file to see <span class="animate-pulse bg-yellow-100 p-2">live changes</span>!</li>
            <li><span class="pr-4">💡</span>Perfect for prototyping a new idea.</li>
          </ul>
          <div class="pt-8 text-base leading-7 font-semibold">
            <p class="text-gray-900">Want to dig deeper into Tailwind?</p>
            <p>
              <a href="https://tailwindcss.com/docs" target="_blank" rel="noopener" class="text-sky-500 hover:text-sky-600">Read the docs &rarr;</a>
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
echo "${PREAMBLE}Starting the watch process now. Edit index.html and see instant changes in the browser!"
npm run start