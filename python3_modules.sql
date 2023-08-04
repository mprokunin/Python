-- Get pivotal container plc_python3_shared modules installed
CREATE OR REPLACE FUNCTION public.python3modules()
	RETURNS text
	LANGUAGE plcontainer
	VOLATILE
AS $$

# container: plc_python3_shared
import pkg_resources
 
installed_packages = pkg_resources.working_set
installed_packages_list = sorted(["%s==%s" % (i.key, i.version)
     for i in installed_packages])
return installed_packages_list

$$
EXECUTE ON ANY;

ALTER FUNCTION public.python3modules() OWNER TO gpadmin;
GRANT ALL ON FUNCTION public.python3modules() TO gpadmin;
grant execute on function public.python3modules() to public;

select * from public.python3modules();
