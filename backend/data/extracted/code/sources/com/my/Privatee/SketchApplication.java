package com.my.Privatee;

import android.app.Application;
import android.content.Context;
import java.lang.Thread;
import npdcc0.DtcLoader;
import npdcc0.hidden.Hidden0;

/* compiled from: Dex2C */
/* loaded from: classes2.dex */
public class SketchApplication extends Application {
    private static Context mApplicationContext;
    private Thread.UncaughtExceptionHandler uncaughtExceptionHandler;

    /* compiled from: Dex2C */
    /* renamed from: com.my.Privatee.SketchApplication$1, reason: invalid class name */
    class AnonymousClass1 implements Thread.UncaughtExceptionHandler {
        final SketchApplication this$0;

        static {
            DtcLoader.registerNativesForClass(7, AnonymousClass1.class);
            Hidden0.special_clinit_7_20(AnonymousClass1.class);
        }

        AnonymousClass1(SketchApplication sketchApplication) {
            this.this$0 = sketchApplication;
        }

        @Override // java.lang.Thread.UncaughtExceptionHandler
        public native void uncaughtException(Thread thread, Throwable th);
    }

    static {
        DtcLoader.registerNativesForClass(8, SketchApplication.class);
        Hidden0.special_clinit_8_40(SketchApplication.class);
    }

    static native /* synthetic */ Thread.UncaughtExceptionHandler access$0(SketchApplication sketchApplication);

    public static native Context getContext();

    @Override // android.app.Application
    public native void onCreate();
}
