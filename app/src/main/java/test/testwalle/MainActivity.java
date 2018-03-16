package test.testwalle;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

import com.meituan.android.walle.WalleChannelReader;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        String channel = WalleChannelReader.getChannel(this.getApplicationContext());
        TextView  textView=(TextView)findViewById(R.id.test);
        textView.setText("更新的补丁："+channel+""+MApplication.BASE_URL);
//        textView.setText(channel+""+MApplication.BASE_URL);

    }
}
