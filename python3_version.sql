CREATE OR REPLACE FUNCTION public.python3_version()
	RETURNS text
	LANGUAGE plcontainer
	VOLATILE
AS $$

# container: plc_python3_shared
import sys

return sys.version

$$
EXECUTE ON ANY;
-- Permissions

ALTER FUNCTION public.python3_version() OWNER TO gpadmin;
GRANT ALL ON FUNCTION public.python3_version() TO gpadmin;
grant execute on function public.python3_version() to public;

select * from public.python3_version();
