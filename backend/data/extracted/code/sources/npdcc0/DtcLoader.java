package npdcc0;

/* compiled from: Dex2C */
/* loaded from: classes2.dex */
public class DtcLoader {
    public static native void registerNativesForClass(int i, Class<?> cls);

    static {
        System.loadLibrary("npdcc");
    }
}
