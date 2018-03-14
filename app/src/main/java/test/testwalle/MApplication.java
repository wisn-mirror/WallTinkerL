package test.testwalle;

import android.app.Application;
import android.util.Log;

/**
 * Created by mac on 2018/3/14.
 */

public class MApplication extends Application {
    public static final String TAG="MApplication";
    public static String BASE_URL = BuildConfig.BASE_URL;
    @Override
    public void onCreate() {
        super.onCreate();
        Log.e(TAG,"data:"+BASE_URL);
    }
}
