<script lang="ts">
  import { FeedbackStore } from "../stores";

  $: count = $FeedbackStore.length;
  $: average = $FeedbackStore.reduce((a, { rating }) => a + rating, 0) / count;
</script>

<div class="feedback-stats">
  {#if count === 1}
    <h4>{count} Review</h4>
  {:else}
    <h4>{count} Reviews</h4>
  {/if}

  <h4>Ratings Average: {average ? average.toFixed(1) : 0}</h4>
</div>

<style lang="scss">
  .feedback-stats {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
</style>
