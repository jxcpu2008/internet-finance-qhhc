/*
==============================================
      jQuery formatDigit
==============================================

Made by Bille Feng

fengzebiao160.sz.cn.com/animations/

excel_design@163.com

==============================================
*/
;(function($)
{
    $.extend({
        formatDigit:function(val, decimal){
            var digit = 0.00;//��ʱ����
            var dec = 0;//С������
            var int = 0;//��������
            var buffer = new Array(); //�������
            var positive = true; //��������ֵ���(true:����)
            /**
             * ��������ַ�����������0
             * <li>�հ�����</li>
             * @param int num ֵ
             * @param int len ����ĳ���
             */
            function importZero(num, len){
                var str = num.toString();
                var sbuffer = new Array();
                for(var i=0,iLoop=len-str.length; i<iLoop; i++)
                    sbuffer.push('0');
                sbuffer.push(str);
                return sbuffer.join('');
            };

            if (typeof(decimal) === 'undefined')
                decimal = 2;
            positive = (val >= 0);//ȡ��������
            digit = (isNaN(digit = parseFloat(val))) ? 0 : Math.abs(digit);//ǿ��ת��Ϊ����ֵ������
            //��������������������
            int = parseInt(digit); //������������
            dec = parseInt((digit - int) * Math.pow(10,decimal) + 0.5); //����С������(��������)

            do{
                buffer.unshift(importZero(int % 1000, 3));
            }while((int = parseInt(int/1000)));
            buffer[0] = parseInt(buffer[0]).toString();//��߶���ȥ��ǰ��0
            return ((positive)?'':'-') + buffer.join(',') +'.'+ ((0 === dec)?'00':importZero(dec, decimal));
        },
        unformatMoney:function(data){
            var digit = parseFloat(data.replace(/,/g, ''));
            return (isNaN(digit) ? 0 : digit);
        },
    });
})(jQuery);

function fixed(n){
	n = n+"";
	if(n.indexOf(".")==-1){
		return n+".0";
	}else{
		return n.substr(0, n.indexOf(".")+2);
	}
}