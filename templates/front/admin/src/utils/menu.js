const menu = {
    list() {
        return [{"backMenu":[{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-send","buttons":["新增","查看","修改","删除"],"menu":"省","menuJump":"列表","tableName":"sheng"}],"menu":"省管理"},{"child":[{"allButtons":["新增","查看","修改","删除"],"appFrontIcon":"cuIcon-shop","buttons":["新增","查看","修改","删除"],"menu":"扶贫政策","menuJump":"列表","tableName":"fupinzhengce"}],"menu":"扶贫政策管理"},{"child":[{"allButtons":["新增","查看","修改","删除","收入统计","贫困等级统计","扶贫政策统计","扶贫结果统计","贫困人数统计","导入","上传模板","下载模板","首页总数","首页统计"],"appFrontIcon":"cuIcon-discover","buttons":["新增","查看","修改","删除","生成数据","导入"],"menu":"扶贫信息","menuJump":"列表","tableName":"fupinxinxi"}],"menu":"扶贫信息管理"},{"child":[{"allButtons":["查看","修改"],"appFrontIcon":"cuIcon-phone","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"}],"menu":"系统管理"}],"frontMenu":[],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"}]
    }
}
export default menu;
