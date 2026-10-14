allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    val configureAndroid = Action<Project> {
        val extension = project.extensions.findByName("android")
        if (extension != null) {
            try {
                val compileSdkMethod = extension.javaClass.getMethod("setCompileSdkVersion", Int::class.java)
                compileSdkMethod.invoke(extension, 36)
            } catch (_: Exception) {}
            try {
                val compileSdkProp = extension.javaClass.getMethod("setCompileSdk", Int::class.java)
                compileSdkProp.invoke(extension, 36)
            } catch (_: Exception) {}
        }
    }
    if (state.executed) {
        configureAndroid.execute(this)
    } else {
        afterEvaluate(configureAndroid)
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
