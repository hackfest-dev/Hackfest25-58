.class Lcom/my/Privatee/SketchLogger$1;
.super Ljava/lang/Thread;
.source "Dex2C"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/Privatee/SketchLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x9

    const-class v1, Lcom/my/Privatee/SketchLogger$1;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_9_20(Ljava/lang/Class;)V

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public native run()V
.end method
