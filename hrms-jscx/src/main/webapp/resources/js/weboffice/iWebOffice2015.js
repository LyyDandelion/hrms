var str = '';
//var copyright = '金格科技iWebOffice2015智能文档中间件[演示版];V5.0S0xGAAEAAAAAAAAAEAAAAHYBAACAAQAALAAAAMhgYPyhG1JeK32w+MoaJsdQXm18HWUbGpjMu4KXjsDecIGSwVMaepwqsjDH53vbZvAjCfYEjWLCInoMmbAfZhyeikyNJa0go8ItDHo9Wp9O791h7K68woxEV7CrX0HQkrE2Vw32FeR/evBr2XJHlOlsrV1UI/SUbN2VTMclIJrh0qlmvNT4NRrSfXsFM7s2eADGjNRraH03Kf2/T8lyE9Xw3kttPJbcSgkyqSqSzJJdFS5bxIWLkdR7HleoNtXAfSplHtE7qjAgNnyfJw04j1f6jQHW6e75jsKujDrBIJk8R5zTB6pFv2ekPouTiV4LhgvdH7MjRcwzwP93W8zRTUyt/z3/pEYxx+YYPaGN/IVl6zYBEyXIl9yr+Fn48wPaEDLrbJuQTIcQbV0ZnUqPg2Q7FDS9gzX+y7wLHQtsgi2cDuf4SQne9E6IQ0KW29Z0UqCBMAN+L+z0qT0NEGgfLB897ZnvbePB4gkM0A+CrJaWbTM2W/lyQYRh3NjoZBGNvrL/OR3c8ksq/sua1/w2UEA=';
//var copyright='金格科技iWebOffice2015智能文档中间件[演示版];V5.0S0xGAAEAAAAAAAAAEAAAAIEBAACQAQAALAAAAI19jtsurSQJbYZyn4lGvnQwq3Yymb0t54DN+Z6dDjpWEdN4v9sWGIql/6UGzdgh+xUAAEYfzW7YubfR1EB4vFVkGMsqUa9a16gfhIb1YVBQ1cDn0Kx6l9nsUObxWNl4htXW2jysfa8ioiHSnBvFm8YhPqKCdMhXECoPgnSDGGsPCGBTfB5I/t9E2tiv1AFFHMilMrYRCSDrwPpNI2A4rccsG8yB7oc2H5xotd/oDjgKmMmQIoW27aMI9R0kJI7v+hp9gx/wFG/D/i0p3xsAYReFREnjG/kDafiO200qf3/MDtp0ndCV9khpOH0w9I7SUbQaRaw48b0XueLNX1NOAWAoigD24vgygaa4qGEp4sCDtnTeB9/wchf2H6TxZuyZCjjejrAFHbzdyiby2whX/+8b2jOdPlvvooSqw5ltxf8wzhNw7XlLefhtLBbxH9Gw4+2oxtBRYeaaWxLDTucrqITNnbSCCbmhSGOFB3ovCrlRZTJKECSMkGRbyfWpXXA/deiDa5qI57se+fpjPE55beAQg4Jd9FONR8ujXrWy3idx';
var copyright='江苏吴江农村商业银行股份有限公司[专用];V5.0S0xGAAEAAAAAAAAAEAAAAGMBAABwAQAALAAAAOYTRJsNsstfe5W7w92XyItIvh5Y38kBZZ83QEy3wAHeIfLTHX/UP16DAm/MZrk5/oOjAAHBNHlW7ytuyEu25lCbBd5iQz7+NlAwKmuZ2lOVmJVwQfvyAFARxC1Z8FVMDmOTPjsqbOam/7GMetiiuNSRYEYm11yGioKiIcE5V5s2IFLtH+T6KMwK4cp+zf6uFiu/I4CruL464Uvm2gchRkYGj+lRQ18IWSl6b8Br3VZMDa1tM94mA0NydblXKpIr3ykt7giBfhw6H1ScWT4eXrnD8BeE7NgIHmT93FjffH+gBWFahYHpsGHv0tIIyFkKs7PE4qdylcG4Rd/vVv5WQDoA5Z87tIzhbUfX5bYZlz5IYqBuUqCru/HxjbOi70otrtDV98+fbWmc9X6PCWIGnFqyVRu134kHIiDMTfaUL1NfRPXhS1vs5ZcgAqUtqMRg4Vjk6hjdBVxyURbKHOzhD0Z0R8YWdkjaC7TobPNivxGCzEP7gFe4/P1Q3kYqcLifeQ==';
str += '<object id="WebOffice2015" ';

str += ' width="100%"';
str += ' height="100%"';

if ((window.ActiveXObject!=undefined) || (window.ActiveXObject!=null) ||"ActiveXObject" in window)
{
	if(window.navigator.platform == "Win32"){
		str += ' CLASSID="CLSID:D89F482C-5045-4DB5-8C53-D2C9EE71D025"  codebase="iWebOffice2015.cab#version=12.4.0.470"';
	}
	if(window.navigator.platform == "Win64"){
		str += ' CLASSID="CLSID:D89F482C-5045-4DB5-8C53-D2C9EE71D024"  codebase="iWebOffice2015.cab#version=12.4.0.470"';
	}
	str += '>';
	str += '<param name="Copyright" value="' + copyright + '">';
}
else if(navigator.userAgent.indexOf("Chrome") > -1)
{
	alert("走到这里");
	str += ' progid="Kinggrid.iWebOffice"';
	str += ' type="application/kg-activex"';
	str += ' OnCommand="OnCommand"';
	str += ' OnReady="OnReady"';
	str += ' OnOLECommand="OnOLECommand"';
	str += ' OnExecuteScripted="OnExecuteScripted"';
	str += ' OnQuit="OnQuit"';
	str += ' OnSendStart="OnSendStart"';
	str += ' OnSending="OnSending"';
	str += ' OnSendEnd="OnSendEnd"';
	str += ' OnRecvStart="OnRecvStart"';
	str += ' OnRecving="OnRecving"';
	str += ' OnRecvEnd="OnRecvEnd"';
	str += ' OnRightClickedWhenAnnotate="OnRightClickedWhenAnnotate"';
	str += ' OnFullSizeBefore="OnFullSizeBefore"';
	str += ' OnFullSizeAfter="OnFullSizeAfter"';	
	str += ' Copyright="' + copyright + '"';
	str += '>';
}
else
{
	str += ' progid="Kinggrid.iWebOffice"';
	str += ' type="application/iwebplugin"';
	str += ' OnCommand="OnCommand"';
	str += ' OnReady="OnReady"';
	str += ' OnOLECommand="OnOLECommand"';
	str += ' OnExecuteScripted="OnExecuteScripted"';
	str += ' OnQuit="OnQuit"';
	str += ' OnSendStart="OnSendStart"';
	str += ' OnSending="OnSending"';
	str += ' OnSendEnd="OnSendEnd"';
	str += ' OnRecvStart="OnRecvStart"';
	str += ' OnRecving="OnRecving"';
	str += ' OnRecvEnd="OnRecvEnd"';
	str += ' OnRightClickedWhenAnnotate="OnRightClickedWhenAnnotate"';
	str += ' OnFullSizeBefore="OnFullSizeBefore"';
	str += ' OnFullSizeAfter="OnFullSizeAfter"';	
	str += ' Copyright="' + copyright + '"';
	str += '>';
}
str += '</object>';
document.write(str); 