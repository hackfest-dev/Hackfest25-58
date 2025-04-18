.class Lcom/my/Privatee/SketchApplication$1;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/my/Privatee/SketchApplication;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final this$0:Lcom/my/Privatee/SketchApplication;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x7

    const-class v1, Lcom/my/Privatee/SketchApplication$1;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_7_20(Ljava/lang/Class;)V

    return-void
.end method

.method constructor <init>(Lcom/my/Privatee/SketchApplication;)V
    .locals 0

    iput-object p1, p0, Lcom/my/Privatee/SketchApplication$1;->this$0:Lcom/my/Privatee/SketchApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
.end method
