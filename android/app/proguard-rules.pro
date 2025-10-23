# ---------- Razorpay ----------
-keep class com.razorpay.** { *; }
-dontwarn com.razorpay.**

# ---------- PayU ----------
-keep class com.payu.** { *; }
-dontwarn com.payu.**

# ---------- Google Play Services ----------
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# ---------- GPay ----------
-keep class com.google.android.apps.nbu.paisa.** { *; }
-dontwarn com.google.android.apps.nbu.paisa.**

# ---------- ProGuard Annotations ----------
-keep class proguard.annotation.** { *; }
-dontwarn proguard.annotation.**
