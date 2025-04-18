.class public Lcom/my/Privatee/SketchLogger;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field private static volatile isRunning:Z

.field private static loggerThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xa

    const-class v1, Lcom/my/Privatee/SketchLogger;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_10_00(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static native synthetic access$0(Z)V
.end method

.method static native synthetic access$1()Z
.end method

.method public static native broadcastLog(Ljava/lang/String;)V
.end method

.method public static native startLogging()V
.end method

.method public static native stopLogging()V
.end method
