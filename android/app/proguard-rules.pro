# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Google Mobile Ads
-keep class com.google.android.gms.ads.** { *; }
-keep class com.google.ads.** { *; }
-dontwarn com.google.android.gms.ads.**

# Flutter Play Store Split Application (if needed)
-keep class io.flutter.embedding.android.FlutterPlayStoreSplitApplication { *; }
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-dontwarn io.flutter.embedding.android.FlutterPlayStoreSplitApplication
-dontwarn io.flutter.embedding.engine.deferredcomponents.**

# GetX
-keep class com.example.** { *; }
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Hive
-keep class hive_flutter.** { *; }
-keep class * extends hive.HiveObject { *; }

# TTS
-keep class com.tencent.** { *; }
-keep class flutter_tts.** { *; }

# Connectivity Plus
-keep class connectivity_plus.** { *; }

# Shared Preferences
-keep class shared_preferences_android.** { *; }

# URL Launcher
-keep class url_launcher_android.** { *; }

# Package Info Plus
-keep class package_info_plus.** { *; }

# Share Plus
-keep class share_plus.** { *; }

# Flutter Local Notifications
-keep class flutter_local_notifications.** { *; }

# General rules for reflection
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses

# Keep native methods
-keepclassmembers class * {
    native <methods>;
}

# Keep enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep Parcelable classes
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep Serializable classes
-keepnames class * implements java.io.Serializable
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Prevent obfuscation of Flutter engine classes
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.common.** { *; }

# Keep application class
-keep public class com.crafzio.learnjavax.learnjavax.MainActivity { *; }

# Suppress warnings
-dontwarn java.lang.invoke.**
-dontwarn **$$serializer
-dontwarn java.lang.ClassValue
-dontwarn org.codehaus.mojo.animal_sniffer.*

# Additional R8 compatibility rules
-dontwarn androidx.window.**
-dontwarn kotlinx.coroutines.**
-dontwarn kotlin.coroutines.**

# Keep all classes that might be referenced by Flutter engine
-keep class * extends java.lang.Exception { *; }
-keep class * extends java.lang.Error { *; }

# Prevent R8 from removing classes that might be used via reflection
-keepclassmembers class * {
    @androidx.annotation.Keep *;
}

# Keep classes with @Keep annotation
-keep @androidx.annotation.Keep class * { *; }
-keepclassmembers class * {
    @androidx.annotation.Keep *;
}
