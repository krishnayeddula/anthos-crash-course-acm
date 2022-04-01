package storagebucketuniform

violation[{"msg": msg}] {
    not input.review.object.spec.uniformBucketLevelAccess
    msg := sprintf("Storage bucket %s must have uniform bucket-level access configured", [input.review.object.metadata.name])
}
