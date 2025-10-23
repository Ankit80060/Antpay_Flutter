plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.demo_app"
    
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

  defaultConfig {
    applicationId = "com.example.demo_app"
    minSdk = flutter.minSdkVersion
    targetSdk = 36
    versionCode = flutter.versionCode
    versionName = flutter.versionName
}


   buildTypes {
    getByName("release") {
        // Enable code shrinking, obfuscation, and optimization
        isMinifyEnabled = true
        isShrinkResources = true

        // Use your release signing config (for now debug if you don’t have keystore)
        signingConfig = signingConfigs.getByName("debug")

        // Add ProGuard rules
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }

    getByName("debug") {
        // Debug builds should not be minified
        isMinifyEnabled = false
    }
}

}

flutter {
    source = "../.."
}


dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:2.1.0")
    implementation("androidx.multidex:multidex:2.0.1")
    implementation("in.payu:payu-checkout-pro:2.1.1")
    implementation("in.payu:payu-ppi-sdk:1.0.0")
 
    implementation("com.google.android.gms:play-services-auth:21.2.0")
    implementation("com.google.android.gms:play-services-wallet:19.2.0")


}

configurations.all {
    resolutionStrategy {
        force("androidx.appcompat:appcompat:1.3.1")
    }
}
