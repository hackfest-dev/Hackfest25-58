package com.my.Privatee;

import npdcc0.DtcLoader;
import npdcc0.hidden.Hidden0;

/* compiled from: Dex2C */
/* loaded from: classes2.dex */
public class SketchLogger {
    private static volatile boolean isRunning;
    private static Thread loggerThread;

    /* compiled from: Dex2C */
    /* renamed from: com.my.Privatee.SketchLogger$1, reason: invalid class name */
    class AnonymousClass1 extends Thread {
        static {
            DtcLoader.registerNativesForClass(9, AnonymousClass1.class);
            Hidden0.special_clinit_9_20(AnonymousClass1.class);
        }

        AnonymousClass1() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public native void run();
    }

    static {
        DtcLoader.registerNativesForClass(10, SketchLogger.class);
        Hidden0.special_clinit_10_00(SketchLogger.class);
    }

    static native /* synthetic */ void access$0(boolean z);

    static native /* synthetic */ boolean access$1();

    public static native void broadcastLog(String str);

    public static native void startLogging();

    public static native void stopLogging();
}
