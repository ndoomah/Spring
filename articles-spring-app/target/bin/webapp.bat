@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\com\sun\faces\jsf-api\2.2.7\jsf-api-2.2.7.jar;"%REPO%"\com\sun\faces\jsf-impl\2.2.7\jsf-impl-2.2.7.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-servlet\2.0.12.Final\rewrite-servlet-2.0.12.Final.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-config-prettyfaces\2.0.12.Final\rewrite-config-prettyfaces-2.0.12.Final.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-annotations-impl\2.0.12.Final\rewrite-annotations-impl-2.0.12.Final.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-api\2.0.12.Final\rewrite-api-2.0.12.Final.jar;"%REPO%"\org\ocpsoft\common\common-api\1.0.5.Final\common-api-1.0.5.Final.jar;"%REPO%"\org\ocpsoft\logging\logging-api\1.0.2.Final\logging-api-1.0.2.Final.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-api-servlet\2.0.12.Final\rewrite-api-servlet-2.0.12.Final.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-addressbuilder\2.0.12.Final\rewrite-addressbuilder-2.0.12.Final.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-annotations-api\2.0.12.Final\rewrite-annotations-api-2.0.12.Final.jar;"%REPO%"\org\ocpsoft\rewrite\rewrite-integration-faces\2.0.12.Final\rewrite-integration-faces-2.0.12.Final.jar;"%REPO%"\org\springframework\spring-webmvc\4.2.0.RELEASE\spring-webmvc-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\4.2.0.RELEASE\spring-beans-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\spring-context\4.2.0.RELEASE\spring-context-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\4.2.0.RELEASE\spring-expression-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\spring-core\4.2.0.RELEASE\spring-core-4.2.0.RELEASE.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\org\springframework\spring-web\4.2.0.RELEASE\spring-web-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\4.2.0.RELEASE\spring-aop-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\data\spring-data-jpa\1.5.2.RELEASE\spring-data-jpa-1.5.2.RELEASE.jar;"%REPO%"\org\springframework\data\spring-data-commons\1.7.2.RELEASE\spring-data-commons-1.7.2.RELEASE.jar;"%REPO%"\org\springframework\spring-orm\4.0.3.RELEASE\spring-orm-4.0.3.RELEASE.jar;"%REPO%"\org\springframework\spring-jdbc\4.0.3.RELEASE\spring-jdbc-4.0.3.RELEASE.jar;"%REPO%"\org\springframework\spring-tx\4.0.3.RELEASE\spring-tx-4.0.3.RELEASE.jar;"%REPO%"\org\aspectj\aspectjrt\1.7.4\aspectjrt-1.7.4.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.6\slf4j-api-1.7.6.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.6\jcl-over-slf4j-1.7.6.jar;"%REPO%"\org\springframework\webflow\spring-faces\2.4.2.RELEASE\spring-faces-2.4.2.RELEASE.jar;"%REPO%"\org\springframework\webflow\spring-binding\2.4.2.RELEASE\spring-binding-2.4.2.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-web\4.2.0.RELEASE\spring-security-web-4.2.0.RELEASE.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\springframework\security\spring-security-config\4.2.0.RELEASE\spring-security-config-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-core\4.2.0.RELEASE\spring-security-core-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\spring-test\4.2.0.RELEASE\spring-test-4.2.0.RELEASE.jar;"%REPO%"\org\apache\logging\log4j\log4j-api\2.10.0\log4j-api-2.10.0.jar;"%REPO%"\org\apache\logging\log4j\log4j-core\2.10.0\log4j-core-2.10.0.jar;"%REPO%"\org\apache\logging\log4j\log4j-slf4j-impl\2.10.0\log4j-slf4j-impl-2.10.0.jar;"%REPO%"\org\apache\logging\log4j\log4j-jul\2.10.0\log4j-jul-2.10.0.jar;"%REPO%"\org\hibernate\javax\persistence\hibernate-jpa-2.0-api\1.0.0.Final\hibernate-jpa-2.0-api-1.0.0.Final.jar;"%REPO%"\org\hibernate\hibernate-entitymanager\3.6.7.Final\hibernate-entitymanager-3.6.7.Final.jar;"%REPO%"\org\hibernate\hibernate-core\3.6.7.Final\hibernate-core-3.6.7.Final.jar;"%REPO%"\antlr\antlr\2.7.6\antlr-2.7.6.jar;"%REPO%"\commons-collections\commons-collections\3.1\commons-collections-3.1.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\org\hibernate\hibernate-commons-annotations\3.2.0.Final\hibernate-commons-annotations-3.2.0.Final.jar;"%REPO%"\javax\transaction\jta\1.1\jta-1.1.jar;"%REPO%"\cglib\cglib\2.2\cglib-2.2.jar;"%REPO%"\asm\asm\3.1\asm-3.1.jar;"%REPO%"\javassist\javassist\3.12.0.GA\javassist-3.12.0.GA.jar;"%REPO%"\org\hibernate\hibernate-validator\4.3.1.Final\hibernate-validator-4.3.1.Final.jar;"%REPO%"\javax\validation\validation-api\1.0.0.GA\validation-api-1.0.0.GA.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.1.0.CR2\jboss-logging-3.1.0.CR2.jar;"%REPO%"\org\primefaces\primefaces\7.0\primefaces-7.0.jar;"%REPO%"\com\google\guava\guava\10.0.1\guava-10.0.1.jar;"%REPO%"\com\google\code\findbugs\jsr305\1.3.9\jsr305-1.3.9.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.0.28\tomcat-embed-core-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\8.0.28\tomcat-embed-logging-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.0.28\tomcat-embed-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.0.28\tomcat-embed-el-8.0.28.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.4.2\ecj-4.4.2.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.0.28\tomcat-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.0.28\tomcat-servlet-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.0.28\tomcat-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.0.28\tomcat-el-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.0.28\tomcat-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.0.28\tomcat-util-scan-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.0.28\tomcat-util-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.0.28\tomcat-jasper-el-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.0.28\tomcat-jsp-api-8.0.28.jar;"%REPO%"\org\jboss\el\jboss-el\2.0.1.GA\jboss-el-2.0.1.GA.jar;"%REPO%"\org\postgresql\postgresql\9.3-1100-jdbc41\postgresql-9.3-1100-jdbc41.jar;"%REPO%"\org\springframework\webflow\spring-webflow\2.4.2.RELEASE\spring-webflow-2.4.2.RELEASE.jar;"%REPO%"\opensymphony\ognl\2.6.11\ognl-2.6.11.jar;"%REPO%"\org\springframework\webflow\spring-js\2.4.2.RELEASE\spring-js-2.4.2.RELEASE.jar;"%REPO%"\org\springframework\webflow\spring-js-resources\2.4.2.RELEASE\spring-js-resources-2.4.2.RELEASE.jar;"%REPO%"\org\primefaces\themes\cruze\1.0.10\cruze-1.0.10.jar;"%REPO%"\br\com\crud_example_jsf_spring_hibernate_jpa_postgres\articles\0.0.1-SNAPSHOT\articles-0.0.1-SNAPSHOT.war
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
