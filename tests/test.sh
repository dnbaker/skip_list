echo "Running unit tests..."
set -e
for tf in \
test_multi_skip_list.cpp \
test_random_access.cpp \
test_skip_list.cpp
do
${CXX:-g++} $tf -DCATCH_CONFIG_MAIN -I. -I.. && ./a.out && echo "Test $tf passed" && rm a.out
done

echo "Running benchmarks..."
g++ benchmark.cpp -I.. -I. -DBENCHMARK_WITH_MAIN && ./a.out; rm a.out
