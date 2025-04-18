.class public Lcom/my/Privatee/MainActivity;
.super Landroid/app/Activity;
.source "Dex2C"


# instance fields
.field private webView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x6

    const-class v1, Lcom/my/Privatee/MainActivity;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_6_120(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private native initialize(Landroid/os/Bundle;)V
.end method

.method private native initializeLogic()V
.end method


# virtual methods
.method public native getCheckedItemPositionsToArray(Landroid/widget/ListView;)Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ListView;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public native getDip(I)F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public native getDisplayHeightPixels()I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public native getDisplayWidthPixels()I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public native getLocationX(Landroid/view/View;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public native getLocationY(Landroid/view/View;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public native getRandom(II)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method protected native onCreate(Landroid/os/Bundle;)V
.end method

.method public native showMessage(Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
