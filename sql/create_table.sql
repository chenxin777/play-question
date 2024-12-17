# 数据库初始化
-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '微信开放平台id',
    mpOpenId     varchar(256)                           null comment '公众号openId',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    vipExpireTime datetime                              null comment '会员过期时间',
    vipCode      varchar(128)                           null comment '会员兑换码',
    vipNumber    bigint                                 null comment '会员编号',
    shareCode    varchar(20)      default null              comment '分享码',
    inviteUser   bigint       default null              comment '邀请用户id',
    editTime     datetime     default CURRENT_TIMESTAMP not null comment '编辑时间',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
    ) comment '用户' collate = utf8mb4_unicode_ci;


-- 题库表
create table if not exists question_bank
(
    id          bigint auto_increment comment 'id' primary key,
    title       varchar(256)                       null comment '标题',
    description text                               null comment '描述',
    picture     varchar(2048)                      null comment '图片',
    priority    int      default 0                 not null comment '优先级',
    viewNum     int      default 0                 not null comment '浏览量',
    userId      bigint                             not null comment '创建用户 id',
    reviewStatus int     default 0                 NOT NULL comment '审核状态: 0-待审核，1-通过，2-拒绝',
    reviewInfo  varchar(512)                       null comment '审核信息',
    reviewerId  bigint                             null comment '审核人id',
    reviewTime  datetime                           null comment '审核时间',
    editTime    datetime default CURRENT_TIMESTAMP not null comment '编辑时间',
    createTime  datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete    tinyint  default 0                 not null comment '是否删除',
    index idx_title (title)
    ) comment '题库' collate = utf8mb4_unicode_ci;


-- 题目表
create table if not exists question
(
    id         bigint auto_increment comment 'id' primary key,
    title      varchar(256)                       null comment '标题',
    content    text                               null comment '内容',
    tags       varchar(1024)                      null comment '标签列表（json 数组）',
    answer     text                               null comment '推荐答案',
    source     varchar(512)                       null comment '来源',
    needVip    tinyint   default 0                not null comment '仅会员可见（1表示仅会员可见）',
    userId     bigint                             not null comment '创建用户id',
    reviewStatus int     default 0                 NOT NULL comment '审核状态: 0-待审核，1-通过，2-拒绝',
    reviewInfo  varchar(512)                       null comment '审核信息',
    reviewerId  bigint                             null comment '审核人id',
    reviewTime  datetime                           null comment '审核时间',
    viewNum    int      default 0                 not null comment '浏览量',
    thumbNum   int      default 0                 not null comment '点赞数',
    favourNum  int      default 0                 not null comment '收藏数',
    editTime   datetime default CURRENT_TIMESTAMP not null comment '编辑时间',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete   tinyint  default 0                 not null comment '是否删除',
    index idx_title (title),
    index idx_userId (userId)
    ) comment '题目' collate = utf8mb4_unicode_ci;

-- 题库题目表（硬删除）
create table if not exists question_bank_question
(
    id             bigint auto_increment comment 'id' primary key,
    questionBankId bigint                             not null comment '题库 id',
    questionId     bigint                             not null comment '题目 id',
    questionOrder  int      default 0                 not null comment '题目顺序',
    userId         bigint                             not null comment '创建用户 id',
    createTime     datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime     datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    UNIQUE (questionBankId, questionId)
    ) comment '题库题目' collate = utf8mb4_unicode_ci;
















