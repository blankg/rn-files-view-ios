[![npm version](https://badge.fury.io/js/rn-files-view-ios.svg)](https://badge.fury.io/js/rn-files-view-ios)

# rn-files-view-ios
Files viewer component that wraps the iOS QuickLook preview - supports images, pdf, Microsoft office files etc.

Enables pinch to zoom, double tap and swiping between files.

![](https://github.com/blankg/rn-files-view-ios/blob/master/filesviewer4.gif?raw=true)

## Getting started

`$ npm install rn-files-view-ios --save`

### Mostly automatic installation

`$ react-native link rn-files-view-ios`

In XCode, in the project navigator, select your project. Add `QuickLook.framework` to your project's `Build Phases` ➜ `Link Binary With Libraries`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `rn-files-view-ios` and add `RNFilesViewIos.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNFilesViewIos.a` and `QuickLook.framework` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


## Usage
```javascript
import FilesViewIOS from 'rn-files-view-ios';

onChangeFile(event) {
  //The currently visible file
  const index = event.nativeEvent.index;
}

onPreviewFailed(event) {
  //The failed file url
  const url = event.nativeEvent.url;
}

render() {
  return <FilesViewIOS
		style={{ flex: 1 }}
		previewBackgroundColor={"#474A5C"}
		initialIndex={0}
		urls={["file://pathToFile/myfile1.jpeg", "file://pathToFile/myfile2.pdf", "file://pathToFile/myfile3.docx"]}
		onFileChange={this.onChangeFile}
		onPreviewFailed={this.onPreviewFailed}
	/>;
}
```
  
