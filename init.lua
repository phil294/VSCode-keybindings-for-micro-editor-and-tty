-- https://github.com/zyedidia/micro/issues/1806
function toggleSoftwrap(bp)
	bp.Buf.Settings["softwrap"] = not bp.Buf.Settings["softwrap"]
end
