.class public Larm/erxyi;
.super Landroid/content/ContentProvider;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final scheduler:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 25
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Larm/erxyi;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    return-void
.end method

.method public static isVpnConnected()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 80
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v3

    .line 81
    .local v3, "niList":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    if-nez v3, :cond_1

    .line 98
    :cond_0
    :goto_0
    return v4

    .line 84
    :cond_1
    invoke-static {v3}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 85
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/net/NetworkInterface;>;"
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 86
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;

    .line 87
    .local v1, "intf":Ljava/net/NetworkInterface;
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->isUp()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 88
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getInterfaceAddresses()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_2

    .line 89
    const-string v5, "tun0"

    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "ppp0"

    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_2

    .line 90
    :cond_3
    const/4 v4, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "intf":Ljava/net/NetworkInterface;
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/net/NetworkInterface;>;"
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static isWifiProxy(Landroid/content/Context;)Z
    .locals 5
    .param p0, "mContext"    # Landroid/content/Context;

    .prologue
    .line 64
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_2

    .line 65
    const-string v3, "http.proxyHost"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "proxyAddress":Ljava/lang/String;
    const-string v3, "http.proxyPort"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "portStr":Ljava/lang/String;
    if-eqz v0, :cond_1

    .end local v0    # "portStr":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 72
    .local v2, "proxyPort":I
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, -0x1

    if-ne v2, v3, :cond_3

    .line 73
    :cond_0
    const/4 v3, 0x0

    .line 75
    :goto_2
    return v3

    .line 67
    .end local v2    # "proxyPort":I
    .restart local v0    # "portStr":Ljava/lang/String;
    :cond_1
    const-string v0, "-1"

    goto :goto_0

    .line 69
    .end local v0    # "portStr":Ljava/lang/String;
    .end local v1    # "proxyAddress":Ljava/lang/String;
    :cond_2
    invoke-static {p0}, Landroid/net/Proxy;->getHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 70
    .restart local v1    # "proxyAddress":Ljava/lang/String;
    invoke-static {p0}, Landroid/net/Proxy;->getPort(Landroid/content/Context;)I

    move-result v2

    .restart local v2    # "proxyPort":I
    goto :goto_1

    .line 75
    :cond_3
    const/4 v3, 0x1

    goto :goto_2
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "selection"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "selectionArgs"    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 53
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .prologue
    .line 42
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "values"    # Landroid/content/ContentValues;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .prologue
    .line 48
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .locals 7

    .prologue
    .line 29
    iget-object v0, p0, Larm/erxyi;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 30
    const/4 v0, 0x0

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "projection"    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "selection"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "selectionArgs"    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "sortOrder"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .prologue
    .line 36
    const/4 v0, 0x0

    return-object v0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 104
    invoke-static {}, Larm/erxyi;->isVpnConnected()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Larm/erxyi;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Larm/erxyi;->isWifiProxy(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 105
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 107
    :cond_1
    return-void
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "values"    # Landroid/content/ContentValues;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "selection"    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "selectionArgs"    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method
