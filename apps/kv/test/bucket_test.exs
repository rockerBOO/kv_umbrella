defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "remove value by key", %{bucket: bucket} do 
  	KV.Bucket.put(bucket, "delete-me-key", True)

  	assert KV.Bucket.get(bucket, "delete-me-key") == True

  	KV.Bucket.delete(bucket, "delete-me-key")

  	assert KV.Bucket.get(bucket, "delete-me-key") == nil
  end
end
