package test.testwalle;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.meituan.android.walle.WalleChannelReader;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        String channel = WalleChannelReader.getChannel(this.getApplicationContext());
        final TextView  textView=(TextView)findViewById(R.id.test);
        Button  button=(Button)findViewById(R.id.button);
//        textView.setText("更新的补丁："+channel+""+MApplication.BASE_URL);
        textView.setText("更新的补丁2222wwww："+channel+""+MApplication.BASE_URL);
//        textView.setText(channel+""+MApplication.BASE_URL);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ClipboardManager cm = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                ClipData mClipData = ClipData.newPlainText("Label", textView.getText());
                // 将文本内容放到系统剪贴板里。
                cm.setPrimaryClip(mClipData);
                Toast.makeText(MainActivity.this, "已经复制成功", Toast.LENGTH_LONG).show();
            }
        });

      /*  for(int i=0;i<10;i++){
            textView.append( getUUid()+"\n");
            textView.append( getUUidstr()+"\n");
        }*/
        ExecutorService executorService = Executors.newCachedThreadPool();
        executorService.execute(new Runnable() {
            @Override
            public void run() {
                final boolean deviceRooted = RootCheckUtils.isDeviceRooted();

                    MainActivity.this.runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            if(deviceRooted){
                            Toast.makeText(MainActivity.this,"有root权限",Toast.LENGTH_SHORT).show();
                            }else{
                                Toast.makeText(MainActivity.this,"没有root权限",Toast.LENGTH_SHORT).show();
                            }
                        }
                    });

            }
        });
    }


    public static String getUUid() {
        String m_szDevIDShort = "35"
                + Build.BOARD.length() % 10
                + Build.BRAND.length() % 10
                + Build.CPU_ABI.length() % 10
                + Build.DEVICE.length() % 10
                + Build.DISPLAY.length() % 10
                + Build.HOST.length() % 10
                + Build.ID.length() % 10
                + Build.MANUFACTURER.length() % 10
                + Build.MODEL.length() % 10
                + Build.PRODUCT.length() % 10
                + Build.TAGS.length() % 10
                + Build.TYPE.length() % 10
                + Build.USER.length() % 10;
        return m_szDevIDShort;
    }

    public static String getUUidstr() {
        String m_szDevIDShort = "35"
                + Build.BOARD
                + Build.BRAND
                + Build.CPU_ABI
                + Build.DEVICE
                + Build.DISPLAY
                + Build.HOST
                + Build.ID
                + Build.MANUFACTURER
                + Build.MODEL
                + Build.PRODUCT
                + Build.TAGS
                + Build.TYPE
                + Build.USER;
        return m_szDevIDShort;
    }
}
