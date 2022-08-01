# Flutter Wannads

SDK for Wannads ad network (Android only at the moment)
## Getting Started

### 0. Android Configuration:

Unfortunately the Wannads SDK is not in MavenCentral, Therefore the sdk deployment must be done manually.

1. You must first download the SDK version 2.5.0 using this link https://wannads-bucket.s3-eu-west-1.amazonaws.com/integration/android/wannads-android-sdk-2.5.0.zip

2. You must extract the file "android-sdk-2.5.0.aar" that is inside the downloaded .zip

3. In your flutter project in the android/app path create a folder called libs

4. Inside the libs folder you must paste the .aar file that was extracted, then rename it as "wannads.aar"

And that's it, it should look something like this "/[flutter_project]/android/app/libs/wannads.aar"

### 1. Initialization:

```dart
FlutterWannads.instance.init(apiKey: "[ApiKey]", 
                             apiSecret: "[ApiSecret]",             
                             user: WanUser(id: "[Unique_User_Id]"));
```

### 2. Show Offerwall

```dart
FlutterWannads.instance.showOfferwall();
```

### 3. Show SurveyOfferwall

```dart
FlutterWannads.instance.showSurveysOfferwall();
```

## Important
This plugin is still under development, use it at your own risk

