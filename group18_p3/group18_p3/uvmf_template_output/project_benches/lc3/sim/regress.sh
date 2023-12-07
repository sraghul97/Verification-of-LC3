rm -rf *ucdb
rm -rf transcript*
make clean
make emu_build
make run_cli TEST_NAME=test_top TEST_SEED=2134 > transcript_test_top
make run_cli TEST_NAME=alu_test TEST_SEED=random > transcript_alu_test
make run_cli TEST_NAME=branch_test TEST_SEED=random > transcript_branch_test
make run_cli TEST_NAME=mem_test TEST_SEED=random > transcript_mem_test
make run_cli TEST_NAME=random_test TEST_SEED=random > transcript_random_test
make run_cli TEST_NAME=random_test TEST_SEED=random
make merge_coverage_with_test_plan
