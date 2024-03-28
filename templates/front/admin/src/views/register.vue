<template>
	<div>
		<div class="container" :style='{"minHeight":"100vh","width":"100%","alignItems":"center","background":"url(http://codegen.caihongy.cn/20240126/6145e2c35351411a81426b78728fd386.jpg)no-repeat center center / cover","justifyContent":"center","display":"flex"}'>
			<el-form v-if="pageFlag=='register'" :style='{"padding":"100px 20px 20px 50px","boxShadow":"0 1px 6px rgba(64, 158, 255, .8)","margin":"0","borderRadius":"10px","background":"#fff","width":"600px","position":"relative","height":"auto"}' ref="rgsForm" class="rgs-form" :model="rgsForm" :rules="rules">
				<div v-if="true" :style='{"margin":"0 0 10px 0","color":"#fff","top":"0px","textAlign":"center","left":"0px","background":"rgb(51, 136, 203)","width":"100%","letterSpacing":"3px","lineHeight":"60px","fontSize":"24px","position":"absolute","fontWeight":"600"}' class="title">基于Python的我国县级帮扶信息管理系统（永顺县）注册</div>
				<button :style='{"border":"0","cursor":"pointer","padding":"0 10px","margin":"20px auto 5px","outline":"none","color":"#fff","borderRadius":"8px","background":"rgb(51, 136, 203)","display":"block","width":"80%","fontSize":"16px","height":"44px"}' type="button" class="r-btn" @click="login()">注册</button>
				<div :style='{"cursor":"pointer","padding":"0 10%","color":"#2a67b2","display":"inline-block","lineHeight":"1","fontSize":"12px","textDecoration":"underline"}' class="r-login" @click="close()">已有账号，直接登录</div>
			</el-form>
			
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			ruleForm: {
			},
			forgetForm: {},
            pageFlag : '',
			tableName:"",
			rules: {},
		};
	},
	mounted(){
		this.pageFlag = this.$route.query.pageFlag
		if(this.$route.query.pageFlag=='register'){
			
			let table = this.$storage.get("loginTable");
			this.tableName = table;
		}
	},
	created() {
	},
	destroyed() {
		  	},
	methods: {
		changeRules(name){
			if(this.rules[name]){
				return true
			}
			return false
		},
		// 获取uuid
		getUUID () {
			return new Date().getTime();
		},
		close(){
			this.$router.push({ path: "/login" });
		},

        // 多级联动参数


		// 注册
		login() {
			var url=this.tableName+"/register";
			this.$http({
				url: url,
				method: "post",
				data:this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message({
						message: "注册成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							this.$router.replace({ path: "/login" });
						}
					});
				} else {
					this.$message.error(data.msg);
				}
			});
		}
	}
};
</script>

<style lang="scss" scoped>
	.container {
	  position: relative;
	  background: url(http://codegen.caihongy.cn/20240126/6145e2c35351411a81426b78728fd386.jpg)no-repeat center center / cover;

		.el-date-editor.el-input {
		  width: 100%;
		}
		
		.rgs-form .el-input /deep/ .el-input__inner {
						border: 3px solid rgb(201, 208, 220);
						border-radius: 8px;
						padding: 0 10px;
						outline: none;
						color: rgb(134, 150, 176);
						width: 400px;
						font-size: 14px;
						height: 44px;
					}
		
		.rgs-form .el-select /deep/ .el-input__inner {
						border: 3px solid rgb(201, 208, 220) ;
						border-radius: 8px;
						padding: 0 10px;
						outline: none;
						color: rgb(134, 150, 176);
						width: 400px;
						font-size: 14px;
						height: 44px;
					}
		
		.rgs-form .el-date-editor /deep/ .el-input__inner {
						border: 3px solid rgb(201, 208, 220)   ;
						border-radius: 8px;
						padding: 0 10px 0 30px;
						outline: none;
						color: rgb(134, 150, 176);
						width: 400px;
						font-size: 14px;
						height: 44px;
					}
		
		.rgs-form .el-date-editor /deep/ .el-input__inner {
						border: 3px solid rgb(201, 208, 220)   ;
						border-radius: 8px;
						padding: 0 10px 0 30px;
						outline: none;
						color: rgb(134, 150, 176);
						width: 400px;
						font-size: 14px;
						height: 44px;
					}
		
		.rgs-form /deep/ .el-upload--picture-card {
			background: transparent;
			border: 0;
			border-radius: 0;
			width: auto;
			height: auto;
			line-height: initial;
			vertical-align: middle;
		}
		
		.rgs-form /deep/ .upload .upload-img {
		  		  border: 3px dashed rgb(201, 208, 220)   ;
		  		  cursor: pointer;
		  		  border-radius: 8px;
		  		  color: rgb(201, 208, 220)   ;
		  		  width: 160px;
		  		  font-size: 32px;
		  		  line-height: 160px;
		  		  text-align: center;
		  		  height: 160px;
		  		}
		
		.rgs-form /deep/ .el-upload-list .el-upload-list__item {
		  		  border: 3px dashed rgb(201, 208, 220)   ;
		  		  cursor: pointer;
		  		  border-radius: 8px;
		  		  color: rgb(201, 208, 220)   ;
		  		  width: 160px;
		  		  font-size: 32px;
		  		  line-height: 160px;
		  		  text-align: center;
		  		  height: 160px;
		  		}
		
		.rgs-form /deep/ .el-upload .el-icon-plus {
		  		  border: 3px dashed rgb(201, 208, 220)   ;
		  		  cursor: pointer;
		  		  border-radius: 8px;
		  		  color: rgb(201, 208, 220)   ;
		  		  width: 160px;
		  		  font-size: 32px;
		  		  line-height: 160px;
		  		  text-align: center;
		  		  height: 160px;
		  		}
	}
	.required {
		position: relative;
	}
	.required::after{
				color: red;
				left: -10px;
				position: absolute;
				content: "*";
			}
	.editor>.avatar-uploader {
		line-height: 0;
		height: 0;
	}
</style>
