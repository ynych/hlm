#!/usr/bin/env python3
"""
v0.2.9 评审脚本 - 按照REVIEW_GUIDELINES.md执行检查
"""

import re
import json

FILE_PATH = "deliverables/v0.2.9/fulltext/fulltext-v0.2.9.md"

def load_text():
    with open(FILE_PATH, 'r', encoding='utf-8') as f:
        return f.read()

def check_p0_words(text):
    """检查P0禁用词"""
    p0_words = ["心理", "人格", "棋子", "规训", "内化", "政治上"]
    results = {}
    for word in p0_words:
        count = len(re.findall(word, text))
        results[word] = count
    return results

def check_contextual_words(text):
    """检查语境依赖词（知道、明白、依靠）"""
    words = {
        "知道": len(re.findall(r"知道", text)),
        "明白": len(re.findall(r"明白", text)),
        "依靠": len(re.findall(r"依靠", text))
    }
    return words

def check_p1_words(text):
    """检查P1限制词"""
    p1_words = ["心中", "想起", "望着", "叹道"]
    results = {}
    for word in p1_words:
        count = len(re.findall(word, text))
        results[word] = count
    return results

def check_language_purification(text):
    """检查语言净化效果（凝眸/瞻望/凭窗而望）"""
    return {
        "凝眸": len(re.findall(r"凝眸", text)),
        "瞻望": len(re.findall(r"瞻望", text)),
        "凭窗而望": len(re.findall(r"凭窗而望", text)),
        "如刀绞": len(re.findall(r"如刀绞", text))
    }

def split_chapters(text):
    """分割章节"""
    # 匹配第X回标题
    pattern = r'# 第[八九十百零一二三四五六七八九十]+回.*?\n'
    chapters = re.split(pattern, text)
    titles = re.findall(pattern, text)
    return list(zip(titles, chapters[1:]))

def main():
    text = load_text()
    chapters = split_chapters(text)
    
    print("=" * 60)
    print("v0.2.9 评审报告")
    print("=" * 60)
    
    print(f"\n📊 基本信息:")
    print(f"  文件行数: {text.count(chr(10))}")
    print(f"  文件字符: {len(text)}")
    print(f"  章节数量: {len(chapters)}")
    
    print(f"\n🚫 P0禁用词检查:")
    p0_results = check_p0_words(text)
    for word, count in p0_results.items():
        status = "✅" if count == 0 else "🔴"
        print(f"  {status} {word}: {count}次")
    
    print(f"\n⚠️  语境依赖词（需人工复核）:")
    ctx_results = check_contextual_words(text)
    for word, count in ctx_results.items():
        print(f"  {word}: {count}次")
    
    print(f"\n📉 P1限制词检查（全篇）:")
    p1_results = check_p1_words(text)
    for word, count in p1_results.items():
        print(f"  {word}: {count}次")
    
    print(f"\n📝 语言净化效果检查:")
    purify_results = check_language_purification(text)
    for word, count in purify_results.items():
        print(f"  {word}: {count}次")
    
    print(f"\n📋 章节列表:")
    for i, (title, _) in enumerate(chapters[:10], 1):
        print(f"  {i}. {title.strip()}")
    if len(chapters) > 10:
        print(f"  ... 共{len(chapters)}回")

if __name__ == "__main__":
    main()
