# 2X Cash & XP — ETS2 Economy Mods

A family of economy mods for **Euro Truck Simulator 2** that adjust job payouts and experience gain. Four separate versions let you choose how much cash and XP you want — pick the one that fits your playstyle.

**Author:** [Drago - Fabio Monreal](https://steamcommunity.com/id/DragoHG/)

**Repository:** [github.com/DragoHG/ETS2-1.5-2x-Cash-XP-Mod](https://github.com/DragoHG/ETS2-1.5-2x-Cash-XP-Mod)

## Mod Versions

| Mod | Money | XP | Best for |
|-----|-------|----|----------|
| **2X Cash** | 2.0x | Vanilla | Earning money faster without leveling up quicker |
| **2X XP** | Vanilla | 2.0x | Leveling up skills faster without extra income |
| **1.5 Cash & XP** | 1.5x | 1.5x | A balanced, moderate boost |
| **2X Cash & XP** | 2.0x | 2.0x | Maximum boost to both income and experience |

### What changes

**Money (when boosted):**
- `fixed_revenue`, `revenue_coef_per_km`, `cargo_market_revenue_coef_per_km`
- Driver job revenue coefficients
- On 2X money mods: hired drivers always return with cargo (`driver_no_return_job_prob: 0.0`)

**XP (when boosted):**
- Delivery, free roam, and road discovery XP per km
- Manual parking bonuses (easy / medium / hard, including double trailers)
- Loading phase parking bonus

## Important: Use Only One Mod at a Time

All four mods override the same file: `def/economy_data.sii`. ETS2 **replaces the entire file** — it does not merge mods. If you enable two versions at once, only the mod **higher in the Mod Manager list** will take effect.

You cannot combine "2X Cash" + "2X XP" to get both bonuses. Download the **2X Cash & XP** version instead.

## Installation

### Steam Workshop (recommended)

Prefer auto-updates? Subscribe to the versions directly on the Steam Workshop:

- [2X Cash - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739166886)
- [2X XP - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739168334)
- [1.5 Cash & XP - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739165142)
- [2X Cash & XP - Economy Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3739161089)

Enable **only one** mod from this family in the Mod Manager and place it at the **top** of the load order.

### From GitHub Releases

1. Go to the [**Releases**](https://github.com/DragoHG/ETS2-1.5-2x-Cash-XP-Mod/releases) page
2. Download **one** `.scs` file for the version you want:
   - `2X Cash.scs`
   - `2X XP.scs`
   - `1.5 Cash & XP.scs`
   - `2X Cash & XP.scs`
3. Copy the file to your ETS2 mod folder:

   ```
   Documents\Euro Truck Simulator 2\mod\
   ```

4. Launch ETS2 → **Mod Manager**
5. Enable the mod and move it to the **top** of the load order
6. Confirm changes and start or continue your profile

### From source

If you cloned this repository:

```powershell
.\build.ps1
```

This creates ready-to-play `.scs` files in the `build/` folder (standard local layout with in-game icon support). Copy one to your ETS2 mod folder as described above.

## Compatibility

- Works with the **latest ETS2 version**
- Compatible with **all map DLCs** (no DLC dependencies required)
- Safe to use on new or existing save games
- Does not modify fines, garage prices, fuel costs, or other economy values

## Future Game Updates

ETS2 receives regular updates from [SCS Software](https://www.scssoft.com/). When the game is patched, the vanilla `economy_data.sii` file may change — new fields may be added, removed, or restructured. **This mod may stop working or behave incorrectly after a future update.**

The base economy file lives inside the game's `def.scs` archive. After a major game update, its path or internal structure may also change (for example, `def/economy_data.sii` may be moved or split). Always extract the latest vanilla file from your own game installation before updating the mod.

If that happens:

1. Check whether a new release of this mod is available on GitHub or Steam Workshop
2. If you want to help fix it, **Pull Requests are welcome** on this repository

### Updating the mod yourself

Vanilla game files are **not included** in this repository. The `def/` folder is listed in `.gitignore` because `economy_data.sii` belongs to [SCS Software](https://www.scssoft.com/) — you must extract it from your own copy of the game.

To bring a mod variant up to date after a game patch:

1. Locate your ETS2 installation folder (e.g. `Steam\steamapps\common\Euro Truck Simulator 2\`)
2. Extract `def.scs` using a tool such as [SCS Extractor](https://modding.scssoft.com/) or any `.scs`/ZIP-compatible archive tool
3. Find and open `def/economy_data.sii` in the extracted files — this is the latest vanilla reference (its location inside `def.scs` may change after game updates)
4. Compare it with the `economy_data.sii` inside any mod folder (e.g. `2X Cash/universal/def/economy_data.sii`) and re-apply only the multiplier changes listed in the **Mod Versions** section above
5. Replace the `economy_data.sii` inside each mod's `universal/def/` folder
6. Run `.\build.ps1` to repack the `.scs`

**Pull Requests are welcome** to keep the mod aligned with new game versions. Please submit updated mod `economy_data.sii` files only — do **not** include vanilla files extracted from the game.

## Contributing

Contributions via Pull Request are encouraged, especially when ETS2 updates break or outdated the mod. Typical workflow:

1. Extract `def.scs` from your ETS2 installation
2. Locate the current vanilla `economy_data.sii` (path may differ after updates)
3. Apply the economy multipliers to a copy and update the relevant `universal/def/economy_data.sii` in this repo
4. Run `.\build.ps1` and test in-game
5. Open a PR with a short note about which game version you tested against

All game data credits belong to [SCS Software](https://www.scssoft.com/). This project only distributes modified economy values, not vanilla game files.

## Repository Structure

```
1.5 Cash & XP/           # 1.5x money + 1.5x XP source
2X Cash & XP/            # 2x money + 2x XP source
2X Cash/                 # 2x money only source
2X XP/                   # 2x XP only source
build.ps1                # Packaging script
LICENSE                  # MIT License
README.md
.gitignore
```

Each mod folder contains:

```
<mod name>/
├── versions.sii          # Workshop version routing
├── img_steam.jpg         # Steam Workshop preview (not packed)
└── universal/
    ├── manifest.sii
    ├── mod_description.txt
    ├── icon.jpg
    └── def/
        └── economy_data.sii
```

### Not included in the repository

The following are intentionally excluded via `.gitignore`:

| Path | Reason |
|------|--------|
| `def/` | Vanilla game files from `def.scs` — copyrighted by [SCS Software](https://www.scssoft.com/). Extract from your own game installation. |
| `build/` | Generated `.scs` archives and `build/workshop/` upload folders |
| `*.scs`, `*.zip` | Packaged mod files |

## Credits

- **Mod author:** [Drago - Fabio Monreal](https://steamcommunity.com/id/DragoHG/)
- **Game:** [Euro Truck Simulator 2](https://www.scssoft.com/) by [SCS Software](https://www.scssoft.com/)

The mod's `economy_data.sii` files are derived from the original game data by SCS Software. Vanilla files are not redistributed in this repository. All rights to the game and its assets belong to SCS Software s.r.o.

## License

This project is licensed under the [MIT License](LICENSE).

When sharing forks or derivatives, please keep attribution to both this mod's author and [SCS Software](https://www.scssoft.com/).
