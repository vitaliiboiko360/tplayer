// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
{{flutter_js}}
{{flutter_build_config}}

const style = document.createElement('style');
style.textContent = `
  .flutter-loader1 {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  .indeterminateLocal {
    position: relative;
	  overflow: hidden;
    appearance: none;
    box-sizing: border-box;
    width: 60px;
	  height: 60px;
    padding: 0px;
    display: block;
    background-color: #fff;
	  color: #02569B;
    mask-image: linear-gradient(transparent 50%, white 50%),
		  linear-gradient(to right, transparent 50%, white 50%);
    animation: rotate 6s infinite;
  }
  .indeterminateLocal:before {
    content: '';
    box-sizing: border-box;
    border: solid 0.25em transparent;
    border-top-color: currentColor;
    border-radius: 100px;
    background-color: transparent;
    animation: rotate-shrink 0.75s infinite linear alternate;
    display: block;
    height: 60px;
    width: 60px;
    position: absolute;
    top: 0;
    left: 0;
  }
  @keyframes rotate {
    0% {
      transform: rotate(0deg);
    }
    12.5% {
      transform: rotate(180deg);
      animation-timing-function: linear;
    }
    25% {
      transform: rotate(630deg);
    }
    37.5% {
      transform: rotate(810deg);
      animation-timing-function: linear;
    }
    50% {
      transform: rotate(1260deg);
    }
    62.5% {
      transform: rotate(1440deg);
      animation-timing-function: linear;
    }
    75% {
      transform: rotate(1890deg);
    }
    87.5% {
      transform: rotate(2070deg);
      animation-timing-function: linear;
    }
    100% {
      transform: rotate(2520deg);
    }
  }
  @keyframes rotate-shrink {
    0% {
      transform: rotate(-30deg);
    }
    29.4% {
      border-left-color: transparent;
    }
    29.41% {
      border-left-color: currentColor;
    }
    64.7% {
      border-bottom-color: transparent;
    }
    64.71% {
      border-bottom-color: currentColor;
    }
    100% {
      border-left-color: currentColor;
      border-bottom-color: currentColor;
      transform: rotate(225deg);
    }
  }
`;
document.head.appendChild(style);

const flutterLoader = document.createElement('div');
const indeterminateLocal = document.createElement('div');
flutterLoader.classList.add('flutter-loader1');
indeterminateLocal.classList.add('indeterminateLocal');
flutterLoader.appendChild(indeterminateLocal);

document.body.appendChild(flutterLoader);

_flutter.loader.load({
  config: {
    // Use the local CanvasKit bundle instead of the CDN to reduce test flakiness.
    canvasKitBaseUrl: '/canvaskit/',
    onEntrypointLoaded: async function (engineInitializer) {
      const appRunner = await engineInitializer.initializeEngine();

      // Hide or remove your custom loader element once the engine is ready
      if (flutterLoader) {
        flutterLoader.remove();
      }
      if (style) {
        style.remove();
      }
      document
        .querySelectorAll('head style')
        .forEach((styleTag) => styleTag.remove());

      await appRunner.runApp();
    },
  },
});
