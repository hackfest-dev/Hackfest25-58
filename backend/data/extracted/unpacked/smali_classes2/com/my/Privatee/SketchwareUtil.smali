.class public Lcom/my/Privatee/SketchwareUtil;
.super Ljava/lang/Object;
.source "Dex2C"


# static fields
.field public static BOTTOM:I

.field public static CENTER:I

.field public static TOP:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xc

    const-class v1, Lcom/my/Privatee/SketchwareUtil;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_12_00(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native CropImage(Landroid/app/Activity;Ljava/lang/String;I)V
.end method

.method public static native CustomToast(Landroid/content/Context;Ljava/lang/String;IIIII)V
.end method

.method public static native CustomToastWithIcon(Landroid/content/Context;Ljava/lang/String;IIIIII)V
.end method

.method public static native copyFromInputStream(Ljava/io/InputStream;)Ljava/lang/String;
.end method

.method public static native getAllKeysFromMap(Ljava/util/Map;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public static native getCheckedItemPositionsToArray(Landroid/widget/ListView;)Ljava/util/ArrayList;
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
.end method

.method public static native getDip(Landroid/content/Context;I)F
.end method

.method public static native getDisplayHeightPixels(Landroid/content/Context;)I
.end method

.method public static native getDisplayWidthPixels(Landroid/content/Context;)I
.end method

.method public static native getLocationX(Landroid/view/View;)I
.end method

.method public static native getLocationY(Landroid/view/View;)I
.end method

.method public static native getRandom(II)I
.end method

.method public static native hideKeyboard(Landroid/content/Context;)V
.end method

.method public static native isConnected(Landroid/content/Context;)Z
.end method

.method public static native showKeyboard(Landroid/content/Context;)V
.end method

.method public static native showMessage(Landroid/content/Context;Ljava/lang/String;)V
.end method

.method public static native sortListMap(Ljava/util/ArrayList;Ljava/lang/String;ZZ)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation
.end method
