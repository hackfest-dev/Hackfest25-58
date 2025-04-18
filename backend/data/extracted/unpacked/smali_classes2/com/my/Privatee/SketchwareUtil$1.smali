.class Lcom/my/Privatee/SketchwareUtil$1;
.super Ljava/lang/Object;
.source "Dex2C"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/my/Privatee/SketchwareUtil;->sortListMap(Ljava/util/ArrayList;Ljava/lang/String;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final val$ascending:Z

.field private final val$isNumber:Z

.field private final val$key:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0xb

    const-class v1, Lcom/my/Privatee/SketchwareUtil$1;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_11_30(Ljava/lang/Class;)V

    return-void
.end method

.method constructor <init>(ZLjava/lang/String;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/my/Privatee/SketchwareUtil$1;->val$isNumber:Z

    iput-object p2, p0, Lcom/my/Privatee/SketchwareUtil$1;->val$key:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/my/Privatee/SketchwareUtil$1;->val$ascending:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge native synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
.end method

.method public native compare(Ljava/util/HashMap;Ljava/util/HashMap;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation
.end method
