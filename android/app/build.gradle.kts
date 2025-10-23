import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    load(FileInputStream(keystorePropertiesFile))
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

// --- Signing configs ---
    val releaseConfig = signingConfigs.create("release") {
        keyAlias = keystoreProperties.getProperty("keyAlias")
        keyPassword = keystoreProperties.getProperty("keyPassword")
        storeFile = file(keystoreProperties.getProperty("storeFile"))
        storePassword = keystoreProperties.getProperty("storePassword")
    }

    // --- Build types ---
    buildTypes {
        getByName("release") {
            signingConfig = releaseConfig
            isMinifyEnabled = true
            isShrinkResources = true

            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }

        getByName("debug") {
            isMinifyEnabled = false
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("debug")
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
