# 유용한 내장함수 및 메소드

`zip()` 함수

```python
a = [1, 2, 3]
b = [4, 5, 6]
c = zip(a, b)
print(c) # [[1, 4], [2, 5], [3, 6]]
```

`rjust()` 메소드

```python
str = "123"
str.rjust(5, "0")
print(str) # "00123"
```

해당 문자열이 첫 번째 인자로 받은 정해진 길이가 될 때까지 두 번재 인자를 앞에 자동으로 채워줌.

이진수의 빈공간을 채울 때(예: 1 => 0001) 매우 편리함.
