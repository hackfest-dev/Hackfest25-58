.class public Lcom/my/Privatee/FileUtil;
.super Ljava/lang/Object;
.source "Dex2C"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x2

    const-class v1, Lcom/my/Privatee/FileUtil;

    invoke-static {v0, v1}, Lnpdcc0/DtcLoader;->registerNativesForClass(ILjava/lang/Class;)V

    invoke-static {v1}, Lnpdcc0/hidden/Hidden0;->special_clinit_2_390(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
.end method

.method public static native convertUriToFilePath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
.end method

.method public static native copyDir(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native copyFile(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private static native createNewFile(Ljava/lang/String;)V
.end method

.method public static native createNewPictureFile(Landroid/content/Context;)Ljava/io/File;
.end method

.method public static native cropBitmapFileFromCenter(Ljava/lang/String;Ljava/lang/String;II)V
.end method

.method public static native decodeSampleBitmapFromPath(Ljava/lang/String;II)Landroid/graphics/Bitmap;
.end method

.method public static native deleteFile(Ljava/lang/String;)V
.end method

.method private static native getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native getExternalStorageDir()Ljava/lang/String;
.end method

.method public static native getFileLength(Ljava/lang/String;)J
.end method

.method public static native getJpegRotate(Ljava/lang/String;)I
.end method

.method public static native getPackageDataDir(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public static native getPublicDir(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native getScaledBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;
.end method

.method public static native isDirectory(Ljava/lang/String;)Z
.end method

.method private static native isDownloadsDocument(Landroid/net/Uri;)Z
.end method

.method public static native isExistFile(Ljava/lang/String;)Z
.end method

.method private static native isExternalStorageDocument(Landroid/net/Uri;)Z
.end method

.method public static native isFile(Ljava/lang/String;)Z
.end method

.method private static native isMediaDocument(Landroid/net/Uri;)Z
.end method

.method public static native listDir(Ljava/lang/String;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public static native makeDir(Ljava/lang/String;)V
.end method

.method public static native moveFile(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native readFile(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native resizeBitmapFileRetainRatio(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method public static native resizeBitmapFileToCircle(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native resizeBitmapFileToSquare(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method public static native resizeBitmapFileWithRoundedBorder(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method public static native rotateBitmapFile(Ljava/lang/String;Ljava/lang/String;F)V
.end method

.method private static native saveBitmap(Landroid/graphics/Bitmap;Ljava/lang/String;)V
.end method

.method public static native scaleBitmapFile(Ljava/lang/String;Ljava/lang/String;FF)V
.end method

.method public static native setBitmapFileBrightness(Ljava/lang/String;Ljava/lang/String;F)V
.end method

.method public static native setBitmapFileColorFilter(Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method public static native setBitmapFileContrast(Ljava/lang/String;Ljava/lang/String;F)V
.end method

.method public static native skewBitmapFile(Ljava/lang/String;Ljava/lang/String;FF)V
.end method

.method public static native writeFile(Ljava/lang/String;Ljava/lang/String;)V
.end method
