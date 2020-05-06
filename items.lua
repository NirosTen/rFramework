
-- All items with there weight and event
items = {
    {name="Bread", label="Pain", weight=0.7, event="rF:Eat_bread"},
    {name="Apple", label="Pomme", weight=0.5, event="rF:Eat_apple"},
    {name="CB", label="Carte bancaire", weight=0.1, event="core:UseCreditCard"}, -- Not used in the framework but in my core
}


function GetOriginalLabel(item)
    for k,v in pairs(items) do
        if v.name == item then
            return v.label
        end
    end
end