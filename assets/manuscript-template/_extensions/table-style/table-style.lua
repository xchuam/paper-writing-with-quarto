function Table(tbl)
  if FORMAT == "docx" then
    tbl.attr.attributes["custom-style"] = "ThreeLine"
  end

  return tbl
end
