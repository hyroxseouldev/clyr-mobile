import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.sunmkim.clyr_mobile.dev"
            resValue(type = "string", name = "app_name", value = "[DEV] Clyr Mobile")
        }
        create("stage") {
            dimension = "flavor-type"
            applicationId = "com.sunmkim.clyr_mobile.stage"
            resValue(type = "string", name = "app_name", value = "[STG] Clyr Mobile")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.sunmkim.clyr_mobile"
            resValue(type = "string", name = "app_name", value = "Clyr Mobile")
        }
    }
}