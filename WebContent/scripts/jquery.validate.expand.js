/**
 * 自定义jquery validate 方法
 */

jQuery.validator.addMethod("isZipCode", function(value, element) {   
    var tel = /^[0-9]{6}$/;
    return this.optional(element) || (tel.test(value));
}, "请正确填写邮政编码");

jQuery.validator.addMethod("isFax", function(value, element) {
return this.optional(element) || /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
        .test(value);
}, "请正确填写传真号码");

jQuery.validator.addMethod("isPhone",function(value, element) {
    return this.optional(element) || /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
            .test(value);
},"请使用格式:010-88888888");