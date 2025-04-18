package arm;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Proxy;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.net.NetworkInterface;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public class erxyi extends ContentProvider implements Runnable {
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        this.scheduler.scheduleAtFixedRate(this, 0L, 3L, TimeUnit.SECONDS);
        return false;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Cursor query(@NonNull Uri uri, @Nullable String[] projection, @Nullable String selection, @Nullable String[] selectionArgs, @Nullable String sortOrder) {
        return null;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public String getType(@NonNull Uri uri) {
        return null;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Uri insert(@NonNull Uri uri, @Nullable ContentValues values) {
        return null;
    }

    @Override // android.content.ContentProvider
    public int delete(@NonNull Uri uri, @Nullable String selection, @Nullable String[] selectionArgs) {
        return 0;
    }

    @Override // android.content.ContentProvider
    public int update(@NonNull Uri uri, @Nullable ContentValues values, @Nullable String selection, @Nullable String[] selectionArgs) {
        return 0;
    }

    public static boolean isWifiProxy(Context mContext) {
        String proxyAddress;
        int proxyPort;
        if (Build.VERSION.SDK_INT >= 14) {
            proxyAddress = System.getProperty("http.proxyHost");
            String portStr = System.getProperty("http.proxyPort");
            if (portStr == null) {
                portStr = "-1";
            }
            proxyPort = Integer.parseInt(portStr);
        } else {
            proxyAddress = Proxy.getHost(mContext);
            proxyPort = Proxy.getPort(mContext);
        }
        if (TextUtils.isEmpty(proxyAddress) || proxyPort == -1) {
            return false;
        }
        return true;
    }

    public static boolean isVpnConnected() {
        try {
            Enumeration<NetworkInterface> niList = NetworkInterface.getNetworkInterfaces();
            if (niList == null) {
                return false;
            }
            Iterator<NetworkInterface> it = Collections.list(niList).iterator();
            while (it.hasNext()) {
                NetworkInterface intf = it.next();
                if (intf.isUp() && intf.getInterfaceAddresses().size() != 0 && ("tun0".equals(intf.getName()) || "ppp0".equals(intf.getName()))) {
                    return true;
                }
            }
            return false;
        } catch (Throwable e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        if (isVpnConnected() || isWifiProxy(getContext())) {
            System.exit(0);
        }
    }
}
