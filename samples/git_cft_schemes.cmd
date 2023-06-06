rem **************************************************
rem * Скрипт выгрузки исходных кодов объектов ЦФТ    *
rem * с указанных схем в систему контроля версий Git *
rem * подробности использования параметров смотрите  *
rem * по запуску:                                    *
rem * %JAVA_EXE% -jar %JAR%                          *
rem **************************************************

rem путь к java.exe
set JAVA_EXE="c:\Program Files (x86)\Java\jre1.8.0_65\bin\java.exe"

rem путь к файлу cft-get.jar 
set JAR="c:\cft-get\cft-get.jar"

rem каталог локального хранилища Git
set LOCAL_GIT="Путь/к/локальному/хранилищу/Git/cft_src_git"

rem строка подключения к удаленно-расположенному хранилищу Git
set REMOTE_GIT="git@git.domain.ru:ПОЛЬЗОВАТЕЛЬ/cft_local_src.git"

rem параметры подключенния к схеме которая выступает как мастер ветка
rem формат подключения:
rem	при наличии tnsping.exe и прописанном tns: ПОЛЬЗОВАТЕЛЬ/ПАРОЛЬ@СХЕМА
rem при отсутствии tnsping.exe: ПОЛЬЗОВАТЕЛЬ/ПАРОЛЬ@IP_ХОСТА:ПОРТ:СЕРВИС
set SCHEME_MASTER="ПОЛЬЗОВАТЕЛЬ/ПАРОЛЬ@СХЕМА_ИДЕНТИЧНАЯ_БОЕВОЙ"

rem параметры подключенния к схемам которые выступают как ответвления от мастер веткм
set SCHEME_DEV_1="ПОЛЬЗОВАТЕЛЬ/ПАРОЛЬ@СХЕМА_РАЗРАБОТКИ"

rem путь к приватному ключу SSH который зарегистрирован в удаленно-расположенном хранилище Git
rem как позволяющий изменять содержимое хранилища и делать коммиты
set SSH_KEY="C:/Users/usr1/.ssh/usr1@mail.ru/id_rsa"

rem файл для сохранения лога выполнения программы (путем добавления в файл)
set LOG_FILE="cft_git_log.txt"
cls

rem выполнение самих команд
%JAVA_EXE% -jar %JAR% git -glp %LOCAL_GIT% -sm %SCHEME_MASTER% -grp %REMOTE_GIT% -grk %SSH_KEY% >> %LOG_FILE%
%JAVA_EXE% -jar %JAR% git -glp %LOCAL_GIT% -sm %SCHEME_MASTER% -sb %SCHEME_DEV_1% -grp %REMOTE_GIT% -grk %SSH_KEY% >> %LOG_FILE%

pause
