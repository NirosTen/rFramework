
-- All items with there weight and event
items = {
    {name="Bread", label="Pain", weight=0.7, event="rF:Eat_bread"},
    {name="Apple", label="Pomme", weight=0.5, event="rF:Eat_apple"},
    {name="CB", label="Carte bancaire", weight=0.1, event="core:UseCreditCard"}, -- Not used in the framework but in my core
    {name="metal", label="Pièce métalique cassé", weight=1.5, event=""},
    {name="metal2", label="Morceau de carrosserie", weight=1.5, event=""},
    {name="medicament1", label="Medicament sous scellé", weight=10.0, event=""},
    {name="medikit", label="Kit de soin", weight=10.0, event="core:UseMedikit"},

    -- Weapons
    {name="pistolet", label="Pistolet", weight=5.0, event="core:GetPistol"},
    {name="tazer", label="Tazer", weight=5.0, event="core:GetTazer"},
    {name="pistoletmk2", label="Pistolet nouvelle génération", weight=5.0, event="core:GetPistolmk2"},
    {name="pistoletlspd", label="Arme de poing LSPD", weight=5.0, event="core:GetPistollspd"},
    {name="m4", label="Fusils d'assault LSPD", weight=15.0, event="core:GetM4"},
}


function GetOriginalLabel(item)
    for k,v in pairs(items) do
        if v.name == item then
            return v.label
        end
    end
end