<#import "/ftl/waffle/i18n.ftl" as i>
<#import "/ftl/waffle/form.ftl" as w>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<head>
    <title><@i.messageFor "dataUpload" "Data Upload"/></title>
</head>
<#include "/ftl/navigation.ftl" parse="true">
<div id="content">
    <form action="${base}/data/upload.action">
    
        <h2><@i.messageFor "dataUpload" "Data Upload"/></h2>    
        
        <div id="actions">
           <fieldset>
                <legend><@i.messageFor "upload" "Upload"/></legend>
                <p><label for="uploadData"><@i.messageFor "uploadData" "Upload Data"/></label></p>
                <p>
					<#list 1..filesToUpload as count>
						<#assign uploadFile= "uploadFile"+ count>
						<@w.file "${uploadFile}" />
    				</#list>  
               	</p>
               	<p>
                    <a class="buttonUpload" onclick="fireMultipartActionMethod('upload');"><@i.messageFor "upload" "Upload"/></a>        
                </p>
            </fieldset>
        </div>

       <#assign errors = controller.errors />
       <#if (errors.size() > 0) >
         <table>
            <th><@i.messageFor "errors" "Errors"/></th>
            <#list errors as error>
                <tr>
                    <td>${error}</td>
                </tr>
            </#list>
         </table>   
       </#if>

	   <#assign uploadedFiles = controller.uploadedFiles />
       <#if (uploadedFiles.size() > 0) >
         <table>
            <th><@i.messageFor "uploadedFiles" "Uploaded Files"/></th>
            <#list uploadedFiles as file>
                <tr>
                    <td>${file.absolutePath}</td>
                </tr>
            </#list>
         </table>   
       </#if>                   
    </form>
</div>
</body>
</html>