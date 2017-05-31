
# react-native-instagram-share

## Getting started

`$ npm install react-native-instagram-share --save`

### Mostly automatic installation

`$ react-native link react-native-instagram-share`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-instagram-share` and add `RNInstagramShare.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNInstagramShare.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNInstagramSharePackage;` to the imports at the top of the file
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

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNInstagramShare.sln` in `node_modules/react-native-instagram-share/windows/RNInstagramShare.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Com.Reactlibrary.RNInstagramShare;` to the usings at the top of the file
  - Add `new RNInstagramSharePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNInstagramShare from 'react-native-instagram-share';

// TODO: What to do with the module?
RNInstagramShare;
```
  