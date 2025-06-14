#!/usr/bin/env python3
import requests
import xml.etree.ElementTree as ET
import sys

def fetch_abilities(npc_id, version='cata'):
    url = f'https://www.wowhead.com/{version}/npc={npc_id}?xml;fields=abilities'
    r = requests.get(url)
    r.raise_for_status()
    root = ET.fromstring(r.content)
    out = []
    for node in root.findall('.//ability'):
        icon     = node.findtext('icon','').strip()
        name     = node.findtext('name','').strip().replace('"','\\"')
        desc     = node.findtext('desc','').strip().replace('"','\\"')
        duration = int(node.findtext('duration','0'))
        # Wowhead sometimes uses <castTime> or <casttime>
        casttime = node.findtext('castTime') or node.findtext('casttime') or '0'
        casttime = float(casttime)
        cooldown = float(node.findtext('cooldown','0'))
        out.append({
            'icon': icon,
            'name': name,
            'desc': desc,
            'duration': duration,
            'casttime': casttime,
            'cooldown': cooldown,
        })
    return out

def to_lua(data):
    lines = ['abilities = {']
    for a in data:
        lines += [
            '  {',
            f'    icon        = "Interface\\\\Icons\\\\{a["icon"]}",',
            f'    name        = "{a["name"]}",',
            f'    description = "{a["desc"]}",',
            f'    duration    = {a["duration"]},',
            f'    casttime    = {a["casttime"]},',
            f'    cooldown    = {a["cooldown"]},',
            '  },'
        ]
    lines.append('}')
    return "\n".join(lines)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: wowhead_abilities.py <npc_id> [version]")
        sys.exit(1)

    npc_id  = sys.argv[1]
    version = sys.argv[2] if len(sys.argv) > 2 else 'cata'
    abilities = fetch_abilities(npc_id, version)
    print(to_lua(abilities))