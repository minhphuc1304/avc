#! /bin/bash

#1
cau1() {
    file="$1"
    read -r input
    echo "$input" >>"$file"
}

#2
cau2() {
    file="$2"
    read -r input
    echo "$input" "$((RANDOM % 101 + 20))" >>"$2"
}

#3
cau3() {
    file="$1"
    while read -r line; do
        echo "${line}"
    done <"${file}"
}

#4
cau4() {
    file="$2"
    while read -r line; do
        echo "${line}"
    done <"${file}"
}

#5
cau5() {
    awk '$NF > 60 {print}' "$2"
}

#6
cau6() {
    sort -k 1n "$2" >tempfile1 && mv tempfile1 "$2"
    sort -k 1n "$1" >tempfile2 && mv tempfile2 "$1"
    join -1 1 -2 1 -t " " "$1" "$2" | awk '{print}' >>tempfile3
    awk '$5 > 60 {print $2}' tempfile3
    rm tempfile3
}
#7
cau7() {
    sort -k 1n "$2" >tempfile1 && mv tempfile1 "$2"
    sort -k 1n "$1" >tempfile2 && mv tempfile2 "$1"
    join -1 1 -2 1 -t " " "$1" "$2" | awk '{print}' >>tempfile3
    awk '$5 > 60 {print}' tempfile3 >vipham.txt
    rm tempfile3
}
#8
cau8() {
    read -r a
    sed -n '/'"$a"'/p' vipham.txt | awk '{print}'
}
menu() {
    while true; do
        echo Le Minh Phuc - 3119411051 - DCT119C1
        echo 1. Nhập thông tin xe.
        echo 2. Nhập thông tin dữ liệu xe di chuyển
        echo 3. Xuất thông tin danh sách biển số xe
        echo 4. Xuất thông tin dữ liệu xe di chuyển
        echo 5. Xuất thông tin xe vi phạm
        echo 6. Hiển thi tên người vi phạm
        echo 7. Lưu thông tin
        echo 8. Kiểm tra vi phạm
        echo 9. Thoát
        read -r k
        case "$k" in
        1)
            cau1 "$1" "$2"
            ;;
        2)
            cau2 "$1" "$2"
            ;;
        3)
            cau3 "$1" "$2"
            ;;
        4)
            cau4 "$1" "$2"
            ;;
        5)
            cau5 "$1" "$2"
            ;;
        6)
            cau6 "$1" "$2"
            ;;
        7)
            cau7 "$1" "$2"
            ;;
        8)
            cau8
            ;;
        9)
            break
            ;;
        esac
    done
    exit 0

}
menu "$1" "$2"