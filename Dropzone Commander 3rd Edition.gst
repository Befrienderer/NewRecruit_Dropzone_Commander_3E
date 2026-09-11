<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem name="Dropzone Commander 3rd Edition" id="sys-1822-fb7b-9057-840f" battleScribeVersion="2.03" library="false" publicationId="170a-7ed5-c49d-82ec" revision="3" type="gameSystem" xmlns="http://www.battlescribe.net/schema/gameSystemSchema">
  <categoryEntries>
    <categoryEntry name="Standard" id="c926-5116-6500-dd46"/>
    <categoryEntry name="Vanguard" id="74de-7c05-a61e-25e8" hidden="false"/>
    <categoryEntry name="Support" id="d6a2-4ad7-4694-03ce" hidden="false"/>
    <categoryEntry name="Heavy" id="9ed0-b443-0fe4-1eaa" hidden="false"/>
    <categoryEntry name="Transport" id="0f65-b14b-ed9f-3e06" hidden="false"/>
    <categoryEntry name="Generated" id="9ca1-02c4-a934-51fe" hidden="false"/>
    <categoryEntry name="Raw Materials" id="2b55-17b3-4772-a8d4" hidden="false"/>
  </categoryEntries>
  <costTypes>
    <costType name="pts" id="cdb2-e720-ea26-2255" defaultCostLimit="-1"/>
    <costType name="category" id="e154-4f91-e9d9-012e" defaultCostLimit="-1" hidden="true"/>
  </costTypes>
  <forceEntries>
    <forceEntry name="Skirmish" id="c15e-98a2-f3dd-1cb4" childForcesLabel="Groups" hidden="false" page="9" publicationId="170a-7ed5-c49d-82ec">
      <constraints>
        <constraint id="9ca0-6032-9c53-cca7-min" field="forces" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="min" value="0"/>
        <constraint id="9ca0-6032-9c53-cca7-max" field="forces" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="max" value="1"/>
        <constraint id="dzc-alloc-vanguard" childId="74de-7c05-a61e-25e8" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-alloc-heavy" childId="9ed0-b443-0fe4-1eaa" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-alloc-support" childId="d6a2-4ad7-4694-03ce" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-skirmish-groups-max" field="forces" includeChildForces="false" includeChildSelections="false" scope="self" shared="false" type="max" value="9"/>
        <constraint id="dzc-skirmish-pts-min" field="limit::cdb2-e720-ea26-2255" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="min" value="-1"/>
        <constraint id="dzc-skirmish-pts-max" field="limit::cdb2-e720-ea26-2255" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="max" value="-1"/>
      </constraints>
      <forceEntries>
        <forceEntry name="Group" id="5a24-6c02-1bfc-6fd8" hidden="false">
          <categoryLinks>
            <categoryLink name="Standard" id="74f7-2c1e-4140-39ee" hidden="false" targetId="c926-5116-6500-dd46"/>
            <categoryLink name="Support" id="d404-33bb-8a7c-74c0" hidden="false" targetId="d6a2-4ad7-4694-03ce"/>
            <categoryLink name="Heavy" id="9033-d7b5-fa7b-939f" hidden="false" targetId="9ed0-b443-0fe4-1eaa"/>
            <categoryLink name="Transport" id="8872-6517-0ed8-8d69" hidden="false" targetId="0f65-b14b-ed9f-3e06"/>
            <categoryLink name="Vanguard" id="1c9f-361b-836d-1171" hidden="false" targetId="74de-7c05-a61e-25e8"/>
            <categoryLink name="Generated" id="c428-d02c-0f8c-3cfd" hidden="true" targetId="9ca1-02c4-a934-51fe"/>
          </categoryLinks>
          <constraints>
            <constraint id="a45f-7c60-f9ad-9f9a" field="limit::cdb2-e720-ea26-2255" includeChildForces="true" includeChildSelections="true" percentValue="true" scope="self" shared="false" type="max" value="25"/>
          </constraints>
        </forceEntry>
      </forceEntries>
      <modifiers>
        <modifier field="dzc-alloc-vanguard" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-alloc-heavy" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-alloc-support" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-skirmish-pts-min" type="set" value="501">
          <conditions>
            <condition childId="c15e-98a2-f3dd-1cb4" field="forces" includeChildForces="true" includeChildSelections="false" scope="roster" shared="false" type="greaterThan" value="0"/>
          </conditions>
        </modifier>
        <modifier field="dzc-skirmish-pts-max" type="set" value="1000">
          <conditions>
            <condition childId="c15e-98a2-f3dd-1cb4" field="forces" includeChildForces="true" includeChildSelections="false" scope="roster" shared="false" type="greaterThan" value="0"/>
          </conditions>
        </modifier>
      </modifiers>
    </forceEntry>
    <forceEntry name="Clash" id="f05d-b606-12c4-88bd" childForcesLabel="Groups" hidden="false" page="9" publicationId="170a-7ed5-c49d-82ec">
      <constraints>
        <constraint id="baf7-13fd-0773-650d" field="forces" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="min" value="0"/>
        <constraint id="1e8e-3d2b-2c4c-c6b0" field="forces" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="max" value="1"/>
        <constraint id="dzc-clash-alloc-vanguard" childId="74de-7c05-a61e-25e8" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-clash-alloc-heavy" childId="9ed0-b443-0fe4-1eaa" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-clash-alloc-support" childId="d6a2-4ad7-4694-03ce" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-clash-groups-max" field="forces" includeChildForces="false" includeChildSelections="false" scope="self" shared="false" type="max" value="12"/>
        <constraint id="dzc-clash-pts-min" field="limit::cdb2-e720-ea26-2255" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="min" value="-1"/>
        <constraint id="dzc-clash-pts-max" field="limit::cdb2-e720-ea26-2255" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="max" value="-1"/>
      </constraints>
      <forceEntries>
        <forceEntry name="Group" id="8ce1-1a18-11bf-8615" hidden="false">
          <categoryLinks>
            <categoryLink name="Standard" id="724e-701b-3418-09d4" hidden="false" targetId="c926-5116-6500-dd46"/>
            <categoryLink name="Support" id="d452-ee38-2f04-9d21" hidden="false" targetId="d6a2-4ad7-4694-03ce"/>
            <categoryLink name="Heavy" id="cf1f-d369-1999-cb8a" hidden="false" targetId="9ed0-b443-0fe4-1eaa"/>
            <categoryLink name="Transport" id="26b1-d12a-3d42-c074" hidden="false" targetId="0f65-b14b-ed9f-3e06"/>
            <categoryLink name="Vanguard" id="9bd1-471e-1d4d-7f82" hidden="false" targetId="74de-7c05-a61e-25e8"/>
            <categoryLink name="Generated" id="831d-15f6-d723-146d" hidden="true" targetId="9ca1-02c4-a934-51fe"/>
          </categoryLinks>
          <constraints>
            <constraint id="2746-021a-658f-cc1e" field="limit::cdb2-e720-ea26-2255" includeChildForces="true" includeChildSelections="true" percentValue="true" scope="self" shared="false" type="max" value="25"/>
          </constraints>
        </forceEntry>
      </forceEntries>
      <modifiers>
        <modifier field="dzc-clash-alloc-vanguard" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-clash-alloc-heavy" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-clash-alloc-support" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-clash-pts-min" type="set" value="1001">
          <conditions>
            <condition childId="f05d-b606-12c4-88bd" field="forces" includeChildForces="true" includeChildSelections="false" scope="roster" shared="false" type="greaterThan" value="0"/>
          </conditions>
        </modifier>
        <modifier field="dzc-clash-pts-max" type="set" value="2000">
          <conditions>
            <condition childId="f05d-b606-12c4-88bd" field="forces" includeChildForces="true" includeChildSelections="false" scope="roster" shared="false" type="greaterThan" value="0"/>
          </conditions>
        </modifier>
      </modifiers>
    </forceEntry>
    <forceEntry name="Battle" id="6d49-920a-0020-1440" childForcesLabel="Groups" hidden="false" page="9" publicationId="170a-7ed5-c49d-82ec">
      <constraints>
        <constraint id="980b-7f3c-3b9b-f433" field="forces" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="min" value="0"/>
        <constraint id="19a5-ff7c-6f24-d6a3" field="forces" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="max" value="1"/>
        <constraint id="dzc-battle-alloc-vanguard" childId="74de-7c05-a61e-25e8" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-battle-alloc-heavy" childId="9ed0-b443-0fe4-1eaa" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-battle-alloc-support" childId="d6a2-4ad7-4694-03ce" field="e154-4f91-e9d9-012e" includeChildForces="true" includeChildSelections="true" scope="self" shared="false" type="max" value="0"/>
        <constraint id="dzc-battle-groups-max" field="forces" includeChildForces="false" includeChildSelections="false" scope="self" shared="false" type="max" value="16"/>
        <constraint id="dzc-battle-pts-min" field="limit::cdb2-e720-ea26-2255" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="min" value="-1"/>
        <constraint id="dzc-battle-pts-max" field="limit::cdb2-e720-ea26-2255" includeChildForces="false" includeChildSelections="false" scope="roster" shared="true" type="max" value="-1"/>
      </constraints>
      <forceEntries>
        <forceEntry name="Group" id="cc3f-a64b-2b11-03bd" hidden="false">
          <categoryLinks>
            <categoryLink name="Standard" id="264f-6da4-084b-dc86" hidden="false" targetId="c926-5116-6500-dd46"/>
            <categoryLink name="Support" id="2e8a-06df-b34d-afd1" hidden="false" targetId="d6a2-4ad7-4694-03ce"/>
            <categoryLink name="Heavy" id="74df-37ec-fafd-0777" hidden="false" targetId="9ed0-b443-0fe4-1eaa"/>
            <categoryLink name="Transport" id="2305-b3f0-cf13-2e84" hidden="false" targetId="0f65-b14b-ed9f-3e06"/>
            <categoryLink name="Vanguard" id="985a-d3ba-6053-bc20" hidden="false" targetId="74de-7c05-a61e-25e8"/>
            <categoryLink name="Generated" id="6407-433a-2aa4-005d" hidden="true" targetId="9ca1-02c4-a934-51fe"/>
          </categoryLinks>
          <constraints>
            <constraint id="0b56-27e0-b464-0788" field="limit::cdb2-e720-ea26-2255" includeChildForces="true" includeChildSelections="true" percentValue="true" scope="self" shared="false" type="max" value="25"/>
          </constraints>
        </forceEntry>
      </forceEntries>
      <modifiers>
        <modifier field="dzc-battle-alloc-vanguard" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-battle-alloc-heavy" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-battle-alloc-support" type="increment" value="1">
          <repeats>
            <repeat childId="c926-5116-6500-dd46" field="e154-4f91-e9d9-012e" includeChildForces="true" repeats="1" roundUp="false" scope="self" shared="false" value="1"/>
          </repeats>
        </modifier>
        <modifier field="dzc-battle-pts-min" type="set" value="2001">
          <conditions>
            <condition childId="6d49-920a-0020-1440" field="forces" includeChildForces="true" includeChildSelections="false" scope="roster" shared="false" type="greaterThan" value="0"/>
          </conditions>
        </modifier>
        <modifier field="dzc-battle-pts-max" type="set" value="3000">
          <conditions>
            <condition childId="6d49-920a-0020-1440" field="forces" includeChildForces="true" includeChildSelections="false" scope="roster" shared="false" type="greaterThan" value="0"/>
          </conditions>
        </modifier>
      </modifiers>
    </forceEntry>
  </forceEntries>
  <profileTypes>
    <profileType name="Vehicle" id="f612-c788-3c14-202c" hidden="false" kind="model">
      <characteristicTypes>
        <characteristicType name="Type" id="6456-92b0-2845-9192"/>
        <characteristicType name="Mv" id="523f-2e92-f817-4a35"/>
        <characteristicType name="A" id="27fb-180f-6f6d-89a5"/>
        <characteristicType name="DP" id="ada1-0651-9e45-25a3"/>
        <characteristicType name="Special" id="b8cc-6d88-0300-8e94"/>
        <characteristicType name="Transportation Requirement" id="5a4b-b964-4625-7008"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Infantry" id="60cc-a4a2-7032-d1fe" hidden="false" kind="model">
      <characteristicTypes>
        <characteristicType name="Type" id="9d00-f2ed-8a19-e7d9"/>
        <characteristicType name="Mv" id="9167-1a57-de9c-b897"/>
        <characteristicType name="OF" id="cfcb-c9c3-d604-09b6"/>
        <characteristicType name="DF" id="57d7-2739-2815-df4f"/>
        <characteristicType name="B" id="29ac-a8a4-cec6-ad41"/>
        <characteristicType name="DP" id="e517-cfd1-1a03-e2b4"/>
        <characteristicType name="Special" id="a246-5778-fd67-7be8"/>
        <characteristicType name="Transportation Requirement" id="e5fc-7db6-74f7-3ed2"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Weapons" id="7156-7401-8748-a010" hidden="false" kind="weapon">
      <characteristicTypes>
        <characteristicType name="Arc" id="b724-e880-118f-9157" kind="longText"/>
        <characteristicType name="MA" id="5328-b6d9-9d86-b538" kind="longText"/>
        <characteristicType name="R" id="294e-3e47-fc75-3c2c" kind="longText"/>
        <characteristicType name="Att" id="b5e6-d643-83b3-2f7f" kind="longText"/>
        <characteristicType name="Ac" id="64f2-91e2-ebef-6a63" kind="longText"/>
        <characteristicType name="E" id="69ed-8824-e892-ef43" kind="longText"/>
        <characteristicType name="Special" id="960f-bf25-e324-a0d4" kind="annotation"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Aircraft" id="5340-cfb3-0c68-faef" hidden="false" kind="model">
      <characteristicTypes>
        <characteristicType name="Type" id="a50c-afb4-6143-0acd" kind="annotation"/>
        <characteristicType name="Mv" id="1376-a099-7283-1cbc"/>
        <characteristicType name="A" id="4aa5-a1c4-d96f-ae5d"/>
        <characteristicType name="DP" id="19cc-7233-58f2-ba5b"/>
        <characteristicType name="Special" id="4355-f6e4-1219-6938"/>
      </characteristicTypes>
    </profileType>
    <profileType name="RM Storage" id="ba7b-4507-b5b4-9ede" hidden="false" kind="model">
      <characteristicTypes>
        <characteristicType name="RM" id="3626-8ef7-8d7e-22c5"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Transport" id="afcc-ee02-fc67-1b92" hidden="false" kind="model">
      <characteristicTypes>
        <characteristicType name="Type" id="4ba5-be04-beb3-9ee6"/>
        <characteristicType name="Mv" id="c9b2-760b-2af3-7b82"/>
        <characteristicType name="A" id="6523-65cf-fa99-e8d7"/>
        <characteristicType name="DP" id="75a7-af03-3e2a-7c0a"/>
        <characteristicType name="Special" id="3aee-eccb-7244-e36a"/>
        <characteristicType name="Transportation Requirement" id="49fb-2da3-876e-9ae0"/>
        <characteristicType name="Transport Capacity" id="caae-4cd1-126f-bcf8"/>
      </characteristicTypes>
    </profileType>
  </profileTypes>
  <publications>
    <publication name="Dropzone Commander Rulebook" id="170a-7ed5-c49d-82ec" hidden="false" publisherUrl="https://ttcombat.com/pages/dropzone-commander-resources">
      <comment>Official rules and army stat cards</comment>
    </publication>
    <publication name="Github URL" id="c32a-4372-6d90-0604" hidden="false" publisherUrl="https://github.com/Befrienderer/NewRecruit_Dropzone_Commander_3E">
      <comment>GitHub</comment>
    </publication>
  </publications>
  <sharedRules>
    <rule name="Aegis X&quot;" id="aa0f-2135-4de1-cf5c" hidden="false">
      <description>Friendly Units within X&quot; of this Unit lose UC</description>
    </rule>
    <rule name="Agile X" id="b2f0-d467-12fc-ab2f" hidden="false">
      <description>During CQBs, this Unit automatically passes X DF rolls—each Unit in the Squad contributes X. It cannot automatically pass First Strike hits but gains +1DF against them. Agile Units gain +1DF against Collateral Damage hits.</description>
    </rule>
    <rule name="AWACS X&quot;" id="df6d-9df0-35b0-4c0e" hidden="false">
      <description>Enemy Aircraft within X&quot; of this Unit may be attacked with a +1Ac bonus.</description>
    </rule>
    <rule name="Bloodthirsty" id="8a8a-f58f-e813-e737" hidden="false">
      <description>While Occupying a Zone containing enemies, Bloodthirsty Infantry suffer -2 to Search rolls and may not exit.</description>
    </rule>
    <rule name="Breachers X" id="56d4-dcb8-b265-5973" hidden="false">
      <description>Breachers may enter a Building from any point on it—they do not require an Entrance. Breachers ignore Sited enemies and the Automated Sentries and Seal Effect Features when entering Zones. When a Squad with Breachers enters a Building, select one random enemy Occupying Squad. Each Breaching Unit inflicts X Small Arms hits on that Squad.</description>
    </rule>
    <rule name="Climber" id="a202-23f1-4a38-48d6" hidden="false">
      <description>This Unit may move over any scenery that isn&apos;t Impassable Ground.</description>
    </rule>
    <rule name="Command Centre" id="0415-00fe-f682-499c" hidden="false">
      <description>If this Unit contains a Commander, double the Radius of Command Cards measured from this Unit.</description>
    </rule>
    <rule name="Delayed" id="d551-0514-375f-4c44" hidden="false">
      <description>This Transport cannot Disembark or Embark Units in the same Round that it Disembarks.</description>
    </rule>
    <rule name="Demo Charges X+" id="a9b4-a1ef-6bd0-49b7" hidden="false">
      <description>If this Infantry Unit begins its activation inside a Zone, you may place a Demo Charge Token on that Zone. If enemy Occupiers are present, its Squad must pass a Bravery Test first. If you have no Occupiers in a Zone containing your Demo Charge Tokens, you may remove them all at the end of any friendly activation—each inflicts 2DP on that Zone on an X+. This suffers -1 if one enemy Occupying Squad is present, or -2 if more than one is present.</description>
    </rule>
    <rule name="Dogs" id="c087-8cf1-15e2-52d8" hidden="false">
      <description>Friendly Squads Occupying the same Zone as one or more friendly Dogs Units gain +1 to Search rolls. During step 3 of CQBs, players must allocate at least 1 hit to each enemy Squad with Dogs per remaining DP that Squad has before allocating any to other Squads. Dogs with Living Weapons may Embark into Transports.</description>
    </rule>
    <rule name="Ev X (Evasion)" id="bec3-20fe-557b-33cd" hidden="false">
      <description>Weapons attacking targets with Ev suffer -X Ac. Ev is ignored when targeting friendly Units.</description>
    </rule>
    <rule name="Fast Mover" id="cba4-5cd9-3cfc-8d9b" hidden="false">
      <description>Fast Movers are Aircraft with two Mv stats—a minimum and maximum. They must move at least their minimum Mv each activation, in a straight line, and before attacking. They may move less than their minimum Mv when entering the Table. They may pivot up to 45 degrees at the beginning of their move and again at its end. Units within a Fast Mover Squad must end their move parallel to each other, facing the same way. Fast Movers can always move off the Table. If any Unit in the Squad moves off, the Squad leaves the Table. They then return to Ready.</description>
    </rule>
    <rule name="Flying High" id="92b7-29a8-d782-5d3d" hidden="false">
      <description>A Fast Mover Squad can elect to fly high at the end of its move, before pivoting—indicate this with a token. High-fliers can pivot up to 180 degrees. High-fliers can only target and be targeted by other Fast Movers flying high. Nothing blocks Line of Sight to high-fliers. A high-flier can end its move in illegitimate places, including over Zones—remove it from its flight stand/substitute it for a token if it can&apos;t stand up. The Squad remains flying high until it leaves the Table or elects to return to normal height. It may do this at the end of its move, before pivoting.</description>
    </rule>
    <rule name="Flat Out X&quot;" id="5061-421d-680e-6f1d" hidden="false">
      <description>If this Unit does not Embark, Disembark, or attack in an activation, it gains +X&quot; Mv.</description>
    </rule>
    <rule name="FS X (First Strike)" id="0266-9cdd-25de-87a4" hidden="false">
      <description>At the start of a CQB, each non-Sited Unit with First Strike inflicts X Small Arms hits on the enemy Squads, distributed freely. If both players have First Strike Units involved, the player without the Initiative distributes their hits first. DF saves are then attempted simultaneously.</description>
    </rule>
    <rule name="Hardy X" id="a58f-dbcc-377c-8b12" hidden="false">
      <description>Instead of using its DF, even if it would not normally be able to, this Infantry Unit may use a save of X+ against hits from Weapons, Collateral Damage, and Command Cards. Hits from anything above E2 ignore this rule.</description>
    </rule>
    <rule name="Infiltrate X&quot;" id="d938-2102-1e14-35ec" hidden="false">
      <description>This Unit may always Deploy up to X&quot; from their Territory. Infiltrating Infantry may Deploy as Occupiers in a Zone, but that Zone must be wholly within X&quot; of their Territory. Transports of Squads with Infiltrate that choose to Infiltrate must begin Ready—they are allowed to start empty. Otherwise, Units cannot Infiltrate if part of a Group containing Units without Infiltrate. A Transport with Infiltrate confers Infiltrate to all Units aboard.</description>
    </rule>
    <rule name="Jump X&quot;" id="e823-9048-12b2-f4ec" hidden="false">
      <description>If it does not Embark or Disembark from a Unit that activation, this Unit may Jump when it starts moving—during its move, but not at its end, it is an Aircraft with an X&quot; Mv. If Embarking/Disembarking from a Zone, this Mv is not halved. If an AA Weapon Reaction Attacks it, this Unit suffers -3A for that attack. Line of Sight is measured to a point 2&quot; above the Jumper. Jump Infantry are still damaged as Infantry.</description>
    </rule>
    <rule name="Large" id="24d9-d1e9-e3e3-ffe3" hidden="false">
      <description>Large Vehicles cannot be Obscured except by Obscured Status Tokens granted by Stealth—otherwise, if Obscured, you have Clear Line of Sight. If any part of a Large Vehicle miniature is within 2&quot; of a Building when that Building is destroyed, it takes hits as if its centre was within 2&quot;. When attacking with a Large Vehicle&apos;s Weapons, use the Weapon&apos;s pivot point (if it&apos;s on a ball joint or turret) or the base of the barrel (if it&apos;s fixed) to determine range and Line of Sight for that Weapon. Arcs should be drawn from the centre of the model as usual. When Embarking or Disembarking into or from a Large Transport, add 2&quot; to the allowed Embark/Disembark distance. If the size of a Large Vehicle makes it impossible for a Weapon to get into range against it, physical contact is sufficient.</description>
    </rule>
    <rule name="Lethal" id="077c-0588-1ac3-c465" hidden="false">
      <description>CQB dice contributed by this Unit hit automatically.</description>
    </rule>
    <rule name="Living Weapons" id="be0a-3bf4-cd7c-2c63" hidden="false">
      <description>Commanders cannot be assigned to Living Weapons. They may begin the game aboard a Transport but may not Embark into one. They may enter Zones. Living Weapons cannot Search for or carry Objects. They cannot exit Zones with enemy Occupiers. A player with only Living Weapon Occupiers can only Contest that Zone. Living Weapons with the same name Occupying the same Zone automatically form one Squad/join an existing Squad of Living Weapons with the same name at the start of the Initiation Phase—their player may choose which Squad they join. This can take the Squad above its maximum Squad size.</description>
    </rule>
    <rule name="Obscurer X&quot;" id="297f-5d64-fbc6-eebe" hidden="false">
      <description>All friendly Vehicle and Infantry Units within X&quot; of this Unit are Obscured to enemies.</description>
    </rule>
    <rule name="PX+ (Passive Countermeasures)" id="157a-4f16-886f-f7b5" hidden="false">
      <description>This Unit may attempt to block any damage it would receive by rolling 1 D6 for each point of damage—each result of at least X blocks the damage. Against damage from E9 sources, after modifiers are applied, Passive Countermeasures suffer a -1 modifier. E10 sources, after modifiers are applied, ignore Passive Countermeasures. Once all modifiers are applied, Passive Countermeasures can never exceed 3+. Occupiers inside Zones with Passive Countermeasures gain those Passive Countermeasures against damage dealt directly by Weapons.</description>
    </rule>
    <rule name="Rapid Insertion X&quot;" id="ab92-a4c3-b4db-2ba2" hidden="false">
      <description>An Aircraft transporting Rapid Insertion Units which have not Embarked this Round may move up to an additional X&quot; after all other modifiers are applied before these Units Disembark. The Aircraft cannot move further than its unmodified Mv using this rule. Units with Rapid Insertion may Disembark when their Transport is within 3&quot; of an enemy Vehicle.</description>
    </rule>
    <rule name="Regenerate X" id="1e86-f5cc-4252-0d67" hidden="false">
      <description>This Unit recovers X lost DP in the Cleanup step of the End Phase.</description>
    </rule>
    <rule name="Resilient" id="7ab0-3d8d-f6e9-5286" hidden="false">
      <description>Criticals from non-Blast Weapon hits below E9, after modifiers are applied, do not inflict any additional damage against this Unit.</description>
    </rule>
    <rule name="Scanner" id="fecd-f107-3b79-79fe" hidden="false">
      <description>This Unit gains Clear Line of Sight against targets that would otherwise be Obscured. Other Units in this Unit&apos;s Squad, and other Units in its Group within 4&quot;, also gain Clear Line of Sight against targets that would otherwise be Obscured.</description>
    </rule>
    <rule name="Scout" id="dc43-19cc-2dc0-2340" hidden="false">
      <description>You may measure a Command Card&apos;s Radius from friendly Scout Units. If a Weapon with Indirect draws Line of Sight from this Unit, the -2Ac penalty is ignored.</description>
    </rule>
    <rule name="Shield: X Y&quot; Z+" id="2280-7a7b-33c3-d4d1" hidden="false">
      <description>All Units/Zones as defined by X within Y&quot; of this Unit gain Z+ Passive Countermeasures.</description>
    </rule>
    <rule name="Skimmer" id="dd00-22e6-fa1d-0c38" hidden="false">
      <description>Skimmers ignore all types of Ground and may move over protruding Ground details less than 1&quot; high. Skimmers may drop down any incline.</description>
    </rule>
    <rule name="Stealth" id="f040-0bc1-58e4-f80b" hidden="false">
      <description>If it will spend its full activation disembarked, this Squad may choose to only move OR move 0&quot; and attack. If it does, this Squad gains an Obscured Status Token. Squads with Obscured Status Tokens are Obscured.</description>
    </rule>
    <rule name="Strike" id="b489-9dad-91d3-bbf0" hidden="false">
      <description>This Unit may always begin the game Ready. Units Disembarking directly from this Unit gain Assault on their Weapons.</description>
    </rule>
    <rule name="Strong" id="7998-71e1-0347-ca71" hidden="false">
      <description>Per Squad with two or more Strong Units in a CQB, one enemy Squad of your choosing suffers -1DF for that CQB, assigned at the start of step 1 of that CQB.</description>
    </rule>
    <rule name="Surveyor" id="2057-158a-d752-4b5e" hidden="false">
      <description>If one or more Vehicles with Surveyor are within 1&quot; of a Zone with friendly Occupiers at the end of the Round, you may place one Mapping Token on that Zone. When Searching for an Objective, you may spend two Mapping Tokens on that Zone to find the Objective on a 2+. If you have no Vehicles with Surveyor within 1&quot; of a Zone at the end of any activation (yours or your opponent&apos;s), remove all your Mapping Tokens from it.</description>
    </rule>
    <rule name="Terror" id="98a0-7337-75b2-9f3b" hidden="false">
      <description>Enemies Occupying the same Zone as Terror Units suffer -1B and -1 to Search rolls.</description>
    </rule>
    <rule name="UC (Un-countered)" id="8c5b-60f0-6c8f-4709" hidden="false">
      <description>If a Weapon targeting this Unit has two R values, it may always use its first.</description>
    </rule>
    <rule name="Wide X&quot;" id="c89b-aa16-0fa0-30d3" hidden="false">
      <description>Units in this Squad must maintain a coherency of X&quot; rather than the usual 3&quot;.</description>
    </rule>
    <rule name="AA" id="88de-eb1d-e34e-d999" hidden="false">
      <description>Only AA Weapons can target Aircraft normally. AA Weapons ignore Ev on non-Aircraft. AA Weapons may Reaction Attack—see main rules.</description>
    </rule>
    <rule name="AA-R" id="36f4-4b0f-40eb-843f" hidden="false">
      <description>This AA Weapon may only Reaction Attack but suffers no penalty for doing so.</description>
    </rule>
    <rule name="AA-S" id="dd91-151c-53d9-8b33" hidden="false">
      <description>This AA Weapon may not Reaction Attack.</description>
    </rule>
    <rule name="ALT X" id="af07-7d1f-d02d-ae07" hidden="false">
      <description>Units may only attack with one Weapon with the same ALT number (X) each Round.</description>
    </rule>
    <rule name="Articulated" id="29f1-d0c0-5071-3124" hidden="false">
      <description>Line of Sight may be measured from a point 1&quot; above the model&apos;s centre when attacking with this Weapon.</description>
    </rule>
    <rule name="Assault" id="e3e4-f733-9416-237c" hidden="false">
      <description>This weapon may attack on the same round as Disembarking and/or entering a Zone. If it does so it suffers -2Ac, or -1Ac if it has a R of CC. If a Unit with an Assault Weapon Disembarks then moves 0&quot;, it counts as having moved 1&quot; for attacking purposes.</description>
    </rule>
    <rule name="Battery X" id="5e21-6cd3-9fb2-05d6" hidden="false">
      <description>This Weapon gains X E for each other instance of this Weapon in coherency. Only one Battery Weapon with the same name may attack per Squad per Round. If one attacks, each other instance of that Weapon in coherency counts as having attacked.</description>
    </rule>
    <rule name="Blast" id="d842-2066-a58d-1454" hidden="false">
      <description>This Weapon uses the Blast Template — a 5&quot; diameter circle. First, place the template&apos;s centre over the target&apos;s centre—this is the primary target. Place all templates from one activation&apos;s attacks simultaneously. All Units and Zones within the template are now targets. Roll to hit once against each target for each template. If the primary target was Obscured, everything under the template is Obscured, otherwise Obscured is ignored. Roll D6 times per template against Infantry. If the primary target is a Vehicle with Large or a Zone, do not place the template but roll to hit D3 times. This Weapon can inflict Critical damage against Zones. If the primary target is a Sited Squad, do not place the template. Instead, roll to hit the Squad D6 times. Roll to hit the Zone once. If the primary target is an Aircraft, only Aircraft under the template and not flying high are targets. If the primary target is a non-Aircraft, aircraft are not targets.</description>
    </rule>
    <rule name="Concussion" id="4476-dcd3-b9b6-fe06" hidden="false">
      <description>If a Unit is hit by this Weapon, place a Concussed Status Token on its Squad. Concussed Squads suffer -2Ac. Concussed Infantry also count as Sited in CQBs and do not contribute to Entrances Covered.</description>
    </rule>
    <rule name="Critical X" id="e9d1-d4ad-a7ab-4ee6" hidden="false">
      <description>This Weapon inflicts X additional DP for each Critical it inflicts against Units.</description>
    </rule>
    <rule name="Demo X" id="15c2-33e1-4878-4964" hidden="false">
      <description>This Weapon can inflict Critical damage against Zones. It also inflicts X additional DP for each success when rolling to inflict damage against Zones.</description>
    </rule>
    <rule name="Destroyer X+" id="7846-11c1-ed5f-da4f" hidden="false">
      <description>If this Weapon hits by rolling equal to or higher than X, it will automatically cause a Critical instead of rolling to damage. This counts as a successful roll to damage. This Weapon&apos;s Ac cannot be modified below X.</description>
    </rule>
    <rule name="Devastator X" id="3c64-e01c-1d60-0e4e" hidden="false">
      <description>This Weapon inflicts X additional DP for each success when rolling to inflict damage against Units.</description>
    </rule>
    <rule name="Dissipate -X" id="b82e-69b3-9ee2-f441" hidden="false">
      <description>This Weapon may suffer -X E to double its R value/s. It may do this twice to quadruple its R.</description>
    </rule>
    <rule name="Drive-by" id="b08f-9191-dd14-6fd4" hidden="false">
      <description>This Weapon may measure range and Line of Sight from any point its Unit moved through that activation if it moved in a single straight line. It may pivot before moving.</description>
    </rule>
    <rule name="Field" id="b9e1-146a-cd44-20d7" hidden="false">
      <description>This Weapon does not target anything. Instead, each Zone, Vehicle, and Infantry Unit within its R are assigned attacks equal to its Att. If its R exceeds 6&quot;, Units within half its R are assigned attacks equal to twice its Att. Since it does not target anything, Line of Sight is not needed and friendlies may be hit. Units within this Weapon&apos;s Squad are not damaged by it and cannot receive Concussed, Jammed, or Suppressed Status Tokens from it. If this Weapon has AA, you may assign its attacks only to Aircraft instead of Zones, Vehicles, and Infantry. If this Weapon places Status Tokens, place one on every Squad within its R that could receive the Token. This counts as placing one of that Token.</description>
    </rule>
    <rule name="Flame" id="48e8-d54c-be5d-d5c3" hidden="false">
      <description>This Weapon ignores the Ac penalty against Obscured targets, and it ignores Evasion. Infantry suffer -1DF against this Weapon. This Weapon may target Occupiers as if they were Sited anywhere on a Zone. If friendly Squads are present in this Zone, all misses from your Flame Weapons which targeted enemies in this Zone this activation hit one random friendly Squad in that Zone instead. Flame Weapons with Small Arms may also combine their attacks against Zones. This Weapon can inflict Critical damage against Zones. Flame Weapons gain +1 Demo against Areas.</description>
    </rule>
    <rule name="Focus X" id="4b60-49db-0838-d28e" hidden="false">
      <description>You may discard any number of successful hits from one or more instances of this Weapon to add X E to another remaining hit. For example, two identical E2 Cannons with Focus 1 and 4 attacks each score a total of 6 hits. Their player chooses to discard 4 of these hits to add 2 Energy to each of the remaining hits, resulting in two E4 hits.</description>
    </rule>
    <rule name="GB" id="49c6-4e89-2496-23ac" hidden="false">
      <description>A Weapon with a R value of GB is a Gravity Bomb. It may target anything within 2&quot; of any point its Unit moved over that Round. Line of Sight is checked from that point.</description>
    </rule>
    <rule name="Ignores Cover" id="b403-acb4-6774-bfee" hidden="false">
      <description>This Weapon ignores the Ac penalty for Obscured targets. Sited Infantry may not use their DF value to block hits from this Weapon.</description>
    </rule>
    <rule name="Incendiary X" id="ca37-f0d4-9317-8e9e" hidden="false">
      <description>Each hit from this Weapon that inflicts 1 or more damage against a Building inflicts X additional Collateral Damage hits. Each hit that inflicts 1 or more damage against an Area inflicts 2x X additional Collateral Damage hits</description>
    </rule>
    <rule name="Indirect" id="92f4-d4f3-e013-87d5" hidden="false">
      <description>When attacking with this Weapon, any other friendly Unit may also be used to draw Line of Sight from, in which case it suffers -2Ac. If that friendly Unit has Scout, the -2Ac is ignored. For Sited Units with Indirect, no portion of a Building they Occupy can lie between the face they are Sited on and their target.</description>
    </rule>
    <rule name="Ineffective: X" id="74b8-1da5-8b1b-0b6c" hidden="false">
      <description>This Weapon cannot damage or affect things of the type X.</description>
    </rule>
    <rule name="Jammer" id="ba7a-fb18-fbd5-a18d" hidden="false">
      <description>If a Unit is hit by this Weapon, place a Jammed Status Token on its Squad. Weapons with two R values that attack a Jammed Squad may use their 1st value. Jammed Squads, and Units and Weapons within them, cannot be affected by their player&apos;s Command Cards that take effect while the Squad is Jammed.</description>
    </rule>
    <rule name="LX" id="5b10-9d34-e252-a1db" hidden="false">
      <description>This Weapon may only attack X times/game.</description>
    </rule>
    <rule name="Needs Spotter" id="1c8c-14f8-ef92-a5b9" hidden="false">
      <description>This Weapon&apos;s target must be in Clear or Obscured Line of Sight of a friendly Unit with Scout, or it suffers -2Ac.</description>
    </rule>
    <rule name="Overcharge X" id="7c86-07aa-dc31-6345" hidden="false">
      <description>If its Unit moves 0&quot; (before or after attacking), this Weapon gains +X E that activation.</description>
    </rule>
    <rule name="Overwatch" id="1f6e-1058-9b3f-caf9" hidden="false">
      <description>This Weapon may Reaction Attack against Vehicles and suffers no penalty for doing so. It may only Reaction Attack.</description>
    </rule>
    <rule name="Pen X+" id="e44a-38e5-ff9b-a986" hidden="false">
      <description>When rolling to inflict damage against Units, this Weapon may always succeed on a roll of X+ regardless of E or A values. This cannot be modified. This can alter the roll required for a Critical—Pen 4+ would inflict a Critical on a 6+.</description>
    </rule>
    <rule name="Precision X" id="16bd-55fe-2dc9-6884" hidden="false">
      <description>If its Unit moves 0&quot; (before or after attacking), this Weapon gains +X Ac that activation and if it has Destroyer, it also gains +X Destroyer.</description>
    </rule>
    <rule name="Repair X/Y" id="47c0-2459-5b5f-3db1" hidden="false">
      <description>This Weapon may only target Y, and Y may be a friendly Unit. For each hit by this Weapon, the target regains X lost DP.</description>
    </rule>
    <rule name="Seeker" id="3e89-a594-a5e4-9590" hidden="false">
      <description>This Weapon may target Occupiers as if they were Sited anywhere on a Zone. This Weapon ignores the Ac penalty against Obscured targets if they Occupy the same Zone as friendly Occupiers.</description>
    </rule>
    <rule name="Self-Destruct" id="5ffb-1dd0-4c87-68dd" hidden="false">
      <description>This uses the same rules as a Field Weapon, except that the attacking Unit is destroyed, and Units within its Squad can be damaged by it. If a Unit with a Self-Destruct Weapon is destroyed while not Embarked, roll a D6. On a 4+, the Unit must immediately attack with the Weapon before being removed, even if it could not normally attack.</description>
    </rule>
    <rule name="Smoke" id="cd9e-8875-cf23-2bd7" hidden="false">
      <description>If a Squad receives at least as many hits from Weapons with Smoke during a single activation as it has Units, place an Obscured Status Token on that Squad. Squads with Obscured Status Tokens are Obscured. This Weapon may target friendly Units and may target its own Unit.</description>
    </rule>
    <rule name="Strafe" id="d32e-5c37-a9a0-35d3" hidden="false">
      <description>This Weapon may freely split its attacks against targets within 3&quot; of at least one other Unit it targets. This must be a single chain of targets.</description>
    </rule>
    <rule name="Suppress" id="7ca5-5adf-e535-8eb2" hidden="false">
      <description>If a Unit is hit by this Weapon, place a Suppressed Status Token on its Squad. Suppressed Squads may only move 0&quot; if any Unit within it attacks. Suppressed Fast Movers may not attack.</description>
    </rule>
    <rule name="TX" id="d505-bd27-56c8-5e5f" hidden="false">
      <description>This Weapon reduces the target&apos;s Ev by X to a minimum of 0. For example, T2 would reduce Ev3 to Ev1.</description>
    </rule>
  </sharedRules>
</gameSystem>
