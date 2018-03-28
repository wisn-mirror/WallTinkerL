package test.testwalle;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.widget.Toast;

/**
 * Created by mac on 2018/3/28.
 */

public class BBBActivity extends Activity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_bbb);
        Intent i_getvalue = getIntent();
        String action = i_getvalue.getAction();

        if(Intent.ACTION_VIEW.equals(action)){

            Uri uri = i_getvalue.getData();
            if(uri != null){
                String name = uri.getQueryParameter("name");
                String age= uri.getQueryParameter("age");
                Toast.makeText(this,"name"+name+" age:"+age,Toast.LENGTH_SHORT).show();
            }
        }
    }
}
