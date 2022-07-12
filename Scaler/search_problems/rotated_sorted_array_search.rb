=begin
https://www.scaler.com/academy/mentee-dashboard/class/26920/assignment/problems/203/hints?navref=cl_sb_nd
Problem Description
Given a sorted array of integers A of size N and an integer B.

array A is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2 ).

You are given a target value B to search. If found in the array, return its index otherwise, return -1.

You may assume no duplicate exists in the array.

NOTE: Users are expected to solve this in O(log(N)) time.



Problem Constraints
1 <= N <= 1000000

1 <= A[i] <= 10^9

all elements in A are distinct.



Input Format
The first argument given is the integer array A.

The second argument given is the integer B.



Output Format
Return index of B in array A, otherwise return -1



Example Input
Input 1:

A = [4, 5, 6, 7, 0, 1, 2, 3]
B = 4
Input 2:

A = [1]
B = 1


Example Output
Output 1:

 0
Output 2:

 0


Example Explanation
Explanation 1:


Target 4 is found at index 0 in A.
Explanation 2:


Target 1 is found at index 0 in A.

Java:
public class Solution {
	// DO NOT MODIFY THE LIST
	public int search(final List<Integer> A, int B) {
	    int mid;
	    int start, end;
	    int count;
	    int num;
	    int n = A.size();
	    count = n;
	    // find the index of minimum element
	    int pivot = getMinElementIndex(A);
	    // Now we can binary search in two parts 0 - pivot and pivot to n-2
	    start = pivot;
	    end = n - 1;
	    int res = binarySearch(A, start, end, B);
	    if (res == -1) {
	        start = 0;
	        end = pivot - 1;
	        res = binarySearch(A, start, end, B);
	    }
	    return res;
	}

	public int binarySearch(final List<Integer> A, int start, int end, int B) {
	    int count = end - start + 1;
	    int num, mid;
	    while (count > 0) {
	        mid = start + (end - start) / 2;
	        num = A.get(mid);
	        if (B == num)
	            return mid;
	        if (B < num)
	            end = mid - 1;
	        else
	            start = mid + 1;
	        count /= 2;
	    }
        return -1;
	}
	public int getMinElementIndex(final List<Integer> A) {
	    int first, last, start, end;
	    int count, num, n;
	    int mid;
	    int next, prev;
	    n = A.size();
	    count = n;
	    first = A.get(0);
	    last = A.get(n - 1);
	    start = 0;
	    end = n - 1;
	    while (count > 0) {
	        mid = start + (end - start) / 2;
	        num = A.get(mid);
	        next = A.get((mid + 1) % n);
	        prev = A.get((mid - 1 + n) % n);
	        if (num < prev && num < next) {
	            return mid;
	        }
	        if (num > first && num > last)
	            start = mid + 1;
	        else
	            end = mid - 1;
	        count /= 2;
        }
	    return -1;
	}
}
=end