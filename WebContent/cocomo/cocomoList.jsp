<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">估算信息</h4>
</div>
<div class="modal-body">
	<div id="applicationComposition">
		<h3>应用组装子模型</h3>
		<div class="estimationResult">
			<p>
				对象点数：
				<s:property value="applicationComposition.nop" />
				个
			</p>
			<p>
				工作量：
				<s:property value="applicationComposition.effort" />
				月
			</p>
			<p>
				成本：
				<s:property value="applicationComposition.cost" />
				万元
			</p>
		</div>
	</div>
	<div id="earlyDesign">
		<h3>早期设计子模型</h3>
		<div class="estimationResult">
			<p>
				工作量：
				<s:property value="earlyDesign.effort" />
				月
			</p>
			<p>
				工期：
				<s:property value="earlyDesign.duration" />
				个
			</p>
			<p>
				成本：
				<s:property value="earlyDesign.cost" />
				万元
			</p>
		</div>
		</div>
		<div id="postArchitecture">
			<h3>后体系架构子模型</h3>
			<div class="estimationResult">
				<p>
					工作量：
					<s:property value="postArchitecture.effort" />
					月
				</p>
				<p>
					工期：
					<s:property value="postArchitecture.duration" />
					个
				</p>
				<p>
					成本：
					<s:property value="postArchitecture.cost" />
					万元
				</p>
			</div>
		</div>
	</div>