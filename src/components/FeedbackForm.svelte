<script lang="ts">
  import Button from "./Button.svelte";
  import Card from "./Card.svelte";
  import RatingSelect from "./RatingSelect.svelte";
  import { v4 as uuidv4 } from "uuid";
  import { FeedbackStore } from "../stores";

  let text = "";
  let rating = 10;
  let btnDisabled = true;
  let min = 10;
  let message: string;

  const handleSelect = (e: any): void => (rating = e.detail);

  const handleSubmit = () => {
    if (text.trim().length >= min) {
      const newFeedback = {
        id: uuidv4(),
        text: text,
        rating: +rating,
      };
      FeedbackStore.update((currentFeedback) => {
        return [newFeedback, ...currentFeedback];
      });
      text = "";
    }
  };

  const handleInput = (): void => {
    if (text.trim().length < min) {
      message = `Text must be at least ${min} characters`;
      btnDisabled = true;
    } else {
      message = null;
      btnDisabled = false;
    }
  };
</script>

<Card>
  <header>
    <h2>How would you rate your service with us?</h2>
  </header>
  <form on:submit|preventDefault={handleSubmit}>
    <RatingSelect on:rating-select={handleSelect} />
    <div class="input-group">
      <input
        type="text"
        bind:value={text}
        on:input={handleInput}
        placeholder="Tell us something tat keeps you coming back"
      />
      <Button type="submit" disabled={btnDisabled}>Send</Button>
    </div>
    {#if message}
      <div class="message">
        {message}
      </div>
    {/if}
    <!-- Rating Select -->
  </form>
</Card>

<style lang="scss">
  header {
    max-width: 400px;
    margin: auto;

    h2 {
      font-size: 22px;
      font-weight: 600;
      text-align: center;
    }
  }
  .input-group {
    display: flex;
    flex-direction: row;
    border: 1px solid #ccc;
    padding: 8px 10px;
    border-radius: 8px;
    margin-top: 15px;

    input {
      flex-grow: 2;
      border: none;
      font-size: 16px;
    }
    input:focus {
      outline: none;
    }
  }
  .message {
    padding-top: 10px;
    text-align: center;
    color: rebeccapurple;
  }
</style>
