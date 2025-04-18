.class Lcom/my/Privatee/DebugActivity$1;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/my/Privatee/DebugActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final this$0:Lcom/my/Privatee/DebugActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    const-class v1, Lcom/my/Privatee/DebugActivity$1;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_0_20(Ljava/lang/Class;)V

    return-void
.end method

.method constructor <init>(Lcom/my/Privatee/DebugActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/my/Privatee/DebugActivity$1;->this$0:Lcom/my/Privatee/DebugActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native onClick(Landroid/content/DialogInterface;I)V
.end method
