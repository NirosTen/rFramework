
-- All items with there weight and event
items = {
    {name="Bread", label="Pain", weight=0.7, event="rF:Eat_bread"},
    {name="Apple", label="Pomme", weight=0.5, event="rF:Eat_apple"},
    {name="CB", label="Carte bancaire", weight=0.1, event="core:UseCreditCard"}, -- Not used in the framework but in my core
    {name="metal", label="Pièce métalique cassé", weight=1.5, event=""},
    {name="metal2", label="Morceau de carrosserie", weight=1.5, event=""},
    {name="medicament1", label="Medicament sous scellé", weight=10.0, event=""},
    {name="medikit", label="Kit de soin", weight=10.0, event="core:UseMedikit"},
    {name="permisChasse", label="Permis de chasse", weight=1.0, event="core:ShowPermisChasse"},

    {name="viande1", label="Viande de basse qualité", weight=1.0, event=""},
    {name="viande2", label="Viande de qualité normal", weight=2.5, event=""},
    {name="viande3", label="Viande de bonne qualité", weight=3.5, event=""},
    {name="viande4", label="Viande de qualité incroyable", weight=5.0, event=""},

    {name="weedseed", label="Graine de chanvre", weight=0.5, event="core:PlantWeed"},
    {name="weed", label="Canabis non traitée", weight=1.0, event=""},
    {name="weed2", label="Canabis de bonne qualité", weight=2.0, event=""},


    -- Weapons
    {name="matraque", label="Matraque force de l'ordre", weight=5.0, event="core:GetMattraque"},
    {name="pistolet", label="Pistolet", weight=5.0, event="core:GetPistol"},
    {name="tazer", label="Tazer", weight=10.0, event="core:GetTazer"},
    {name="pistoletmk2", label="Pistolet nouvelle génération", weight=10.0, event="core:GetPistolmk2"},
    {name="pistoletlspd", label="Arme de poing force de l'ordre", weight=10.0, event="core:GetPistollspd"},
    {name="m4", label="Fusils d'assault force de l'ordre", weight=20.0, event="core:GetM4"},
    {name="musket", label="Fusils de chasse", weight=25.0, event="core:GetMusket"}, -- chasse
    {name="huntrifle", label="Fusils de précision de chasseur", weight=30.0, event="core:GetHuntSniper"}, -- chasse

    {name="batte", label="Batte De Baseball", weight=10.0, event="core:GetBat"}, -- Armurie
    {name="knife", label="Couteau de poche", weight=5.0, event="core:GetKnife"}, -- Armurie
}


function GetOriginalLabel(item)
    for k,v in pairs(items) do
        if v.name == item then
            return v.label
        end
    end
end