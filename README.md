
# react-native-instagram-share

## Getting started

`$ git clone https://github.com/makskolesnikov/react-native-instagram-share.git`

### Mostly automatic installation
```javascript
"dependencies": {
    ...
    "react-native-instagram-share": "git+ssh://git@github.com/makskolesnikov/react-native-instagram-share.git",
    ...
}
```

`$ npm i`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-instagram-share` and add `RNInstagramShare.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNInstagramShare.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

In the process of develop

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.RNInstagramShare.RNInstagramSharePackage;` to the imports at the top of the file
  - Add `new RNInstagramSharePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-instagram-share'
  	project(':react-native-instagram-share').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-instagram-share/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-instagram-share')
  	```


## Usage example
```javascript
import RNInstagramShare from 'react-native-instagram-share';

...
  RNInstagramShare.createPost(
    { url: link },  // `url` is global link for iOS and uri for Android e.g.: `file://..`
	(res) => { console.log(res); }, // callback function return result `true` if user have instagram app and can create post
  );
...
```
  