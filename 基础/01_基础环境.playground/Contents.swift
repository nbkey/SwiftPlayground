import UIKit

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
/*
 dic, res, i = {}, 0, -1
         for j in range(len(s)):
             if s[j] in dic:
                 i = max(dic[s[j]], i) # 更新左指针 i
             dic[s[j]] = j # 哈希表记录
             res = max(res, j - i) # 更新结果

 */
class Solution {
    
    func lengthOfLongestSubstringCustom(_ s:String) -> Int {
        if s.count == 0 { return 0 }
        var map = [Character:Int]()
        var j = 0
        var i = -1
        var res = 0
        
        for item in s {
            let p = map[item]
            if p != nil {
                i = max(p!, i)
            }
            map[item] = j
            res = max(res, j - i)
            j += 1
        }
        return res
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let array = Array(s)
        
        var dic = [Character:Int]()
        var i = -1
        var res = 0
        for j in 0...array.count-1 {
            let p = dic[array[j]]
            if p != nil { //如果不为空, 证明存在, i
                i = max(p!, i)
            }
            dic[array[j]] = j
            res = max(res, j - i)
        }
        
        return res
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root != nil {
            let maxRight = maxDepth(root!.right)
            let maxLeft = maxDepth(root!.left)
            return max(maxLeft,maxRight) + 1
        } else {
            return 0
        }
    }
    
    func maxDepthBFS(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        
        var depth = 0
        var currentArr = [root!]
        var nextLayer = [TreeNode]()
        while (currentArr.count != 0) {
            for node in currentArr {
                if node.right != nil { nextLayer += [node.right!] }
                if node.left  != nil { nextLayer += [node.left!] }
            }
            currentArr = nextLayer
            nextLayer = []
            depth += 1
        }
        return depth
        
    }
    
    func demoDFS(_ root: TreeNode?) -> Int {
        if root != nil {
            let leftHeight = demoDFS(root?.left)
            let rightHeight = demoDFS(root?.right)
            return max(leftHeight, rightHeight)+1
        } else {
            return 0
        }
    }
    
    func demoBFS(root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        var depth = 0
        var currentArr = [root!]
        var nextLayer = [TreeNode]()
        while currentArr.count != 0 {
            for node in currentArr {
                if node.left != nil {
                    nextLayer += [node.left!]
                }
                if node.right != nil {
                    nextLayer += [node.right!]
                }
            }
            currentArr = nextLayer
            nextLayer = []
            depth += 1
        }
        
        return 0
    }
}

//[3,9,20,null,null,15,7]，
let subClass = Solution()

var TreeNodeClass = TreeNode.init(3)
TreeNodeClass.left = TreeNode.init(9)
TreeNodeClass.right = TreeNode.init(20)
TreeNodeClass.right?.left = TreeNode.init(15)
TreeNodeClass.right?.right = TreeNode.init(7)

let demoDFSHieght = subClass.demoDFS(TreeNodeClass)
let demoBFSHieght = subClass.maxDepthBFS(TreeNodeClass)


let DFSHieght = subClass.maxDepth(TreeNodeClass)
let BFSHieght = subClass.maxDepthBFS(TreeNodeClass)


subClass.lengthOfLongestSubstringCustom("cdd")
subClass.lengthOfLongestSubstringCustom("abc")
subClass.lengthOfLongestSubstringCustom("aa")
subClass.lengthOfLongestSubstringCustom("asjdiosjoa")
subClass.lengthOfLongestSubstringCustom("aab")


