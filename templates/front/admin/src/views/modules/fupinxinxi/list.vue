<template>
	<div class="main-content" :style='{"width":"100%","padding":"30px","margin":"0","overflow-y":"auto","background":"#fff","height":"auto"}'>
		<!-- 列表页 -->
		<template v-if="showFlag">
			<el-form class="center-form-pv" :style='{"margin":"0 0 20px"}' :inline="true" :model="searchForm">
				<el-row :style='{"display":"block"}' >
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}'>
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"none","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">姓名</label>
						<el-input v-model="searchForm.xingming" placeholder="姓名" @keydown.enter.native="search()" clearable></el-input>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}' class="select" label="性别" prop="xingbie">
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"none","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">性别</label>
						<el-select clearable v-model="searchForm.xingbie" placeholder="请选择性别" >
							<el-option v-for="(item,index) in xingbieOptions" v-bind:key="index" :label="item" :value="item"></el-option>
						</el-select>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}' class="select" label="乡镇" prop="sheng">
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"none","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">乡镇</label>
						<el-select clearable v-model="searchForm.sheng" placeholder="请选择乡镇" >
							<el-option v-for="(item,index) in shengOptions" v-bind:key="index" :label="item" :value="item"></el-option>
						</el-select>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}' class="select" label="贫困等级" prop="pinkundengji">
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"none","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">贫困等级</label>
						<el-select clearable v-model="searchForm.pinkundengji" placeholder="请选择贫困等级" >
							<el-option v-for="(item,index) in pinkundengjiOptions" v-bind:key="index" :label="item" :value="item"></el-option>
						</el-select>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}' class="select" label="帮扶政策" prop="fupinzhengce">
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"none","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">帮扶政策</label>
						<el-select clearable v-model="searchForm.fupinzhengce" placeholder="请选择帮扶政策" >
							<el-option v-for="(item,index) in fupinzhengceOptions" v-bind:key="index" :label="item" :value="item"></el-option>
						</el-select>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}' class="select" label="帮扶结果" prop="fupinjieguo">
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"none","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">帮扶结果</label>
						<el-select clearable v-model="searchForm.fupinjieguo" placeholder="请选择帮扶结果" >
							<el-option v-for="(item,index) in fupinjieguoOptions" v-bind:key="index" :label="item" :value="item"></el-option>
						</el-select>
					</div>
					<el-button class="search" type="success" @click="search()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"16px","color":"#fff","height":"40px"}'></span>
						查询
					</el-button>
				</el-row>

				<el-row class="actions" :style='{"flexWrap":"wrap","margin":"20px 0","display":"flex"}'>
					<el-button class="add" v-if="isAuth('fupinxinxi','新增')" type="success" @click="addOrUpdateHandler()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8a99b2","height":"40px"}'></span>
						添加
					</el-button>
					<el-button class="del" v-if="isAuth('fupinxinxi','删除')" :disabled="dataListSelections.length?false:true" type="danger" @click="deleteHandler()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8e9db5","height":"40px"}'></span>
						删除
					</el-button>

					<el-button class="btn18" v-if="isAuth('fupinxinxi','导入')" type="success" @click="importHandler()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						导入
					</el-button>
					<el-button class="btn18" v-if="isAuth('fupinxinxi','上传模板')" type="success" @click="importClcik">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						上传模板
					</el-button>
					<el-button class="btn18" v-if="isAuth('fupinxinxi','下载模板')" type="success" @click="download('upload/fupinxinxi_template.xlsx')">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						下载模板
					</el-button>


					<el-button class="btn18" v-if="isAuth('fupinxinxi','收入统计')" type="success" @click="chartDialog1()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						收入统计
					</el-button>
					<el-button class="btn18" v-if="isAuth('fupinxinxi','贫困等级统计')" type="success" @click="chartDialog2()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						贫困等级统计
					</el-button>
					<el-button class="btn18" v-if="isAuth('fupinxinxi','帮扶政策统计')" type="success" @click="chartDialog3()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						帮扶政策统计
					</el-button>
					<el-button class="btn18" v-if="isAuth('fupinxinxi','帮扶结果统计')" type="success" @click="chartDialog4()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						帮扶结果统计
					</el-button>
					<el-button class="btn18" v-if="isAuth('fupinxinxi','贫困人数统计')" type="success" @click="chartDialog5()">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#8b9ab3","height":"40px"}'></span>
						贫困人数统计
					</el-button>
				</el-row>
			</el-form>
			<div :style='{"width":"100%","padding":"10px"}'>
				<el-table class="tables"
					:stripe='false'
					:style='{"width":"100%","padding":"0","borderColor":"#eee","borderStyle":"solid","borderWidth":"1px 0 0 1px","background":"#fff"}' 
					:border='true'
					v-if="isAuth('fupinxinxi','查看')"
					:data="dataList"
					v-loading="dataListLoading"
				@selection-change="selectionChangeHandler">
					<el-table-column :resizable='true' type="selection" align="center" width="50"></el-table-column>
					<el-table-column :resizable='true' :sortable='false' label="序号" type="index" width="50" />
					<!-- xingming -->
					<!-- 5 -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="xingming"
						label="姓名">
						<template slot-scope="scope">
							{{scope.row.xingming}}
						</template>
					</el-table-column>
					<!-- xingbie -->
					<!-- 5 -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="xingbie"
						label="性别">
						<template slot-scope="scope">
							{{scope.row.xingbie}}
						</template>
					</el-table-column>
					<!-- touxiang -->
					<!-- 5 -->
					<!-- 无 -->
					<el-table-column :resizable='true' :sortable='false' prop="touxiang" width="200" label="头像">
						<template slot-scope="scope">
							<div v-if="scope.row.touxiang">
								<img v-if="scope.row.touxiang.substring(0,4)=='http'" :src="scope.row.touxiang.split(',')[0]" width="100" height="100" style="object-fit: cover">
								<img v-else :src="$base.url+scope.row.touxiang.split(',')[0]" width="100" height="100" style="object-fit: cover">
							</div>
							<div v-else>无图片</div>
						</template>
					</el-table-column>
					<!-- sheng -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="sheng"
						label="乡镇">
						<template slot-scope="scope">
							{{scope.row.sheng}}
						</template>
					</el-table-column>
					<!-- jiatingzhuzhi -->
					<!-- 5 -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="jiatingzhuzhi"
						label="家庭住址">
						<template slot-scope="scope">
							{{scope.row.jiatingzhuzhi}}
						</template>
					</el-table-column>
					<!-- chengyuanshuliang -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="chengyuanshuliang"
						label="家庭成员数量">
						<template slot-scope="scope">
							{{scope.row.chengyuanshuliang}}
						</template>
					</el-table-column>
					<!-- yuannianshouru -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="yuannianshouru"
						label="原年收入">
						<template slot-scope="scope">
							{{scope.row.yuannianshouru}}
						</template>
					</el-table-column>
					<!-- yuankezhipeishouru -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="yuankezhipeishouru"
						label="原可支配收入">
						<template slot-scope="scope">
							{{scope.row.yuankezhipeishouru}}
						</template>
					</el-table-column>
					<!-- xiannianshouru -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="xiannianshouru"
						label="现年收入">
						<template slot-scope="scope">
							{{scope.row.xiannianshouru}}
						</template>
					</el-table-column>
					<!-- xiankezhipeishouru -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="xiankezhipeishouru"
						label="现可支配收入">
						<template slot-scope="scope">
							{{scope.row.xiankezhipeishouru}}
						</template>
					</el-table-column>
					<!-- kezhipeizhanbi -->
					<!-- 5 -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="kezhipeizhanbi"
						label="可支配占比">
						<template slot-scope="scope">
							{{scope.row.kezhipeizhanbi}}
						</template>
					</el-table-column>
					<!-- pinkundengji -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="pinkundengji"
						label="贫困等级">
						<template slot-scope="scope">
							{{scope.row.pinkundengji}}
						</template>
					</el-table-column>
					<!-- fupinzhengce -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="fupinzhengce"
						label="帮扶政策">
						<template slot-scope="scope">
							{{scope.row.fupinzhengce}}
						</template>
					</el-table-column>
					<!-- fupinneirong -->
					<!-- $column.hiden -->
					<!-- fupinjieguo -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="fupinjieguo"
						label="帮扶结果">
						<template slot-scope="scope">
							{{scope.row.fupinjieguo}}
						</template>
					</el-table-column>
					<!-- dengjiriqi -->
					<!-- $column.hiden -->
					<el-table-column :resizable='true' :sortable='false'  
						prop="dengjiriqi"
						label="登记日期">
						<template slot-scope="scope">
							{{scope.row.dengjiriqi}}
						</template>
					</el-table-column>
					<el-table-column width="300" label="操作">
						<template slot-scope="scope">
							<el-button class="view" v-if=" isAuth('fupinxinxi','查看')" type="success" @click="addOrUpdateHandler(scope.row.id,'info')">
								<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"rgb(139, 154, 179)","height":"40px"}'></span>
								查看
							</el-button>
							<el-button class="edit" v-if=" isAuth('fupinxinxi','修改') " type="success" @click="addOrUpdateHandler(scope.row.id)">
								<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"rgb(139, 154, 179)","height":"40px"}'></span>
								修改
							</el-button>




							<el-button class="del" v-if="isAuth('fupinxinxi','删除') " type="primary" @click="deleteHandler(scope.row.id )">
								<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"rgb(139, 154, 179)","height":"40px"}'></span>
								删除
							</el-button>
						</template>
					</el-table-column>
				</el-table>
			</div>
			<el-pagination
				@size-change="sizeChangeHandle"
				@current-change="currentChangeHandle"
				:current-page="pageIndex"
				background
				:page-sizes="[10, 50, 100, 200]"
				:page-size="pageSize"
				:layout="layouts.join()"
				:total="totalPage"
				prev-text="< "
				next-text="> "
				:hide-on-single-page="true"
				:style='{"width":"100%","padding":"0","margin":"20px 0 0","whiteSpace":"nowrap","color":"#333","fontWeight":"500"}'
			></el-pagination>
		</template>
		
		<!-- 添加/修改页面  将父组件的search方法传递给子组件-->
		<add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>



		<el-dialog title="导入" :visible.sync="importVisiable" width="50%">
			<el-form ref="form" :model="form" label-width="80px">
				<el-form-item class="upload" label="文件" prop="excelFile">
				  <excel-file-upload
				  tip="点击上传直接导入excel文件"
				  action="fupinxinxi/importExcel"
				  :limit="1"
				  :fileUrls="''"
                  @change="importChange"
				  ></excel-file-upload>
				</el-form-item>
			</el-form>
			<span slot="footer" class="dialog-footer">
				<el-button @click="importHandler()">关 闭</el-button>
			</span>
		</el-dialog>
        <el-dialog title="上传模板" :visible.sync="importVis" width="50%">
            <el-form ref="form" :model="importForm" label-width="80px">
                <el-form-item class="upload" label="文件" prop="excelFile">
                    <el-upload class="upload-demo" drag :action="$base.url + 'file/upload?type=fupinxinxi_template'"
                        :show-file-list="false" :on-success="importSuccess">
                        <i class="el-icon-upload"></i>
                        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                    </el-upload>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="importVis=false">关 闭</el-button>
            </span>
        </el-dialog>


		<el-dialog
		  :visible.sync="chartVisiable1"
		  width="800">
			<div id="xingmingChart1" style="width:100%;height:600px;"></div>
		  <span slot="footer" class="dialog-footer">
			<el-button @click="chartDialog1">返回</el-button>
		  </span>
		</el-dialog>
		<el-dialog
		  :visible.sync="chartVisiable2"
		  width="800">
			<div id="pinkundengjiChart2" style="width:100%;height:600px;"></div>
		  <span slot="footer" class="dialog-footer">
			<el-button @click="chartDialog2">返回</el-button>
		  </span>
		</el-dialog>
		<el-dialog
		  :visible.sync="chartVisiable3"
		  width="800">
			<div id="fupinzhengceChart3" style="width:100%;height:600px;"></div>
		  <span slot="footer" class="dialog-footer">
			<el-button @click="chartDialog3">返回</el-button>
		  </span>
		</el-dialog>
		<el-dialog
		  :visible.sync="chartVisiable4"
		  width="800">
			<div id="fupinjieguoChart4" style="width:100%;height:600px;"></div>
		  <span slot="footer" class="dialog-footer">
			<el-button @click="chartDialog4">返回</el-button>
		  </span>
		</el-dialog>
		<el-dialog
		  :visible.sync="chartVisiable5"
		  width="800">
			<div id="chengyuanshuliangChart5" style="width:100%;height:600px;"></div>
		  <span slot="footer" class="dialog-footer">
			<el-button @click="chartDialog5">返回</el-button>
		  </span>
		</el-dialog>
	</div>
</template>

<script>
import * as echarts from 'echarts'
import chinaJson from "@/components/echarts/china.json";
import axios from 'axios'
import AddOrUpdate from "./add-or-update";
	export default {
		data() {
			return {
				xingbieOptions: [],
				shengOptions: [],
				pinkundengjiOptions: [],
				fupinzhengceOptions: [],
				fupinjieguoOptions: [],
				searchForm: {
					key: ""
				},
				form:{},
				dataList: [],
				pageIndex: 1,
				pageSize: 10,
				totalPage: 0,
				dataListLoading: false,
				dataListSelections: [],
				showFlag: true,
				sfshVisiable: false,
				shForm: {},
				importVisiable: false,
				importVis: false,
				importForm: {},
				chartVisiable: false,
				chartVisiable1: false,
				chartVisiable2: false,
				chartVisiable3: false,
				chartVisiable4: false,
				chartVisiable5: false,
				addOrUpdateFlag:false,
				layouts: ["total","prev","pager","next","sizes","jumper"],
			};
		},
		created() {
			this.init();
			this.getDataList();
			this.contentStyleChange()
		},
		mounted() {
		},
		filters: {
			htmlfilter: function (val) {
				return val.replace(/<[^>]*>/g).replace(/undefined/g,'');
			}
		},
		computed: {
			tablename(){
				return this.$storage.get('sessionTable')
			},
		},
		components: {
			AddOrUpdate,
		},
		methods: {
			contentStyleChange() {
				this.contentPageStyleChange()
			},
			// 分页
			contentPageStyleChange(){
				let arr = []

				// if(this.contents.pageTotal) arr.push('total')
				// if(this.contents.pageSizes) arr.push('sizes')
				// if(this.contents.pagePrevNext){
				//   arr.push('prev')
				//   if(this.contents.pagePager) arr.push('pager')
				//   arr.push('next')
				// }
				// if(this.contents.pageJumper) arr.push('jumper')
				// this.layouts = arr.join()
				// this.contents.pageEachNum = 10
			},


//统计接口
    chartDialog1() {
      this.chartVisiable1 = !this.chartVisiable1;
      this.$nextTick(()=>{
        var xingmingChart1 = echarts.init(document.getElementById("xingmingChart1"),'macarons');
        this.$http({
            url: `fupinxinxi/valueMul/xingming?yColumnNameMul=yuannianshouru,yuankezhipeishouru,xiannianshouru,xiankezhipeishouru`,
            method: "get",
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis1 = [];
                let yAxis1 = [];
                let pArray1 = []
                for(let i=0;i<res[0].length;i++){
                    xAxis1.push(res[0][i].xingming);
                    yAxis1.push(parseFloat((res[0][i].total)));
                    pArray1.push({
                        value: parseFloat((res[0][i].total)),
                        name: res[0][i].xingming
                    })
                }
                let xAxis2 = [];
                let yAxis2 = [];
                let pArray2 = []
                for(let i=0;i<res[1].length;i++){
                    xAxis2.push(res[1][i].xingming);
                    yAxis2.push(parseFloat((res[1][i].total)));
                    pArray2.push({
                        value: parseFloat((res[1][i].total)),
                        name: res[1][i].xingming
                    })
                }
                let xAxis3 = [];
                let yAxis3 = [];
                let pArray3 = []
                for(let i=0;i<res[2].length;i++){
                    xAxis3.push(res[2][i].xingming);
                    yAxis3.push(parseFloat((res[2][i].total)));
                    pArray3.push({
                        value: parseFloat((res[2][i].total)),
                        name: res[2][i].xingming
                    })
                }
                let xAxis4 = [];
                let yAxis4 = [];
                let pArray4 = []
                for(let i=0;i<res[3].length;i++){
                    xAxis4.push(res[3][i].xingming);
                    yAxis4.push(parseFloat((res[3][i].total)));
                    pArray4.push({
                        value: parseFloat((res[3][i].total)),
                        name: res[3][i].xingming
                    })
                }
                var option = {};
                option = {
                    title: {
                        left: 'left'
                    },
                    legend: {
                        data: [
							'原年收入',
							'原可支配收入',
							'现年收入',
							'现可支配收入',
						]
                    },
                    tooltip: {
                      trigger: 'axis',
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: xAxis1
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                    {
                        data: yAxis1,
                        type: 'line',
                        name: '原年收入',
                    },
                    {
                        data: yAxis2,
                        type: 'line',
                        name: '原可支配收入',
                    },
                    {
                        data: yAxis3,
                        type: 'line',
                        name: '现年收入',
                    },
                    {
                        data: yAxis4,
                        type: 'line',
                        name: '现可支配收入',
                    },
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                xingmingChart1.setOption(option);
                  //根据窗口的大小变动图表
                window.onresize = function() {
                    xingmingChart1.resize();
                };
            }
        });
      })
    },

//统计接口
    chartDialog2() {
      this.chartVisiable2 = !this.chartVisiable2;
      this.$nextTick(()=>{

        var pinkundengjiChart2 = echarts.init(document.getElementById("pinkundengjiChart2"),'macarons');
        this.$http({
            url: "fupinxinxi/group/pinkundengji",
            method: "get",
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis = [];
                let yAxis = [];
                let pArray = []
                for(let i=0;i<res.length;i++){
                    xAxis.push(res[i].pinkundengji);
                    yAxis.push(parseFloat((res[i].total)));
                    pArray.push({
                        value: parseFloat((res[i].total)),
                        name: res[i].pinkundengji
                    })
                }
                var option = {};
                option = {
                    title: {
                        text: '贫困等级统计',
                        left: 'center'
                    },
                    tooltip: {
                      trigger: 'item',
                      formatter: '{b} : {c}'
                    },
                    xAxis: {
                        type: 'category',
                        data: xAxis,
                        axisLabel : {
                            rotate:40
                        }
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: yAxis,
                        type: 'bar'
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                pinkundengjiChart2.setOption(option);
                  //根据窗口的大小变动图表
                window.onresize = function() {
                    pinkundengjiChart2.resize();
                };
            }
        });
      })
    },

//统计接口
    chartDialog3() {
      this.chartVisiable3 = !this.chartVisiable3;
      this.$nextTick(()=>{

        var fupinzhengceChart3 = echarts.init(document.getElementById("fupinzhengceChart3"),'macarons');
        this.$http({
            url: "fupinxinxi/group/fupinzhengce",
            method: "get",
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis = [];
                let yAxis = [];
                let pArray = []
                for(let i=0;i<res.length;i++){
                    xAxis.push(res[i].fupinzhengce);
                    yAxis.push(parseFloat((res[i].total)));
                    pArray.push({
                        value: parseFloat((res[i].total)),
                        name: res[i].fupinzhengce
                    })
                }
                var option = {};
                option = {
                        title: {
                            text: '帮扶政策统计',
                            left: 'center'
                        },
                        legend: {
                          orient: 'vertical',
                          left: 'left'
                        },
                        tooltip: {
                          trigger: 'item',
                          formatter: '{b} : {c} ({d}%)'
                        },
                        series: [
                            {
                                type: 'pie',
                                radius: ['25%', '55%'],
                                center: ['50%', '60%'],
                                data: pArray,
                                emphasis: {
                                    itemStyle: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                };
                // 使用刚指定的配置项和数据显示图表。
                fupinzhengceChart3.setOption(option);
                  //根据窗口的大小变动图表
                window.onresize = function() {
                    fupinzhengceChart3.resize();
                };
            }
        });
      })
    },

//统计接口
    chartDialog4() {
      this.chartVisiable4 = !this.chartVisiable4;
      this.$nextTick(()=>{

        var fupinjieguoChart4 = echarts.init(document.getElementById("fupinjieguoChart4"),'macarons');
        this.$http({
            url: "fupinxinxi/group/fupinjieguo",
            method: "get",
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis = [];
                let yAxis = [];
                let pArray = []
                for(let i=0;i<res.length;i++){
                    xAxis.push(res[i].fupinjieguo);
                    yAxis.push(parseFloat((res[i].total)));
                    pArray.push({
                        value: parseFloat((res[i].total)),
                        name: res[i].fupinjieguo
                    })
                }
                var option = {};
				for (let x = 0; x < 8; x++) {
					pArray[x] = Object.assign(pArray[x], {
						title: {
							offsetCenter: [String((-140 + (x) * 40) + '%'), '80%']
						},
						detail: {
							offsetCenter: [String((-140 + (x) * 40) + '%'), '95%']
						}
					})
				}
				option = {
					title: {
					    text: '帮扶结果统计',
					    left: 'center',
					    top: 'top'
					},
					series: [{
						type: 'gauge',
						anchor: {
							show: true,
							showAbove: true,
							size: 18,
							itemStyle: {
								color: 'inherit'
							}
						},
						pointer: {
							icon: 'path://M2.9,0.7L2.9,0.7c1.4,0,2.6,1.2,2.6,2.6v115c0,1.4-1.2,2.6-2.6,2.6l0,0c-1.4,0-2.6-1.2-2.6-2.6V3.3C0.3,1.9,1.4,0.7,2.9,0.7z',
							width: 8,
							length: '80%',
							offsetCenter: [0, '10%']
						},
						progress: {
							show: true,
							overlap: true,
							roundCap: true
						},
						axisLine: {
							roundCap: true
						},
						data: pArray,
						title: {
							fontSize: 14
						},
						splitNumber: 25,
						animation: true,
						emphasis: {
							disabled: false
						},
						axisLine: {
							roundCap: true,
							lineStyle:{
								shadowColor: '#000',
								shadowBlur: 1,
								shadowOffsetX: 0,
								shadowOffsetY: 0,
								opacity: 0.5
							}
						},
						detail: {
							width: 40,
							height: 14,
							fontSize: 14,
							color: '#fff',
							backgroundColor: 'inherit',
							borderRadius: 3,
							formatter: '{value}'
						}
					}]
				}
                // 使用刚指定的配置项和数据显示图表。
                fupinjieguoChart4.setOption(option);
                  //根据窗口的大小变动图表
                window.onresize = function() {
                    fupinjieguoChart4.resize();
                };
            }
        });
      })
    },

//统计接口
    chartDialog5() {
      this.chartVisiable5 = !this.chartVisiable5;
      this.$nextTick(()=>{
        // sheng sheng
        //  chengyuanshuliang

		echarts.registerMap("china", chinaJson);
        var chengyuanshuliangChart5 = echarts.init(document.getElementById("chengyuanshuliangChart5"),'macarons');
        this.$http({
            url: `fupinxinxi/value/sheng/chengyuanshuliang`,
            method: "get",
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis = [];
                let yAxis = [];
                let pArray = []
                for(let i=0;i<res.length;i++){
                    xAxis.push(res[i].sheng);
                    yAxis.push(parseFloat((res[i].total)));
                    pArray.push({
                        value: parseFloat((res[i].total)),
                        name: res[i].sheng
                    })
                }
                var option = {};
				option = {
					backgroundColor: "transparent",
					title: {
						text: '贫困人数统计',
						left: "center",
					},
					tooltip: {
						trigger: "item",
						formatter: "{b}<br/>{c} "
					},
					visualMap: {
						min: 0,
						max: 100,
						text: ['High', 'Low'],
						calculable: true,
						seriesIndex: [0], //这个对应的是series的数组下标
						inRange: {
							color: ["#00467F", "#A5CC82"]
						}
					},
					//series就是地图上的数据（去掉就没有数据了）
					series: [{
						type: "map",
						map: 'china',
						geoIndex: 0,
						aspectScale: 0.75, //长宽比
						showLegendSymbol: false, // 存在legend时显示
						label: {
							normal: {
								show: true
							},
							emphasis: {
								show: false,
								textStyle: {
									color: "#fff"
								}
							}
						},
						roam: true,
						animation: false,
						data: pArray
					}, ]
				}
                // 使用刚指定的配置项和数据显示图表。
                chengyuanshuliangChart5.setOption(option);
                  //根据窗口的大小变动图表
                window.onresize = function() {
                    chengyuanshuliangChart5.resize();
                };
            }
        });
      })
    },
    init () {
          this.xingbieOptions = "男,女".split(',')
          this.$http({
            url: `option/sheng/sheng`,
            method: "get"
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.shengOptions = data.data;
            } else {
              this.$message.error(data.msg);
            }
          });
          this.pinkundengjiOptions = "极度贫困,严重困难,中度贫困,一般贫困,边缘贫困".split(',')
          this.$http({
            url: `option/fupinzhengce/fupinzhengce`,
            method: "get"
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.fupinzhengceOptions = data.data;
            } else {
              this.$message.error(data.msg);
            }
          });
          this.fupinjieguoOptions = "已脱贫,未脱贫".split(',')
    },
    search() {
      this.pageIndex = 1;
      this.getDataList();
    },

    // 获取数据列表
    getDataList() {
      this.dataListLoading = true;
      let params = {
        page: this.pageIndex,
        limit: this.pageSize,
        sort: 'id',
        order: 'desc',
      }
           if(this.searchForm.xingming!='' && this.searchForm.xingming!=undefined){
            params['xingming'] = '%' + this.searchForm.xingming + '%'
          }
           if(this.searchForm.xingbie!='' && this.searchForm.xingbie!=undefined){
            params['xingbie'] = this.searchForm.xingbie
          }
           if(this.searchForm.sheng!='' && this.searchForm.sheng!=undefined){
            params['sheng'] = this.searchForm.sheng
          }
    params['sort'] = 'kezhipeizhanbi';
    params['order'] = 'desc';
           if(this.searchForm.pinkundengji!='' && this.searchForm.pinkundengji!=undefined){
            params['pinkundengji'] = this.searchForm.pinkundengji
          }
           if(this.searchForm.fupinzhengce!='' && this.searchForm.fupinzhengce!=undefined){
            params['fupinzhengce'] = this.searchForm.fupinzhengce
          }
           if(this.searchForm.fupinjieguo!='' && this.searchForm.fupinjieguo!=undefined){
            params['fupinjieguo'] = this.searchForm.fupinjieguo
          }
			this.$http({
				url: "fupinxinxi/page",
				method: "get",
				params: params
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.dataList = data.data.list;
					this.totalPage = data.data.total;
				} else {
					this.dataList = [];
					this.totalPage = 0;
				}
				this.dataListLoading = false;
			});
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val;
      this.pageIndex = 1;
      this.getDataList();
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val;
      this.getDataList();
    },
    // 多选
    selectionChangeHandler(val) {
      this.dataListSelections = val;
    },
    // 添加/修改
    addOrUpdateHandler(id,type) {
      this.showFlag = false;
      this.addOrUpdateFlag = true;
      this.crossAddOrUpdateFlag = false;
      if(type!='info'){
        type = 'else';
      }
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id,type);
      });
    },
    importChange(){
        this.importHandler()
        this.getDataList()
    },
    importClcik() {
        this.importVis = true
    },
    importSuccess(e) {
        if(e.code==0){
            this.$message.success('上传成功');
            this.importVis = false
            
        }
    },
    importHandler() {
        this.importVisiable = !this.importVisiable;
    },
    // 下载
    download(file){
      let arr = file.replace(new RegExp('upload/', "g"), "")
      axios.get(this.$base.url + 'file/download?fileName=' + arr, {
      	headers: {
      		token: this.$storage.get('Token')
      	},
      	responseType: "blob"
      }).then(({
      	data
      }) => {
      	const binaryData = [];
      	binaryData.push(data);
      	const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
      		type: 'application/pdf;chartset=UTF-8'
      	}))
      	const a = document.createElement('a')
      	a.href = objectUrl
      	a.download = arr
      	// a.click()
      	// 下面这个写法兼容火狐
      	a.dispatchEvent(new MouseEvent('click', {
      		bubbles: true,
      		cancelable: true,
      		view: window
      	}))
      	window.URL.revokeObjectURL(data)
      },err=>{
		  axios.get((location.href.split(this.$base.name).length>1 ? location.href.split(this.$base.name)[0] :'') + this.$base.name + '/file/download?fileName=' + arr, {
		  	headers: {
		  		token: this.$storage.get('Token')
		  	},
		  	responseType: "blob"
		  }).then(({
		  	data
		  }) => {
		  	const binaryData = [];
		  	binaryData.push(data);
		  	const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
		  		type: 'application/pdf;chartset=UTF-8'
		  	}))
		  	const a = document.createElement('a')
		  	a.href = objectUrl
		  	a.download = arr
		  	// a.click()
		  	// 下面这个写法兼容火狐
		  	a.dispatchEvent(new MouseEvent('click', {
		  		bubbles: true,
		  		cancelable: true,
		  		view: window
		  	}))
		  	window.URL.revokeObjectURL(data)
		  })
	  })
    },
	// 预览
	preClick(file){
		if(!file){
			return false
		}
		window.open((location.href.split(this.$base.name).length>1 ? location.href.split(this.$base.name)[0] + this.$base.name + '/' + file :this.$base.url + file))
	},
	fupinxinxistatusChange(e,row){
		if(row.status==0){
			row.passwordwrongnum = 0
		}
		this.$http({
			url:'fupinxinxi/update',
			method:'post',
			data:row
		}).then(res=>{
			if(row.status==1){
				this.$message.error('该用户已锁定')
			}else{
				this.$message.success('该用户已解除锁定')
			}
		})
	},
    // 删除
    deleteHandler(id ) {
      var ids = id
        ? [Number(id)]
        : this.dataListSelections.map(item => {
            return Number(item.id);
          });
      this.$confirm(`确定进行[${id ? "删除" : "批量删除"}]操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "fupinxinxi/delete",
          method: "post",
          data: ids
        }).then(({ data }) => {
          if (data && data.code === 0) {
			this.$message({
			  message: "操作成功",
			  type: "success",
			  duration: 1500,
			  onClose: () => {
			    this.search();
			  }
			});
            
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    },


  }

};
</script>
<style lang="scss" scoped>
	
	.center-form-pv {
	  .el-date-editor.el-input {
	    width: auto;
	  }
	}
	
	.el-input {
	  width: auto;
	}
	
	// form
	.center-form-pv .el-input /deep/ .el-input__inner {
				border: 2px solid #c9d0dc;
				border-radius: 20px;
				padding: 0 12px;
				color: #8696b0;
				width: 170px;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .el-select /deep/ .el-input__inner {
				border: 2px solid #c9d0dc;
				border-radius: 20px;
				padding: 0 10px;
				outline: none;
				color: #8696b0;
				width: 170px;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .el-date-editor /deep/ .el-input__inner {
				border: 2px solid #c9d0dc;
				border-radius: 20px;
				padding: 0 10px 0 30px;
				outline: none;
				color: #8696b0;
				width: 170px;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .search {
				border: 2px solid #3388cb;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				outline: none;
				color: #fff;
				background: #3388cb;
				width: auto;
				font-size: 16px;
				height: 40px;
			}
	
	.center-form-pv .search:hover {
				opacity: 0.8;
			}
	
	.center-form-pv .actions .add {
				border: 2px solid #d4d8df;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #8e9db5;
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .actions .add:hover {
				color: #3388cb;
				border-color: #3388cb;
			}
	
	.center-form-pv .actions .del {
				border: 1px solid #d4d8df;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #8e9db5;
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .actions .del:hover {
				border: 1px solid #3388cb;
				color: #3388cb;
			}
	
	.center-form-pv .actions .statis {
				border: 1px solid #d4d8df;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #9ca9be;
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .actions .statis:hover {
				border: 1px solid #3388cb;
				color: #3388cb;
			}
	
	.center-form-pv .actions .btn18 {
				border: 2px solid #d4d8df;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: #8b9ab3;
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .actions .btn18:hover {
				border: 1px solid #3388cb;
				color: #3388cb;
			}
	
	// table
	.el-table /deep/ .el-table__header-wrapper thead {
				color: #999;
				background: red;
				font-weight: 500;
				width: 100%;
			}
	
	.el-table /deep/ .el-table__header-wrapper thead tr {
				background: #eef3f7;
			}
	
	.el-table /deep/ .el-table__header-wrapper thead tr th {
				padding: 6px 0;
				color: #808080;
				background: #eef3f7;
				font-weight: normal;
				border-color: #eee;
				border-width: 1px 0;
				border-style: solid;
				text-align: left;
			}

	.el-table /deep/ .el-table__header-wrapper thead tr th .cell {
				padding: 0 10px;
				word-wrap: normal;
				word-break: break-all;
				white-space: normal;
				font-weight: bold;
				display: inline-block;
				vertical-align: middle;
				width: 100%;
				line-height: 24px;
				position: relative;
				text-overflow: ellipsis;
			}

	
	.el-table /deep/ .el-table__body-wrapper tbody {
				width: 100%;
			}

	.el-table /deep/ .el-table__body-wrapper tbody tr {
				background: #fff;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td {
				padding: 4px 0;
				color: #999;
				background: #fff;
				border-color: #eee;
				border-width: 1px 0;
				border-style: solid;
				text-align: left;
			}
	
		
	.el-table /deep/ .el-table__body-wrapper tbody tr:hover td {
				padding: 4px 0;
				color: #444;
				background: #f6f6f6;
				border-color: #eee;
				border-width: 1px 0;
				border-style: solid;
				text-align: left;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td {
				padding: 4px 0;
				color: #999;
				background: #fff;
				border-color: #eee;
				border-width: 1px 0;
				border-style: solid;
				text-align: left;
			}

	.el-table /deep/ .el-table__body-wrapper tbody tr td .cell {
				padding: 0 10px;
				overflow: hidden;
				word-break: break-all;
				white-space: normal;
				line-height: 24px;
				text-overflow: ellipsis;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .view {
				border: 2px solid rgb(212, 216, 223);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 5px;
				margin: 0 5px 5px 0;
				outline: none;
				color: rgb(139, 154, 179);
				background: rgb(255, 255, 255);
				width: auto;
				font-size: 14px;
				height: 32px;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .view:hover {
				border: 1px solid #409eff;
				color: #409eff;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .add {
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .add:hover {
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .edit {
				border: 2px solid rgb(212, 216, 223);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 5px;
				margin: 0 5px 5px 0;
				outline: none;
				color: rgb(139, 154, 179);
				background: rgb(255, 255, 255);
				width: auto;
				font-size: 14px;
				height: 32px;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .edit:hover {
				border: 1px solid #409eff;
				color: #409eff;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .del {
				border: 2px solid rgb(212, 216, 223);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 5px;
				margin: 0 5px 5px 0;
				outline: none;
				color: rgb(139, 154, 179);
				background: rgb(255, 255, 255);
				width: auto;
				font-size: 14px;
				height: 32px;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .del:hover {
				border: 1px solid #409eff;
				color:  #409eff;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .btn8 {
				border: 2px solid rgb(212, 216, 223);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 5px;
				margin: 0 5px 5px 0;
				outline: none;
				color: rgb(139, 154, 179);
				background: rgb(255, 255, 255);
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .btn8:hover {
				border: 1px solid #409eff;
				color: #409eff;
			}
	
	// pagination
	.main-content .el-pagination /deep/ .el-pagination__total {
				margin: 0 10px 0 0;
				color: #666;
				font-weight: 400;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .btn-prev {
				border: none;
				border-radius: 2px;
				padding: 0;
				margin: 0 5px;
				color: #666;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				min-width: 35px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .btn-next {
				border: none;
				border-radius: 2px;
				padding: 0;
				margin: 0 5px;
				color: #666;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				min-width: 35px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .btn-prev:disabled {
				border: none;
				cursor: not-allowed;
				border-radius: 2px;
				padding: 0;
				margin: 0 5px;
				color: #C0C4CC;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .btn-next:disabled {
				border: none;
				cursor: not-allowed;
				border-radius: 2px;
				padding: 0;
				margin: 0 5px;
				color: #C0C4CC;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}

	.main-content .el-pagination /deep/ .el-pager {
				padding: 0;
				margin: 0;
				display: inline-block;
				vertical-align: top;
			}

	.main-content .el-pagination /deep/ .el-pager .number {
				cursor: pointer;
				padding: 0 4px;
				margin: 0 5px;
				color: #666;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 2px;
				background: #f4f4f5;
				text-align: center;
				min-width: 30px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .el-pager .number:hover {
				cursor: pointer;
				padding: 0 4px;
				margin: 0 5px;
				color: #409EFF;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 2px;
				background: #f4f4f5;
				text-align: center;
				min-width: 30px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .el-pager .number.active {
				cursor: default;
				padding: 0 4px;
				margin: 0 5px;
				color: #FFF;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 2px;
				background: #2964af;
				text-align: center;
				min-width: 30px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes {
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input {
				margin: 0 5px;
				width: 100px;
				position: relative;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__inner {
				border: 1px solid #DCDFE6;
				cursor: pointer;
				padding: 0 25px 0 8px;
				color: #606266;
				display: inline-block;
				font-size: 13px;
				line-height: 28px;
				border-radius: 3px;
				outline: 0;
				background: #FFF;
				width: 100%;
				text-align: center;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input span.el-input__suffix {
				top: 0;
				position: absolute;
				right: 0;
				height: 100%;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__suffix .el-select__caret {
				cursor: pointer;
				color: #C0C4CC;
				width: 25px;
				font-size: 14px;
				line-height: 28px;
				text-align: center;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__jump {
				margin: 0 0 0 24px;
				color: #606266;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__jump .el-input {
				border-radius: 3px;
				padding: 0 2px;
				margin: 0 2px;
				display: inline-block;
				width: 50px;
				font-size: 14px;
				line-height: 18px;
				position: relative;
				text-align: center;
				height: 28px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__jump .el-input .el-input__inner {
				border: 1px solid #DCDFE6;
				cursor: pointer;
				padding: 0 3px;
				color: #606266;
				display: inline-block;
				font-size: 14px;
				line-height: 28px;
				border-radius: 3px;
				outline: 0;
				background: #FFF;
				width: 100%;
				text-align: center;
				height: 28px;
			}
	
	// list one
	.one .list1-view {
				border:  2px solid rgb(212, 216, 223);
				cursor: pointer;
				border-radius: 4px;
				padding: 0 15px;
				margin: 0;
				outline: none;
				color: rgb(142, 157, 181);
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.one .list1-view:hover {
				border: 1px solid #2b68b5;
				color: #2b68b5;
			}
	
	.one .list1-edit {
				border: 1px solid rgb(212, 216, 223)  ;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 15px;
				margin: 0;
				outline: none;
				color:  rgb(142, 157, 181);
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.one .list1-edit:hover {
				border: 1px solid #2b68b5;
				color: #2b68b5;
			}
	
	.one .list1-del {
				border: 1px solid rgb(212, 216, 223)  ;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 15px;
				margin: 0;
				outline: none;
				color: rgb(142, 157, 181);
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.one .list1-del:hover {
				border: 1px solid #2b68b5;
				color:  #2b68b5;
			}
	
	.one .list1-btn8 {
				border: 1px solid rgb(212, 216, 223)  ;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				margin: 4px;
				outline: none;
				color: rgb(142, 157, 181);
				background: #fff;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
	
	.one .list1-btn8:hover {
				border: 1px solid #2b68b5;
				color: #2b68b5;
			}
	
	.main-content .el-table .el-switch {
				display: inline-flex;
				vertical-align: middle;
				line-height: 30px;
				position: relative;
				align-items: center;
				height: 30px;
			}
	.main-content .el-table .el-switch /deep/ .el-switch__label--left {
				cursor: pointer;
				margin: 0 10px 0 0;
				color: #333;
				font-weight: 500;
				display: inline-block;
				vertical-align: middle;
				font-size: 16px;
				transition: .2s;
				height: 30px;
			}
	.main-content .el-table .el-switch /deep/ .el-switch__label--right {
				cursor: pointer;
				margin: 0 0 0 10px;
				color: #333;
				font-weight: 500;
				display: inline-block;
				vertical-align: middle;
				font-size: 16px;
				transition: .2s;
				height: 30px;
			}
	.main-content .el-table .el-switch /deep/ .el-switch__core {
				border: 1px solid #2964af;
				cursor: pointer;
				border-radius: 15px;
				margin: 0;
				outline: 0;
				background: #2964af;
				display: inline-block;
				width: 60px;
				box-sizing: border-box;
				transition: border-color .3s,background-color .3s;
				height: 30px;
			}
	.main-content .el-table .el-switch /deep/ .el-switch__core::after {
				border-radius: 100%;
				top: 1px;
				left: 1px;
				background: #FFF;
				width: 26px;
				position: absolute;
				transition: all .3s;
				height: 26px;
			}
	.main-content .el-table .el-switch.is-checked /deep/ .el-switch__core::after {
				margin: 0 0 0 -27px;
				left: 100%;
			}
	
	.main-content .el-table .el-rate /deep/ .el-rate__item {
				cursor: pointer;
				display: inline-block;
				vertical-align: middle;
				font-size: 0;
				position: relative;
			}
	.main-content .el-table .el-rate /deep/ .el-rate__item .el-rate__icon {
				margin: 0 3px;
				display: inline-block;
				font-size: 18px;
				position: relative;
				transition: .3s;
			}
</style>
