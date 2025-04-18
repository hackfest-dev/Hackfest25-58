package com.my.Privatee;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import java.io.File;
import java.util.ArrayList;
import npdcc0.DtcLoader;
import npdcc0.hidden.Hidden0;

/* compiled from: Dex2C */
/* loaded from: classes2.dex */
public class FileUtil {
    static {
        DtcLoader.registerNativesForClass(2, FileUtil.class);
        Hidden0.special_clinit_2_390(FileUtil.class);
    }

    public static native int calculateInSampleSize(BitmapFactory.Options options, int i, int i2);

    public static native String convertUriToFilePath(Context context, Uri uri);

    public static native void copyDir(String str, String str2);

    public static native void copyFile(String str, String str2);

    private static native void createNewFile(String str);

    public static native File createNewPictureFile(Context context);

    public static native void cropBitmapFileFromCenter(String str, String str2, int i, int i2);

    public static native Bitmap decodeSampleBitmapFromPath(String str, int i, int i2);

    public static native void deleteFile(String str);

    private static native String getDataColumn(Context context, Uri uri, String str, String[] strArr);

    public static native String getExternalStorageDir();

    public static native long getFileLength(String str);

    public static native int getJpegRotate(String str);

    public static native String getPackageDataDir(Context context);

    public static native String getPublicDir(String str);

    public static native Bitmap getScaledBitmap(String str, int i);

    public static native boolean isDirectory(String str);

    private static native boolean isDownloadsDocument(Uri uri);

    public static native boolean isExistFile(String str);

    private static native boolean isExternalStorageDocument(Uri uri);

    public static native boolean isFile(String str);

    private static native boolean isMediaDocument(Uri uri);

    public static native void listDir(String str, ArrayList<String> arrayList);

    public static native void makeDir(String str);

    public static native void moveFile(String str, String str2);

    public static native String readFile(String str);

    public static native void resizeBitmapFileRetainRatio(String str, String str2, int i);

    public static native void resizeBitmapFileToCircle(String str, String str2);

    public static native void resizeBitmapFileToSquare(String str, String str2, int i);

    public static native void resizeBitmapFileWithRoundedBorder(String str, String str2, int i);

    public static native void rotateBitmapFile(String str, String str2, float f);

    private static native void saveBitmap(Bitmap bitmap, String str);

    public static native void scaleBitmapFile(String str, String str2, float f, float f2);

    public static native void setBitmapFileBrightness(String str, String str2, float f);

    public static native void setBitmapFileColorFilter(String str, String str2, int i);

    public static native void setBitmapFileContrast(String str, String str2, float f);

    public static native void skewBitmapFile(String str, String str2, float f, float f2);

    public static native void writeFile(String str, String str2);
}
