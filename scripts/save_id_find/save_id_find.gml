/// save_id_find(saveid)
/// @arg saveid
/// @desc Finds the instance with the given save ID.

var saveid = argument0;

if (saveid = "")
	return null

with (app)
	if (save_id = saveid)
		return app
	
with (obj_template)
	if (save_id = saveid)
		return id

with (obj_timeline)
	if (save_id = saveid)
		return id

with (obj_resource)
	if (save_id = saveid)
		return id

with (obj_particle_type)
	if (save_id = saveid)
		return id

return null
