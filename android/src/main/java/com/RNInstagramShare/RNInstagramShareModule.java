package com.RNInstagramShare;

import android.net.Uri;
import android.content.Intent;
import android.content.ActivityNotFoundException;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.Callback;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Environment;

public class RNInstagramShareModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNInstagramShareModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNInstagramShare";
  }

  @ReactMethod
  public void createPost(ReadableMap options, Callback callback) {

    if (hasValidKey("url", options) && verificationInstagram()) {

      Intent shareIntent = new Intent(android.content.Intent.ACTION_SEND);

      shareIntent.setType("image/*");
      shareIntent.putExtra(Intent.EXTRA_STREAM, Uri.parse(options.getString("url")));
      shareIntent.setPackage("com.instagram.android");
      shareIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

      try {
        this.reactContext.startActivity(shareIntent);
        callback.invoke(true);
      } catch (ActivityNotFoundException ex) {
        callback.invoke(false);
      }
    } else {
      callback.invoke(false);
    }
  }

  private boolean verificationInstagram(){
    boolean installed = false;

    try {
      ApplicationInfo info = this.getCurrentActivity().getPackageManager().getApplicationInfo("com.instagram.android", 0);
      installed = true;
    } catch (PackageManager.NameNotFoundException e) {
      installed = false;
    }
    return installed;
  }

  private boolean hasValidKey(String key, ReadableMap options) {
    return options.hasKey(key) && !options.isNull(key);
  }
}