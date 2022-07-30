# Flutter Wannads

SDK for Wannads ad network (Android only at the moment)
## Getting Started

### 1. Initialization:

```dart
FlutterWannads.instance.init(apiKey: "[ApiKey]", 
                            apiSecret: "[ApiSecret]",             
                            user: WanUser(id: "test"));
);
```

### 2. Show Offerwall

```dart
FlutterWannads.instance.showOfferwall();
);
```

### 3. Show SurveyOfferwall

```dart
FlutterWannads.instance.showSurveysOfferwall();
);
```

## Important
This plugin is still under development, use it at your own risk

