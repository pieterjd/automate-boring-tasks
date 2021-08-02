# Templating


## Environment variables
```bash [1|3-4]
http 'Authentication: Bearer 123456789...XYZ' http: //www.example.com

export TOKEN=123456789...XYZ
http "Authentication: Bearer $TOKEN" http://www.example.com
```


## Scripting - Powershell
```ps[|1-9|11-12]
$sql_template = @"
insert into `user`
(email, password, is_active, created_at, updated_at)
values('{0}@emakina.com', sha1('pass'), 1, now(), now() );

insert into user_credential
(user_id,credential,value,created_at,updated_at)
values (LAST_INSERT_ID(),'admin',1,now(),now());
"@

@('admin','press','super-admin','mice','spot')
  |%{$sql_template -f $_}
```


## Scripting - SQL
```[1-7|9-14]
SELECT distinct uc.credential as c,
CONCAT("insert into `user` ( email, password,
is_active, created_at, updated_at)
values('",  credential, "@emakina.com', sha1('pass'),
1, now(), now());")
as command
from user_credential uc
UNION
SELECT distinct uc.credential as c,
CONCAT("insert into user_credential (user_id, credential,
value, created_at, updated_at)
values (LAST_INSERT_ID(), '",  credential,"', 1, now(), now());")
as command
from user_credential uc
order by c;

```
