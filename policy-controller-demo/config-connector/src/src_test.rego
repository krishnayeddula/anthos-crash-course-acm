package storagebucketuniform

test_input_container_not_uniform_allowed {
    input := { "review": input_review_valid }
    results := violation with input as input
    count(results) == 0
}

test_input_container_uniform_not_allowed {
    input := { "review": input_review_violating_1 }
    results := violation with input as input
    count(results) > 0
}

test_input_container_uniform_missing {
    input := { "review": input_review_violating_2 }
    results := violation with input as input
    count(results) > 0
}

input_review_valid = {
    "object": {
        "metadata": {
            "name": "valid-storage-bucket"
        },
        "spec": {
            "uniformBucketLevelAccess": true
        }
    }
}

input_review_violating_1 = {
    "object": {
        "metadata": {
            "name": "violating_storage_bucket_1"
        },
        "spec": {
            "uniformBucketLevelAccess": false
        }
    }
}

input_review_violating_2 = {
    "object": {
        "metadata": {
            "name": "violating_storage_bucket_2"
        },
        "spec": {
            # Missing field for uniformBucketLevelAccess
        }
    }
}