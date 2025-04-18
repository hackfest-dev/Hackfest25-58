.class Lcom/my/Privatee/MainActivity$1;
.super Landroid/webkit/WebViewClient;
.source "Dex2C"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/my/Privatee/MainActivity;->initialize(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final this$0:Lcom/my/Privatee/MainActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x3

    const-class v1, Lcom/my/Privatee/MainActivity$1;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_3_30(Ljava/lang/Class;)V

    return-void
.end method

.method constructor <init>(Lcom/my/Privatee/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/my/Privatee/MainActivity$1;->this$0:Lcom/my/Privatee/MainActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public native onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
.end method

.method public native onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
.end method
