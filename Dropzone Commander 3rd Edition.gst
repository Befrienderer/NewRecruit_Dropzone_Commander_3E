<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem id="sys-1822-fb7b-9057-840f" name="Dropzone Commander 3rd Edition" battleScribeVersion="2.03" revision="3" type="gameSystem" xmlns="http://www.battlescribe.net/schema/gameSystemSchema" library="false" publicationId="170a-7ed5-c49d-82ec">
  <categoryEntries>
    <categoryEntry name="Standard" id="c926-5116-6500-dd46"/>
    <categoryEntry name="Vanguard" id="74de-7c05-a61e-25e8" hidden="false"/>
    <categoryEntry name="Support" id="d6a2-4ad7-4694-03ce" hidden="false"/>
    <categoryEntry name="Heavy" id="9ed0-b443-0fe4-1eaa" hidden="false"/>
    <categoryEntry name="Transport" id="0f65-b14b-ed9f-3e06" hidden="false"/>
  </categoryEntries>
  <forceEntries>
    <forceEntry name="Skirmish" hidden="false" id="b272-2f7e-0536-f623" sortIndex="1" publicationId="170a-7ed5-c49d-82ec">
      <categoryLinks>
        <categoryLink name="Standard" hidden="false" id="default-force-category-link" targetId="c926-5116-6500-dd46"/>
        <categoryLink name="Heavy" hidden="false" id="8e32-16cd-1d5f-cab7" targetId="9ed0-b443-0fe4-1eaa">
          <constraints>
            <constraint type="max" value="100" field="ab87-75c9-cd43-9593" scope="c926-5116-6500-dd46" shared="true" id="925d-09d4-26fc-1057" percentValue="true" includeChildSelections="false"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Support" hidden="false" id="e9e4-23b8-3d01-17d2" targetId="d6a2-4ad7-4694-03ce">
          <constraints>
            <constraint type="max" value="100" field="ab87-75c9-cd43-9593" scope="c926-5116-6500-dd46" shared="true" id="e0e7-4194-487e-fc42" percentValue="true" includeChildSelections="false"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Vanguard" hidden="false" id="67dc-b60c-d8f6-d47f" targetId="74de-7c05-a61e-25e8">
          <constraints>
            <constraint type="max" value="100" field="ab87-75c9-cd43-9593" scope="c926-5116-6500-dd46" shared="true" id="9bea-4fb9-9da0-87bf" percentValue="true" includeChildSelections="false"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Transport" hidden="false" id="1cfa-aa71-b735-e6df" targetId="0f65-b14b-ed9f-3e06"/>
      </categoryLinks>
      <costs>
        <cost name="points" typeId="ab87-75c9-cd43-9593" value="0"/>
      </costs>
      <constraints>
        <constraint type="max" value="25" field="ab87-75c9-cd43-9593" scope="group" shared="true" id="0b02-ea95-8613-be80" includeChildSelections="true" percentValue="true"/>
      </constraints>
    </forceEntry>
    <forceEntry name="Clash" id="71a3-4545-37d2-2e0b" hidden="false" sortIndex="2">
      <costs>
        <cost name="points" typeId="ab87-75c9-cd43-9593" value="2000"/>
      </costs>
    </forceEntry>
    <forceEntry name="Battle" id="d677-e9ec-1314-2276" hidden="false" sortIndex="3">
      <costs>
        <cost name="points" typeId="ab87-75c9-cd43-9593" value="3000"/>
      </costs>
    </forceEntry>
    <forceEntry name="Reconquest" id="e3f0-4d46-20d5-5157" hidden="false" sortIndex="4">
      <costs>
        <cost name="points" typeId="ab87-75c9-cd43-9593" value="3001"/>
      </costs>
    </forceEntry>
  </forceEntries>
  <publications>
    <publication name="Dropzone Commander Resources" id="170a-7ed5-c49d-82ec" hidden="false" publisherUrl="https://ttcombat.com/pages/dropzone-commander-resources">
      <comment>Official rules and army stat cards</comment>
    </publication>
  </publications>
  <costTypes>
    <costType name="Vanguard" id="ab87-75c9-cd43-9593" defaultCostLimit="-1"/>
    <costType name="Standard" id="6086-6c29-a320-0fcc" defaultCostLimit="-1"/>
    <costType name="Support" id="df03-77d8-4c11-2243" defaultCostLimit="-1"/>
    <costType name="Heavy" id="72f6-b4d6-1f34-219e" defaultCostLimit="-1"/>
    <costType name="Transport" id="4306-5775-b4a6-007d" defaultCostLimit="-1"/>
  </costTypes>
  <profileTypes>
    <profileType name="Vehicle" id="f612-c788-3c14-202c" hidden="false" kind="model">
      <characteristicTypes>
        <characteristicType name="Type" id="6456-92b0-2845-9192"/>
        <characteristicType name="Mv" id="523f-2e92-f817-4a35"/>
        <characteristicType name="A" id="27fb-180f-6f6d-89a5"/>
        <characteristicType name="DP" id="ada1-0651-9e45-25a3"/>
        <characteristicType name="Special" id="b8cc-6d88-0300-8e94"/>
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
      </characteristicTypes>
    </profileType>
    <profileType name="Weapons" id="7156-7401-8748-a010" hidden="false" kind="weapon">
      <characteristicTypes>
        <characteristicType name="Name" id="a9dc-0205-0d06-4d25" kind="longText"/>
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
  </profileTypes>
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
  </sharedRules>
</gameSystem>
