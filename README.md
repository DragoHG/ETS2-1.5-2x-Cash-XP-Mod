# 2X Cash & XP — ETS2 Economy Mods

Economy mods for **Euro Truck Simulator 2**. Four separate packages change how much money and/or XP you earn. Pick one that fits how you play.

**Author:** [Drago - Fabio Monreal](https://steamcommunity.com/id/DragoHG/)

**Source:** [github.com/DragoHG/ETS2-1.5-2x-Cash-XP-Mod](https://github.com/DragoHG/ETS2-1.5-2x-Cash-XP-Mod)

## Versions

| Mod | Money | XP | Notes |
|-----|-------|----|-------|
| **2X Cash** | 2.0x | Normal | Faster income, normal leveling |
| **2X XP** | Normal | 2.0x | Faster leveling, normal pay |
| **1.5 Cash & XP** | 1.5x | 1.5x | Mild boost to both |
| **2X Cash & XP** | 2.0x | 2.0x | Full boost to both |

### Money changes (when boosted)

- Freight and cargo market revenue
- Hired driver revenue
- On 2x money packs: hired drivers always return with cargo

### XP changes (when boosted)

- Delivery, free roam, and road discovery XP
- Manual parking bonuses (including doubles and loading)

## Use only one at a time

All four packs replace the same game file (`def/economy_data.sii`). ETS2 does not merge them. If two are active, only the one higher in the Mod Manager list is used.

Need both money and XP doubled? Use **2X Cash & XP**, not 2X Cash + 2X XP together.

## Install

### Steam Workshop

Subscribe to one of these:

- [2X Cash - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739166886)
- [2X XP - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739168334)
- [1.5 Cash & XP - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739165142)
- [2X Cash & XP - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739161089)

In Mod Manager, enable **one** pack and move it to the **top** of the list.

### GitHub Releases

1. Open [Releases](https://github.com/DragoHG/ETS2-1.5-2x-Cash-XP-Mod/releases)
2. Download one `.scs` file
3. Put it in:

   ```
   Documents\Euro Truck Simulator 2\mod\
   ```

4. Enable it in Mod Manager and keep it at the top of the load order

### Build from this repo

```powershell
.\build.ps1
```

`.scs` files are written to `build/`. Copy one into your ETS2 `mod` folder.

## Compatibility

- Built against the current ETS2 `def.scs` economy data (including updated currencies such as ISK)
- Works with map DLCs (no DLC requirement in the package)
- Fine on new or existing profiles
- Does not change fines, garage prices, or fuel costs

Game updates from [SCS Software](https://www.scssoft.com/) can change `economy_data.sii`. After a big patch, check Workshop or GitHub for an updated release.

## After a game update

If something looks wrong after a patch:

1. Look for a new release here or on Steam Workshop
2. Or update the files yourself and open a pull request (details below)

### Updating the economy file yourself

Vanilla game files are not in this repository (see `.gitignore`). Extract them from your own game copy.

1. Open your ETS2 install folder (for example `Steam\steamapps\common\Euro Truck Simulator 2\`)
2. Extract `def.scs`
3. Open `def/economy_data.sii` from the extract (path can change between patches)
4. Copy that file into each mod’s `universal/def/` folder and re-apply only the multipliers from the **Versions** table
5. Run `.\build.ps1` and test in-game

Pull requests with updated mod `economy_data.sii` files are welcome. Do not commit extracted vanilla archives or the full `.gamefiles` dump.

## Repo layout

```
1.5 Cash & XP/
2X Cash & XP/
2X Cash/
2X XP/
build.ps1
LICENSE
README.md
.gitignore
```

Each mod folder:

```
<mod name>/
├── versions.sii
├── img_steam.jpg
└── universal/
    ├── manifest.sii
    ├── mod_description.txt
    ├── icon.jpg
    └── def/
        └── economy_data.sii
```

Ignored locally (not published in git):

| Path | Why |
|------|-----|
| `.gamefiles/` | Full extract of game `def.scs` |
| `build/` | Generated packages |
| `*.scs`, `*.zip` | Built archives |

## Credits

- Mod: [Drago - Fabio Monreal](https://steamcommunity.com/id/DragoHG/)
- Game: [Euro Truck Simulator 2](https://www.scssoft.com/) by [SCS Software](https://www.scssoft.com/)

Economy values are based on SCS game data. Vanilla files are not redistributed here. Rights to the game belong to SCS Software s.r.o.

### ☕ Support the Project
If you enjoy these mods, consider supporting my work by buying me a coffee:

[![Buy Me a Coffee](https://img.shields.io/badge/Buy_Me_a_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://ko-fi.com/fabio_monreal)

## License

[MIT License](LICENSE). Keep credit to the mod author and [SCS Software](https://www.scssoft.com/) if you redistribute.
