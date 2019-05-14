#[全文检索]
# ---全文检索
select note_text from productnotes
where MATCH(note_text)against('rabbit');
# ---演示排序
select note_text,match(note_text)against('rabbit') as rank1
from productnotes;
# ---通配符
select note_text from productnotes
where note_text like '%rabbit%';
# 18.2.3 使用查询扩展
select note_text from productnotes
where match(note_text) against('anvils');
select note_text from productnotes
where match(note_text) against('anvils'with query expansion );
# 18.2.4 布尔文本搜索
# ---等同于未指定
select note_text from productnotes
where match(note_text) against('heavy'in boolean mode);
# ---排除包含rope*的行（任何以rope开始的词，包括ropes）
select note_text from productnotes
where match(note_text) against('heavy -rope*'in boolean mode);
# ---包含词rabbit和bait的行
select note_text from productnotes
where match(note_text) against('+rabbit +bait'in boolean mode);
# ---包含rabbit和bait中的至少一个词的行
select note_text from productnotes
where match(note_text) against('rabbit bait'in boolean mode);
# ---搜索匹配短语rabbit bait
select note_text from productnotes
where match(note_text) against('"rabbit bait"'in boolean mode);
# ---匹配rabbit和carrot，增加前者的等级，降低后者的等级
select note_text from productnotes
where match(note_text) against('>rabbit <carrot'in boolean mode);
# ---搜索匹配词safe和combination，降低后者的等级
select note_text from productnotes
where match(note_text) against('+safe +(<combination)'in boolean mode);


