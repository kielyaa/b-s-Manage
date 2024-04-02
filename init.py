import click
from configparser import ConfigParser
from util.configread import config_read  # 自定义模块，用于读取配置文件
from util.sqlinit import Create  # 自定义模块，用于数据库操作

@click.group()
def sub():
    """
    主命令组，用于组织不同的子命令。这是命令行接口的入口点。
    """
    pass

@click.command()
@click.option('--ini', default="config.ini", help='指定配置文件的路径。默认为config.ini。')
def initdb(ini):
    """
    初始化数据库。根据配置文件中的设置来创建数据库。
    """
    dbtype, host, port, user, passwd, dbName, charset, _ = config_read(ini)
    cm = Create(dbtype, host, port, user, passwd, dbName, charset)
    if dbtype == 'mysql':
        # 对MySQL数据库执行创建数据库的操作
        cm.create_db(f"CREATE DATABASE IF NOT EXISTS `{dbName}` /*!40100 DEFAULT CHARACTER SET utf8 */;")
    elif dbtype == 'mssql':
        # 注意：MSSQL数据库的创建需要使用不同的方式来判断数据库是否存在
        # 此处示例代码可能需要根据实际情况调整，以适应MSSQL的数据库创建逻辑
        cm.create_db(f"IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'{dbName}') BEGIN CREATE DATABASE [{dbName}] COLLATE SQL_Latin1_General_CP1_CI_AS END;")
    else:
        print('Unsupported database type. Please check your config.ini file.')
    cm.conn_close()

@click.command()
@click.option('--ini', default="config.ini", help='指定配置文件的路径。默认为config.ini。')
def initsql(ini):
    """
    初始化数据库表。根据配置和指定的SQL文件来创建数据库表。
    """
    dbtype, host, port, user, passwd, dbName, charset, _ = config_read(ini)
    cm = Create(dbtype, host, port, user, passwd, dbName, charset)
    if dbtype == 'mysql':
        sql_file_path = "./db/django6t3106w8.sql"
    elif dbtype == 'mssql':
        sql_file_path = "./db/mssql.sql"
    else:
        print('Unsupported database type. Please check your config.ini file.')
        return
    with open(sql_file_path, encoding="utf8") as f:
        createsql = f.read()
    createsql = "DROP TABLE" + createsql.split('DROP TABLE', 1)[-1]
    cm.create_tables(createsql.split(';\n')[:-1])
    cm.conn_close()

# 将定义的命令添加到命令组
sub.add_command(initdb, "initdb")
sub.add_command(initsql, "initsql")

if __name__ == "__main__":
    sub()
