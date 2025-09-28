<!-- 削除後に新規投稿すると、削除したものが復活する（リロードすると消える） -->




<template>
  <form @submit.prevent="submitForm" class="border border-solid border-gray-200 p-4">
    <div class="grid grid-cols-[auto_1fr] gap-x-4 gap-y-2">
      <label for="title">タイトル</label>
      <input
        id="title"
        v-model="newList.title"
        class="border border-solid border-gray-400 rounded p-2"
        type="text"
        placeholder="タイトルを入力してください"
      />

      <label for="content">本文</label>
      <input
        id="content"
        v-model="newList.content"
        class="border border-solid border-gray-400 rounded p-2"
        type="text"
        placeholder="詳細を入力してください"
      />

      <button
        type="submit"
        class="col-start-2 bg-green-500 text-white font-bold hover:bg-green-600 px-4 py-1 w-full my-2 rounded cursor-pointer"
      >
        保存
      </button>
    </div>
  </form>
</template>

<script setup lang="ts">
import { reactive } from 'vue';

  const newList = reactive({
    title: '',
    content: ''
  })

  const emit = defineEmits(['add-lists'])

  const submitForm = async () => {
    const response = await fetch('/lists', {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || '',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ list: newList })
    })

    if (response.ok) {
      alert('成功')
      const savedList = await response.json()
      emit('add-lists', savedList)
      newList.title = ''
      newList.content = ''
    } else {
      alert('残念！失敗！！')
    }
  }
</script>