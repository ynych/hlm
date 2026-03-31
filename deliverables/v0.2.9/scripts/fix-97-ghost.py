#!/usr/bin/env python3
# v0.2.9 场景替换脚本 - 97/104回修复版
import re

INPUT_FILE = "deliverables/v0.2.9/fulltext/fulltext-v0.2.9-new.md"
OUTPUT_FILE = "deliverables/v0.2.9/fulltext/fulltext-v0.2.9-final.md"

with open(INPUT_FILE, 'r', encoding='utf-8') as f:
    content = f.read()

# ===== 97回：在"正是：金簪雪里埋香魂"之前插入黛玉显灵 =====
insert_97 = '''他说着，便不再言语，只是静静地临窗。那雪花落在窗台上，顷刻便化了，正如眼前这一切，看似完美，实则短暂，转瞬即逝。

夜深了，袭人被宝玉打发去休息。

灵堂里只剩下宝玉，和宝钗的棺木。

烛火摇曳，在墙上投下诡异的影子。

宝玉有些困了，眼皮沉重。他靠在椅背上，半梦半醒。

忽然，他看见门口站着一个人。

白衣，瘦削，眉眼间带着熟悉的清冷。

"林...林妹妹？"宝玉猛地坐直了。

那人不说话，只是站在门口，冷冷地看着他，看着棺木中的宝钗。

然后，她笑了。

那笑容不是高兴，是一种...嘲讽？怜悯？宝玉分不清。

"宝姐姐..."那"人"开口了，声音像从很远的地方传来，"终究是...宝姐姐..."

宝玉想要站起来，想要走过去，却发现自己动不了。

"林妹妹！"他喊道，"你...你别走..."

那"人"看了他一眼，那眼神复杂极了——有爱，有恨，有释然，有不甘。

然后，她转身走了，像一缕烟，消失在夜色中。

宝玉猛地惊醒。

门口空空如也，只有风吹着帘子轻轻摆动。

他坐在黑暗中，良久，忽然明白了什么。

"原来...如此..."他喃喃道。

正是：'''

content = content.replace(
    '他说着，便不再言语，只是静静地临窗。那雪花落在窗台上，顷刻便化了，正如眼前这一切，看似完美，实则短暂，转瞬即逝。 正是：',
    insert_97
)

# 检查结果
print("=== 替换结果 ===")
print(f"'仰天长啸'残留: {content.count('仰天长啸')}")
print(f"'情不是假的'残留: {content.count('情不是假的')}")
print(f"'黛玉显灵'添加: {'林妹妹？' in content and '终究是' in content and '门口空空' in content}")
print(f"'雪落掌心'添加: {content.count('雪落在掌心')}")
print(f"'埋玉'添加: {content.count('将通灵玉埋在了土里')}")

# 保存
with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"\n✅ 已保存到 {OUTPUT_FILE}")
print(f"文件大小: {len(content)} 字节")
