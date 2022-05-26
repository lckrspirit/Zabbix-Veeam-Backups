# Zabbix-Veeam-Backups
Simple mon backup jobs

Простой и возможно не элегантный способ мониторинга бекапов Veeam. 

**Установка:**
  
  Скрипты `BackupJobDiscovery.ps1`, `GetJobState.ps1` переносим куда нибудь на целевой сервер. 
  Далее отредактируем `zabbix_agent.conf`, добавим значения в переменные `UserParameter`:
  
  ```
  Timeout=30
  ..
  
  UserParameter=jobs.discovery,powershell.exe -file "C:\zabbix\scripts\BackupJobDiscovery.ps1"
  UserParameter=job.state[*],powershell.exe -file "C:\zabbix\scripts\GetJobState.ps1" $1
  ```
  
  На стороне zabbix сервера, импортируем шаблон. Далее вешаем его на хост.
  
  ****
  
  `BackupJobDiscovery.ps1` - Дискаверит все задачи задачи в VeeamBackup, и отдает в json-формате. 
  
  `GetJobState.ps1` - Проверяем состояние джобы, если функция возвращает `1`, джоб выполнился успешно. Если `2`, джоба выполнилась с непонятным результатом или варнингом. Иначе джоба не выполнилась, status - error или failed. 
  
