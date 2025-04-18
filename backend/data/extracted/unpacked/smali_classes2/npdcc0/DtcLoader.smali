.class public Lnpdcc0/DtcLoader;
.super Ljava/lang/Object;
.source "Dex2C"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "npdcc"

    .line 7
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native registerNativesForClass(ILjava/lang/Class;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation
.end method
