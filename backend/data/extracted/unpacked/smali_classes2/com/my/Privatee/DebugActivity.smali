.class public Lcom/my/Privatee/DebugActivity;
.super Landroid/app/Activity;
.source "Dex2C"


# instance fields
.field private exceptionMessages:[Ljava/lang/String;

.field private exceptionTypes:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x1

    const-class v1, Lcom/my/Privatee/DebugActivity;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_1_20(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x5

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "StringIndexOutOfBoundsException"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "IndexOutOfBoundsException"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "ArithmeticException"

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string v2, "NumberFormatException"

    const/4 v6, 0x3

    aput-object v2, v1, v6

    const-string v2, "ActivityNotFoundException"

    const/4 v7, 0x4

    aput-object v2, v1, v7

    iput-object v1, p0, Lcom/my/Privatee/DebugActivity;->exceptionTypes:[Ljava/lang/String;

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "Invalid string operation\n"

    aput-object v1, v0, v3

    const-string v1, "Invalid list operation\n"

    aput-object v1, v0, v4

    const-string v1, "Invalid arithmetical operation\n"

    aput-object v1, v0, v5

    const-string v1, "Invalid toNumber block operation\n"

    aput-object v1, v0, v6

    const-string v1, "Invalid intent operation"

    aput-object v1, v0, v7

    iput-object v0, p0, Lcom/my/Privatee/DebugActivity;->exceptionMessages:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected native onCreate(Landroid/os/Bundle;)V
.end method
