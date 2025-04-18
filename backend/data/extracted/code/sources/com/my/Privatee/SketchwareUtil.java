package com.my.Privatee;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.widget.ListView;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import npdcc0.DtcLoader;
import npdcc0.hidden.Hidden0;

/* compiled from: Dex2C */
/* loaded from: classes2.dex */
public class SketchwareUtil {
    public static int BOTTOM;
    public static int CENTER;
    public static int TOP;

    /* compiled from: Dex2C */
    /* renamed from: com.my.Privatee.SketchwareUtil$1, reason: invalid class name */
    class AnonymousClass1 implements Comparator<HashMap<String, Object>> {
        private final boolean val$ascending;
        private final boolean val$isNumber;
        private final String val$key;

        static {
            DtcLoader.registerNativesForClass(11, AnonymousClass1.class);
            Hidden0.special_clinit_11_30(AnonymousClass1.class);
        }

        AnonymousClass1(boolean z, String str, boolean z2) {
            this.val$isNumber = z;
            this.val$key = str;
            this.val$ascending = z2;
        }

        @Override // java.util.Comparator
        public native /* bridge */ /* synthetic */ int compare(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2);

        /* renamed from: compare, reason: avoid collision after fix types in other method */
        public native int compare2(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2);
    }

    static {
        DtcLoader.registerNativesForClass(12, SketchwareUtil.class);
        Hidden0.special_clinit_12_00(SketchwareUtil.class);
    }

    public static native void CropImage(Activity activity, String str, int i);

    public static native void CustomToast(Context context, String str, int i, int i2, int i3, int i4, int i5);

    public static native void CustomToastWithIcon(Context context, String str, int i, int i2, int i3, int i4, int i5, int i6);

    public static native String copyFromInputStream(InputStream inputStream);

    public static native void getAllKeysFromMap(Map<String, Object> map, ArrayList<String> arrayList);

    public static native ArrayList<Double> getCheckedItemPositionsToArray(ListView listView);

    public static native float getDip(Context context, int i);

    public static native int getDisplayHeightPixels(Context context);

    public static native int getDisplayWidthPixels(Context context);

    public static native int getLocationX(View view);

    public static native int getLocationY(View view);

    public static native int getRandom(int i, int i2);

    public static native void hideKeyboard(Context context);

    public static native boolean isConnected(Context context);

    public static native void showKeyboard(Context context);

    public static native void showMessage(Context context, String str);

    public static native void sortListMap(ArrayList<HashMap<String, Object>> arrayList, String str, boolean z, boolean z2);
}
