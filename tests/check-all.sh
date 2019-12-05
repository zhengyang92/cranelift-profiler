#!/bin/bash


# test1
/opt/wasi-sdk/bin/clang --target=wasm32-wasi -o test1.wasm test1.c
CRANELIFT_ENABLE_PROFILING=1 ../wasmtime/target/debug/wasmtime --cranelift  test1.wasm  --disable-cache 2> /dev/null > test1.data
python ../process.py func_symbol_table.txt test1.data > test1_result

if grep "f_a,10" test1_result > /dev/null; then
    echo "[PASS] Test 1"
else
    echo "[FAIL] Test 1"
fi

#cleanup
rm -f test1.wasm func_symbol_table.txt test1.data test1_result


# test2
/opt/wasi-sdk/bin/clang --target=wasm32-wasi -o test2.wasm test2.c
CRANELIFT_ENABLE_PROFILING=1 ../wasmtime/target/debug/wasmtime --cranelift  test2.wasm  --disable-cache 2> /dev/null > test2.data
python ../process.py func_symbol_table.txt test2.data > test2_result

if grep "printf,10" test2_result > /dev/null; then
    echo "[PASS] Test 2"
else
    echo "[FAIL] Test 2"
fi

# cleanup
rm -f test2.wasm func_symbol_table.txt test2.data test2_result

# test3
/opt/wasi-sdk/bin/clang --target=wasm32-wasi -o test3.wasm test3.c
CRANELIFT_ENABLE_PROFILING=1 ../wasmtime/target/debug/wasmtime --cranelift  test3.wasm  --disable-cache 2> /dev/null > test3.data
python ../process.py func_symbol_table.txt test3.data > test3_result

if grep "f_a,10000" test3_result > /dev/null; then
    echo "[PASS] Test 3"
else
    echo "[FAIL] Test 3"
fi

#cleanup
rm -f test3.wasm func_symbol_table.txt test3.data test3_result


# test4
/opt/wasi-sdk/bin/clang --target=wasm32-wasi -o test4.wasm test4.c
CRANELIFT_ENABLE_PROFILING=1 ../wasmtime/target/debug/wasmtime --cranelift  test4.wasm  --disable-cache 2> /dev/null > test4.data
python ../process.py func_symbol_table.txt test4.data > test4_result

if grep "f_a" test4_result >/dev/null && grep "f_b" test4_result > /dev/null; then
    echo "[PASS] Test 4"
else
    echo "[FAIL] Test 4"
fi

#cleanup
rm -f test4.wasm func_symbol_table.txt test4.data test4_result


# test5
/opt/wasi-sdk/bin/clang --target=wasm32-wasi -o test5.wasm test5_1.c test5_2.c
CRANELIFT_ENABLE_PROFILING=1 ../wasmtime/target/debug/wasmtime --cranelift  test5.wasm  --disable-cache 2> /dev/null > test5.data
python ../process.py func_symbol_table.txt test5.data > test5_result

if grep "f_a,10" test5_result >/dev/null; then
    echo "[PASS] Test 5"
else
    echo "[FAIL] Test 5"
fi

#cleanup
rm -f test5.wasm func_symbol_table.txt test5.data test5_result
