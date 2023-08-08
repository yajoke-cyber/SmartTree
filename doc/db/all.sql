# 大章数据表
drop table if exists `chapter`;
create table `chapter`(
                          `id` char(8) not null comment 'ID',
                          `course_id` char(8) comment '课程ID',
                          `name` varchar(50) comment '名称',
                          primary key (id)
) engine = innodb default charset=utf8mb4 comment='大章';

# 小节表
drop table if exists  `section`;
create table `section` (
                           `id` char(8) not null default '' comment 'ID',
                           `title` varchar(50) not null comment '标题',
                           `course_id` char(8) comment  '课程|course_id',
                           `chapter_id` char(8) comment '大章|chapter.id',
                           `video` varchar(200) comment '视频',
                           `time` int comment '时长|单位秒',
                           `charge` char(1) comment '收费|C 免费|F',
                           `sort` int comment '顺序',
                           `created_at` datetime(3) comment '创建时间',
                           `updated_at` datetime(3) comment  '修改时间',
                           primary key (`id`)
) engine =InnoDB default charset =utf8mb4 comment ='小节';
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
VALUES ('00000001','测试小节01','00000001','00000000','',500,'F',1,now(),now());
alter table `section` add column (`vod` char(32) comment 'VOD|阿里云VOD');
# 课程表
drop table if exists course;
create table course(
                       id char(8) not null default '' comment 'id',
                       name varchar(50) not null comment '名称',
                       summary varchar(2000) comment '概述',
                       time int default 0 comment '时长|单位秒',
                       price decimal(8,2) default 0.00 comment '价格（元）',
                       image varchar(100) comment '封面',
                       level char(1) not null comment '级别|枚举[CourseLevelEnum]:|ONE("1","初级"),TWO("2",中级),THREE("3","高级")',
                       charge char(1) comment '收费|枚举[CourseChargeEnum]:|CHARGE("C","收费"),FREE("F","免费")',
                       status char(1) comment '状态|枚举[CourseStatusEnum]:|PUBLISH("P","发布"),DRAFT("D","草稿")',
                       enroll integer default 0 comment '报名数',
                       sort int comment '顺序',
                       created_at datetime(3) comment '创建时间',
                       updated_at datetime(3) comment '修改时间',
                       primary key (id)
) engine =innodb default charset=utf8mb4 comment ='课程';
insert into course(id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at) VALUES
    ('00000001','测试课程01','这是一门测试课程',7200,19.9,'',1,'C','P',100,0,now(),now());
#分类表
drop table if exists category;
create table category(
                         id char(8) not null default '' comment 'id',
                         parent char(8) not null default '' comment 'id',
                         name varchar(50) not null comment '名称',
                         sort int comment '顺序',
                         primary key (id)
) engine =innodb default charset=utf8mb4 comment ='分类';
# 这里第一级标题的parent是'00000000'
insert into category (id, parent, name, sort) VALUES ('00000100','00000000','前端技术',100);
insert into category (id, parent, name, sort) VALUES ('00000101','00000100','html/css',101);
insert into category (id, parent, name, sort) VALUES ('00000102','00000100','javascript',102);
insert into category (id, parent, name, sort) VALUES ('00000103','00000100','vue.js',103);
insert into category (id, parent, name, sort) VALUES ('00000104','00000100','react.js',104);
insert into category (id, parent, name, sort) VALUES ('00000105','00000100','angular',105);
insert into category (id, parent, name, sort) VALUES ('00000106','00000100','node.js',106);
insert into category (id, parent, name, sort) VALUES ('00000107','00000100','jquery',107);
insert into category (id, parent, name, sort) VALUES ('00000108','00000100','小程序',108);
insert into category (id, parent, name, sort) VALUES ('00000200','00000000','后端技术',200);
insert into category (id, parent, name, sort) VALUES ('00000201','00000100','java',201);
insert into category (id, parent, name, sort) VALUES ('00000202','00000100','springboot',202);
insert into category (id, parent, name, sort) VALUES ('00000203','00000100','spring cloud',203);
insert into category (id, parent, name, sort) VALUES ('00000204','00000100','ssm',204);
insert into category (id, parent, name, sort) VALUES ('00000205','00000100','python',205);
insert into category (id, parent, name, sort) VALUES ('00000206','00000100','爬虫',206);
insert into category (id, parent, name, sort) VALUES ('00000300','00000000','移动开发',300);
insert into category (id, parent, name, sort) VALUES ('00000301','00000300','android',301);
insert into category (id, parent, name, sort) VALUES ('00000302','00000300','ios',302);
insert into category (id, parent, name, sort) VALUES ('00000303','00000300','react native',303);
insert into category (id, parent, name, sort) VALUES ('00000304','00000300','ionic',304);
# 课程分类表
drop table if exists course_category;
create table course_category(
                                id char(8) not null default '' comment 'id',
                                course_id char(8) comment '课程|course.id',
                                category_id varchar(8) comment '分类|category.id',
                                primary key (id)
) engine =innodb default charset=utf8mb4 comment ='课程分类';
# 课程内容表
# mediumtext比text更长，用于存放课程详情例如图片，信息和视频,大字段可以单独放一张表
# 点赞，浏览量等经常变化的数据也要单独放一张表
drop table if exists course_content;
create table course_content(
                               id char(8) not null default '' comment '课程id',
                               content  mediumtext not null comment '课程内容',
                               primary key (id)
) engine =innodb default charset=utf8mb4 comment ='课程内容';
#讲师表
drop table if exists teacher;
create table teacher(
                        id char(8) not null default '' comment 'id',
                        name varchar(50) not null comment '姓名',
                        nickname varchar(50) comment '昵称',
                        image varchar(100) comment '头像',
                        position varchar(50) comment '职位',
                        motto varchar(50) comment '座右铭',
                        intro varchar(500) comment '简介',
                        primary key (id)
) engine =innodb default charset=utf8mb4 comment ='讲师';
insert into teacher (id, name, nickname, image, position, motto, intro) VALUES ('00000003','test','test','test','test','test','test');
# 增加course表中讲师字段，上线以后可以再加字段
alter table course add column (teacher_id char(8) comment '讲师|teacher.id');
# 文件表
drop table if exists file;
create table file(
                     id char(8) not null default '' comment 'id',
                     path varchar(100) not null comment '相对路径',
                     name varchar(100) comment '文件名',
                     suffix varchar(10) comment '后缀',
                     size int comment '大小|字节B',
                     `use` char(1) comment '用途|枚举[FileUseEnum]:COURSE("C", "课程"),TEACHER("T", "讲师");',
                     created_at datetime(3) comment '创建时间',
                     updated_at datetime(3) comment '修改时间',
                     primary key (id),
                     unique key `path_unique` (`path`)
) engine =innodb default charset=utf8mb4 comment ='文件';
# 断点上传记录分片
alter table `file` add column (`shard_index` int comment '已上传分片');
alter table `file` add column (`shard_size` int comment '分片大小|B');
alter table `file` add column (`shard_total` int comment '分片总数');
alter table `file` add column (`key` varchar(32) comment '文件标识');
alter table `file` add unique key key_unique(`key`);
alter table `file` add column (`vod` char(32) comment 'VOD|阿里云VOD');

# 课程内容文件表
drop table if exists `course_category_file`;
create table course_category_file(
                                     id char(8) not null default '' comment 'id',
                                     course_id varchar(8) not null comment '课程id',
                                     url varchar(100) comment '地址',
                                     name varchar(100) comment '文件名',
                                     size int comment '大小|字节b',
                                     primary key (id)
) engine =innodb default charset=utf8mb4 comment ='课程内容文件';
# 用户表
drop table if exists `user`;
create table user(
                     id char(8) not null default '' comment 'id',
                     login_name varchar(50) not null comment '登陆名',
                     name varchar(50) comment '昵称',
                     password varchar(32)  not null comment '密码',
                     primary key (id),
                     unique key `login_name_unique` (login_name)
) engine =innodb default charset=utf8mb4 comment ='用户';
insert into user (id, login_name, name, password) values ('10000000','test','测试','123456');
# 资源表
drop table if exists `resource`;
create table resource(
                         id char(6) not null default '' comment 'id',
                         name varchar(100) not null comment '名称|菜单或按钮',
                         page varchar(50) null comment '页面|路由',
                         request varchar(200) null comment '请求|接口',
                         parent varchar(6)  comment '父id',
                         primary key (id)
) engine =innodb default charset=utf8mb4 comment ='资源';
insert into resource (id, name, page, request, parent)
values ('01','系统管理',null,null,null);

insert into resource (id, name, page, request, parent)
values ('010101','保存',null,'["/system/admin/user/list","/system/admin/user/save"]','0101');
insert into resource (id, name, page, request, parent)
values ('010102','删除',null,'["/system/admin/user/delete"]','0101');
insert into resource (id, name, page, request, parent)
values ('010103','重置密码',null,'["/system/admin/user/save-password"]','0101');
insert into resource (id, name, page, request, parent)
values ('0102','资源管理','system/resource',null,'01');
insert into resource (id, name, page, request, parent)
values ('010201','保存/显示',null,'["/system/admin/resource"]','0102');
insert into resource (id, name, page, request, parent)
values ('0103','角色管理','system/role',null,'01');
insert into resource (id, name, page, request, parent)
values ('010301','角色/权限管理',null,'["system/admin/role"]','0103');

# 角色表
drop table if exists `role`;
create table role(
                     `id` char(8) not null default '' comment 'id',
                     `name` varchar(50) not null comment '角色',
                     `desc` varchar(100) not null comment '描述',
                     primary key (`id`)
) engine =innodb default charset=utf8mb4 comment ='角色';
insert into `role` values ('00000000','系统管理员','管理用户、角色权限');
insert into `role` values ('00000001','开发','维护资源');
insert into `role` values ('00000002','业务管理员','负责业务管理');
# 角色资源关联表
drop table if exists `role_resource`;
create table role_resource(
                              `id` char(8) not null default '' comment 'id',
                              `role_id` char(8) not null comment '角色|id',
                              `resource_id` char(6) not null comment '资源|id',
                              primary key (`id`)
) engine =innodb default charset=utf8mb4 comment ='角色资源关联';
insert into `role_resource` values ('00000000','00000000','01');
insert into `role_resource` values ('00000001','00000000','0101');
insert into `role_resource` values ('00000002','00000000','010101');
insert into `role_resource` values ('00000003','00000000','010102');
insert into `role_resource` values ('00000004','00000000','010103');
insert into `role_resource` values ('00000005','00000000','0102');
insert into `role_resource` values ('00000006','00000000','010201');
insert into `role_resource` values ('00000007','00000000','0103');
insert into `role_resource` values ('00000008','00000000','010301');
# 角色用户关联表
drop table if exists `role_user`;
create table role_user
(
    `id`      char(8) not null default '' comment 'id',
    `role_id` char(8) not null comment '角色|id',
    `user_id` char(8) not null comment '用户|id',
    primary key (`id`)
) engine =innodb default charset=utf8mb4 comment ='角色用户关联';
insert into `role_user` values ('00000000','00000000','1000000');
# 会员表
drop table if exists `member`;
create table `member`(
    `id` char(8) not null default '' comment 'id',
    `mobile` varchar(11) not null comment '手机号',
    `password` char(32) not null comment '密码',
    `name` varchar(50) comment '昵称',
    `photo` varchar(200) comment '头像url',
    `register_time` datetime(3) comment '注册时间',
    primary key (`id`),
    unique key `mobile_unique` (`mobile`)
)engine =innodb default charset=utf8mb4 comment ='会员';
insert into `member` (id, mobile, password, name, photo, register_time) values
('00000001','12345678901','fb09b64e309e1c33e7cf8cfe99b07bd5','测试',null,now());
# 短信验证码表
drop table if exists `sms`;
create table `sms`(
                    `id` char(8) not null default '' comment 'id',
                    `mobile` varchar(50) not null comment '手机号',
                    `code` char(6) not null comment '验证码',
                    `use` char(1) not null comment '用途|枚举[SmsUseEnum]:REGISTER("R", "注册"),FORGET("F", "忘记密码");',
                    `at` datetime(3) not null comment '生成时间',
                    `status` char(1) not null comment '状态|枚举[SmsStatusEnum]:USED("U", "已使用"),NOT_USED("N", "未使用")',
                    primary key (`id`)
)engine =innodb default charset=utf8mb4 comment ='短信验证码';
insert into sms (id, mobile, code, `use`, at, status) values ('00000000','12345678901','1234','R',now(),'N');
# 会员课程报名表
drop table if exists `member_course`;
create table `member_course`(
                      `id` char(8) not null default '' comment 'id',
                      `member_id` char(8) not null  comment '会员id',
                      `course_id` char(8) not null  comment '课程id',
                      `at` datetime(3) not null comment '报名时间',
                      primary key (`id`),
                      unique key `member_course_unique` (`member_id`,`course_id`)
)engine =innodb default charset=utf8mb4 comment ='会员课程报名';