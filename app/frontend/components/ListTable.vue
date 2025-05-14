<template>
  <table class="w-full my-5">
    <thead class="bg-gray-100">
      <tr>
        <th class="px-6 py-3 text-left">タイトル</th>
        <th class="px-6 py-3 text-left">詳細</th>
        <th class="px-6 py-3 text-left"></th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="list in lists">
        <td class="px-6 py-4">{{  list.title }}</td>
        <td class="px-6 py-4">{{ list.content }}</td>
        <td class="px-6 py-4"><ListDeleteBtn :listId="list.id" @deleted="handleDelete" /></td>
      </tr>
    </tbody>
  </table>
</template>

<script setup lang="ts">
  import { ref } from 'vue'
  import ListDeleteBtn from './ListDeleteBtn.vue'
  interface ListItem {
    id: number
    title: string
    content: string
  }

  const props = defineProps<{ lists: ListItem[] }>()
  const lists = ref<ListItem[]>([...props.lists])

  const handleDelete = (id: number) => {
    lists.value = lists.value.filter(list => list.id !== id)
  }
</script>
