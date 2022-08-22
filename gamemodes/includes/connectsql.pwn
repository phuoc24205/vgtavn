new SQL_HOST[64], SQL_DB[64], SQL_USER[32], SQL_PASS[128], SQL_DEBUG, SQL_DEBUGLOG;
	new SQL_SHOST[64], SQL_SDB[64], SQL_SUSER[32], SQL_SPASS[128];
	new fileString[128], File: fileHandle = fopen("mysql.cfg", io_read);

	while(fread(fileHandle, fileString, sizeof(fileString))) {
		if(ini_GetValue(fileString, "HOST", SQL_HOST, sizeof(SQL_HOST))) continue;
		if(ini_GetValue(fileString, "DB", SQL_DB, sizeof(SQL_DB))) continue;
		if(ini_GetValue(fileString, "USER", SQL_USER, sizeof(SQL_USER))) continue;
		if(ini_GetValue(fileString, "PASS", SQL_PASS, sizeof(SQL_PASS))) continue;
		if(ini_GetInt(fileString, "SHOPAUTOMATED", ShopToggle)) continue;
		if(ini_GetValue(fileString, "SHOST", SQL_SHOST, sizeof(SQL_SHOST))) continue;
		if(ini_GetValue(fileString, "SDB", SQL_SDB, sizeof(SQL_SDB))) continue;
		if(ini_GetValue(fileString, "SUSER", SQL_SUSER, sizeof(SQL_SUSER))) continue;
		if(ini_GetValue(fileString, "SPASS", SQL_SPASS, sizeof(SQL_SPASS))) continue;
		if(ini_GetInt(fileString, "SERVER", servernumber)) continue;
		if(ini_GetInt(fileString, "DEBUG", SQL_DEBUG)) continue;
		if(ini_GetInt(fileString, "DEBUGLOG", SQL_DEBUGLOG)) continue;
	}
	fclose(fileHandle);
	connectvgta = mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASS);