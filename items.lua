
-- All items with there weight and event
items = {
    {name="Bread", label="Pain", weight=0.7, event="rF:Eat_bread"},
    {name="Apple", label="Pomme", weight=0.5, event="rF:Eat_apple"},
    {name="CB", label="Carte bancaire", weight=0.1, event="core:UseCreditCard"}, -- Not used in the framework but in my core
    {name="metal", label="Pièce métalique cassé", weight=1.5, event=""},
    {name="metal2", label="Morceau de carrosserie", weight=1.5, event=""},
    {name="medicament1", label="Medicament sous scellé", weight=10.0, event=""},
    {name="medikit", label="Kit de soin", weight=10.0, event="core:UseMedikit"},

    {name="viande1", label="Viande de basse qualité", weight=5.0, event=""},
    {name="viande2", label="Viande de qualité normal", weight=5.0, event=""},
    {name="viande3", label="Viande de bonne qualité", weight=5.0, event=""},
    {name="viande4", label="Viande de qualité incroyable", weight=5.0, event=""},

    -- Weapons
    {name="matraque", label="Matraque LSPD", weight=5.0, event="core:GetMattraque"},
    {name="pistolet", label="Pistolet", weight=10.0, event="core:GetPistol"},
    {name="tazer", label="Tazer", weight=5.0, event="core:GetTazer"},
    {name="pistoletmk2", label="Pistolet nouvelle génération", weight=10.0, event="core:GetPistolmk2"},
    {name="pistoletlspd", label="Arme de poing LSPD", weight=10.0, event="core:GetPistollspd"},
    {name="m4", label="Fusils d'assault LSPD", weight=20.0, event="core:GetM4"},
    {name="musket", label="Fusils de chasse", weight=25.0, event="core:GetMusket"}, -- chasse
    {name="huntrifle", label="Fusils de précision de chasseur", weight=30.0, event="core:GetHuntSniper"}, -- chasse
}


function GetOriginalLabel(item)
    for k,v in pairs(items) do
        if v.name == item then
            return v.label
        end
    end
end