<template>
  <button
    @click="deleteList(props.listId)"
    class="bg-red-500 text-white px-3 py-2 rounded hover:bg-red-600"
  >
    削除
  </button>
</template>

<script setup lang="ts">
  const props = defineProps<{
    listId: number
  }>()

  const emit = defineEmits<{
    (e: 'deleted', id: number): void
  }>()

  const deleteList = async (id: number) => {
    const response = await fetch(`/lists/${id}`, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || '',
        'Content-Type': 'application/json'
      }
    })

    if(response.ok) {
      emit('deleted', id)
    } else {
      alert("残念！失敗！")
    }
  }
</script>