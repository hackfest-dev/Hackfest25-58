.class public Lcom/my/Privatee/SketchApplication;
.super Landroid/app/Application;
.source "Dex2C"


# static fields
.field private static mApplicationContext:Landroid/content/Context;


# instance fields
.field private uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x8

    const-class v1, Lcom/my/Privatee/SketchApplication;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_8_40(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method static native synthetic access$0(Lcom/my/Privatee/SketchApplication;)Ljava/lang/Thread$UncaughtExceptionHandler;
.end method

.method public static native getContext()Landroid/content/Context;
.end method


# virtual methods
.method public native onCreate()V
.end method
