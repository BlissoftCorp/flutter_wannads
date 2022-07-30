package com.blissoft.flutter_wannads;

import android.annotation.SuppressLint;
import android.app.Activity;

import androidx.annotation.NonNull;

import com.wannads.sdk.WannadsSdk;

import java.util.HashMap;
import java.util.Objects;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterWannadsPlugin */
public class FlutterWannadsPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  public static MethodChannel Channel;
  @SuppressLint("StaticFieldLeak")
  private static FlutterWannadsPlugin Instance;
  @SuppressLint("StaticFieldLeak")
  static Activity ActivityInstance;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    if (FlutterWannadsPlugin.Instance == null)
      FlutterWannadsPlugin.Instance = new FlutterWannadsPlugin();
    if (FlutterWannadsPlugin.Channel != null)
      return;
    FlutterWannadsPlugin.Channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_wannads");
    FlutterWannadsPlugin.Channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    try {
      switch (call.method) {
        case "init":
          this.InitSdk((HashMap) call.arguments);
          break;
        case "showOfferwall":
          WannadsSdk.getInstance().showOfferWall();
          break;
      }
      result.success(Boolean.TRUE);
    } catch (Exception e) {
      Log.e("Wannads", "Error " + e.toString());
      result.error(String.valueOf(e.hashCode()), e.getMessage(), e.getLocalizedMessage());
    }
  }

  private void InitSdk(final HashMap args) {
    try {
      if (FlutterWannadsPlugin.ActivityInstance != null) {
        String apiKey = Objects.requireNonNull(args.get("apiKey")).toString();
        String apiSecret = Objects.requireNonNull(args.get("apiSecret")).toString();
        HashMap user = (HashMap)Objects.requireNonNull(args.get("user"));
        String userId = Objects.requireNonNull(user.get("id")).toString();

        WannadsSdk.getInstance().init(FlutterWannadsPlugin.ActivityInstance, apiKey, apiSecret, userId);

        WannadsSdk.getInstance().isInited();

      } else {
        throw new Exception("Activity Null");
      }
    } catch (Exception e) {
      Log.e("Wannads", e.getMessage());
    }
  }

  private void ShowOfferwall(){

  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    FlutterWannadsPlugin.Channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    FlutterWannadsPlugin.ActivityInstance = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    FlutterWannadsPlugin.ActivityInstance = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {

  }
}
