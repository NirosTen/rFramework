
-- All items with there weight and event
items = {
    {name="Bread", label="Pain", weight=0.7, event="rF:Eat_bread"},
    {name="Apple", label="Pomme", weight=0.5, event="rF:Eat_apple"},
    {name="CB", label="Carte bancaire", weight=0.1, event="core:UseCreditCard"}, -- Not used in the framework but in my core
    {name="metal", label="Pièce métalique cassé", weight=1.5, event=""},
    {name="metal2", label="Morceau de carrosserie", weight=1.5, event=""},

    -- Weapons
    {name="pistolet", label="Pistolet", weight=5.0, event="core:GetPistol"},
    {name="tazer", label="Tazer", weight=5.0, event="core:GetTazer"},
    {name="pistoletmk2", label="Pistolet nouvelle génération", weight=5.0, event="core:GetPistolmk2"},
    {name="pistoletlspd", label="Arme de poing LSPD", weight=5.0, event="core:GetPistollspd"},
}


function GetOriginalLabel(item)
    for k,v in pairs(items) do
        if v.name == item then
            return v.label
        end
    end
end