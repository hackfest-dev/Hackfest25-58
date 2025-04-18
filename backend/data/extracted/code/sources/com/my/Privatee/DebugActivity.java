package com.my.Privatee;

import android.app.Activity;
import android.content.DialogInterface;
import android.os.Bundle;
import npdcc0.DtcLoader;
import npdcc0.hidden.Hidden0;

/* compiled from: Dex2C */
/* loaded from: classes2.dex */
public class DebugActivity extends Activity {
    private String[] exceptionTypes = {"StringIndexOutOfBoundsException", "IndexOutOfBoundsException", "ArithmeticException", "NumberFormatException", "ActivityNotFoundException"};
    private String[] exceptionMessages = {"Invalid string operation\n", "Invalid list operation\n", "Invalid arithmetical operation\n", "Invalid toNumber block operation\n", "Invalid intent operation"};

    /* compiled from: Dex2C */
    /* renamed from: com.my.Privatee.DebugActivity$1, reason: invalid class name */
    class AnonymousClass1 implements DialogInterface.OnClickListener {
        final DebugActivity this$0;

        static {
            DtcLoader.registerNativesForClass(0, AnonymousClass1.class);
            Hidden0.special_clinit_0_20(AnonymousClass1.class);
        }

        AnonymousClass1(DebugActivity debugActivity) {
            this.this$0 = debugActivity;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public native void onClick(DialogInterface dialogInterface, int i);
    }

    static {
        DtcLoader.registerNativesForClass(1, DebugActivity.class);
        Hidden0.special_clinit_1_20(DebugActivity.class);
    }

    @Override // android.app.Activity
    protected native void onCreate(Bundle bundle);
}
