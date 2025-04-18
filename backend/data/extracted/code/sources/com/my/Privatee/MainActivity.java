package com.my.Privatee;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ListView;
import java.util.ArrayList;
import npdcc0.DtcLoader;
import npdcc0.hidden.Hidden0;

/* compiled from: Dex2C */
/* loaded from: classes2.dex */
public class MainActivity extends Activity {
    private WebView webView;

    /* compiled from: Dex2C */
    /* renamed from: com.my.Privatee.MainActivity$1, reason: invalid class name */
    class AnonymousClass1 extends WebViewClient {
        final MainActivity this$0;

        static {
            DtcLoader.registerNativesForClass(3, AnonymousClass1.class);
            Hidden0.special_clinit_3_30(AnonymousClass1.class);
        }

        AnonymousClass1(MainActivity mainActivity) {
            this.this$0 = mainActivity;
        }

        @Override // android.webkit.WebViewClient
        public native void onPageFinished(WebView webView, String str);

        @Override // android.webkit.WebViewClient
        public native void onPageStarted(WebView webView, String str, Bitmap bitmap);
    }

    /* compiled from: Dex2C */
    /* renamed from: com.my.Privatee.MainActivity$2, reason: invalid class name */
    class AnonymousClass2 extends WebViewClient {
        final MainActivity this$0;

        static {
            DtcLoader.registerNativesForClass(4, AnonymousClass2.class);
            Hidden0.special_clinit_4_20(AnonymousClass2.class);
        }

        AnonymousClass2(MainActivity mainActivity) {
            this.this$0 = mainActivity;
        }

        @Override // android.webkit.WebViewClient
        public native boolean shouldOverrideUrlLoading(WebView webView, String str);
    }

    /* compiled from: Dex2C */
    /* renamed from: com.my.Privatee.MainActivity$3, reason: invalid class name */
    class AnonymousClass3 extends WebViewClient {
        final MainActivity this$0;

        static {
            DtcLoader.registerNativesForClass(5, AnonymousClass3.class);
            Hidden0.special_clinit_5_20(AnonymousClass3.class);
        }

        AnonymousClass3(MainActivity mainActivity) {
            this.this$0 = mainActivity;
        }

        @Override // android.webkit.WebViewClient
        public native boolean shouldOverrideUrlLoading(WebView webView, String str);
    }

    static {
        DtcLoader.registerNativesForClass(6, MainActivity.class);
        Hidden0.special_clinit_6_120(MainActivity.class);
    }

    private native void initialize(Bundle bundle);

    private native void initializeLogic();

    @Deprecated
    public native ArrayList<Double> getCheckedItemPositionsToArray(ListView listView);

    @Deprecated
    public native float getDip(int i);

    @Deprecated
    public native int getDisplayHeightPixels();

    @Deprecated
    public native int getDisplayWidthPixels();

    @Deprecated
    public native int getLocationX(View view);

    @Deprecated
    public native int getLocationY(View view);

    @Deprecated
    public native int getRandom(int i, int i2);

    @Override // android.app.Activity
    protected native void onCreate(Bundle bundle);

    @Deprecated
    public native void showMessage(String str);
}
