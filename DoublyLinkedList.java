public class DoublyLinkedList<T> {
    
    // Node class for doubly linked list
    private static class Node<T> {
        T data;
        Node<T> next;
        Node<T> prev;
        
        Node(T data) {
            this.data = data;
            this.next = null;
            this.prev = null;
        }
    }
    
    private Node<T> head;
    private Node<T> tail;
    private int size;
    
    // Constructor
    public DoublyLinkedList() {
        this.head = null;
        this.tail = null;
        this.size = 0;
    }
    
    // Add element to the end of the list
    public void add(T data) {
        addLast(data);
    }
    
    // Add element to the beginning of the list
    public void addFirst(T data) {
        Node<T> newNode = new Node<>(data);
        
        if (head == null) {
            head = tail = newNode;
        } else {
            newNode.next = head;
            head.prev = newNode;
            head = newNode;
        }
        size++;
    }
    
    // Add element to the end of the list
    public void addLast(T data) {
        Node<T> newNode = new Node<>(data);
        
        if (tail == null) {
            head = tail = newNode;
        } else {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        }
        size++;
    }
    
    // Add element at specific index
    public void add(int index, T data) {
        if (index < 0 || index > size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + size);
        }
        
        if (index == 0) {
            addFirst(data);
        } else if (index == size) {
            addLast(data);
        } else {
            Node<T> newNode = new Node<>(data);
            Node<T> current = getNode(index);
            
            newNode.next = current;
            newNode.prev = current.prev;
            current.prev.next = newNode;
            current.prev = newNode;
            
            size++;
        }
    }
    
    // Get element at specific index
    public T get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + size);
        }
        return getNode(index).data;
    }
    
    // Get first element
    public T getFirst() {
        if (head == null) {
            throw new IllegalStateException("List is empty");
        }
        return head.data;
    }
    
    // Get last element
    public T getLast() {
        if (tail == null) {
            throw new IllegalStateException("List is empty");
        }
        return tail.data;
    }
    
    // Set element at specific index
    public T set(int index, T data) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + size);
        }
        
        Node<T> node = getNode(index);
        T oldData = node.data;
        node.data = data;
        return oldData;
    }
    
    // Remove element at specific index
    public T remove(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + size);
        }
        
        if (index == 0) {
            return removeFirst();
        } else if (index == size - 1) {
            return removeLast();
        } else {
            Node<T> nodeToRemove = getNode(index);
            T data = nodeToRemove.data;
            
            nodeToRemove.prev.next = nodeToRemove.next;
            nodeToRemove.next.prev = nodeToRemove.prev;
            
            size--;
            return data;
        }
    }
    
    // Remove first element
    public T removeFirst() {
        if (head == null) {
            throw new IllegalStateException("List is empty");
        }
        
        T data = head.data;
        
        if (head == tail) {
            head = tail = null;
        } else {
            head = head.next;
            head.prev = null;
        }
        
        size--;
        return data;
    }
    
    // Remove last element
    public T removeLast() {
        if (tail == null) {
            throw new IllegalStateException("List is empty");
        }
        
        T data = tail.data;
        
        if (head == tail) {
            head = tail = null;
        } else {
            tail = tail.prev;
            tail.next = null;
        }
        
        size--;
        return data;
    }
    
    // Remove first occurrence of specific element
    public boolean remove(Object obj) {
        Node<T> current = head;
        
        while (current != null) {
            if ((obj == null && current.data == null) || 
                (obj != null && obj.equals(current.data))) {
                
                if (current == head) {
                    removeFirst();
                } else if (current == tail) {
                    removeLast();
                } else {
                    current.prev.next = current.next;
                    current.next.prev = current.prev;
                    size--;
                }
                return true;
            }
            current = current.next;
        }
        return false;
    }
    
    // Check if list contains specific element
    public boolean contains(Object obj) {
        return indexOf(obj) >= 0;
    }
    
    // Find index of first occurrence of element
    public int indexOf(Object obj) {
        Node<T> current = head;
        int index = 0;
        
        while (current != null) {
            if ((obj == null && current.data == null) || 
                (obj != null && obj.equals(current.data))) {
                return index;
            }
            current = current.next;
            index++;
        }
        return -1;
    }
    
    // Find index of last occurrence of element
    public int lastIndexOf(Object obj) {
        Node<T> current = tail;
        int index = size - 1;
        
        while (current != null) {
            if ((obj == null && current.data == null) || 
                (obj != null && obj.equals(current.data))) {
                return index;
            }
            current = current.prev;
            index--;
        }
        return -1;
    }
    
    // Get size of the list
    public int size() {
        return size;
    }
    
    // Check if list is empty
    public boolean isEmpty() {
        return size == 0;
    }
    
    // Clear all elements from the list
    public void clear() {
        Node<T> current = head;
        while (current != null) {
            Node<T> next = current.next;
            current.data = null;
            current.next = null;
            current.prev = null;
            current = next;
        }
        head = tail = null;
        size = 0;
    }
    
    // Convert list to array
    public Object[] toArray() {
        Object[] array = new Object[size];
        Node<T> current = head;
        int index = 0;
        
        while (current != null) {
            array[index++] = current.data;
            current = current.next;
        }
        return array;
    }
    
    // Helper method to get node at specific index
    private Node<T> getNode(int index) {
        Node<T> current;
        
        // Choose direction based on index position
        if (index < size / 2) {
            // Start from head
            current = head;
            for (int i = 0; i < index; i++) {
                current = current.next;
            }
        } else {
            // Start from tail
            current = tail;
            for (int i = size - 1; i > index; i--) {
                current = current.prev;
            }
        }
        return current;
    }
    
    // String representation of the list
    @Override
    public String toString() {
        if (isEmpty()) {
            return "[]";
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        
        Node<T> current = head;
        while (current != null) {
            sb.append(current.data);
            if (current.next != null) {
                sb.append(", ");
            }
            current = current.next;
        }
        
        sb.append("]");
        return sb.toString();
    }
    
    // String representation in reverse order
    public String toStringReverse() {
        if (isEmpty()) {
            return "[]";
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        
        Node<T> current = tail;
        while (current != null) {
            sb.append(current.data);
            if (current.prev != null) {
                sb.append(", ");
            }
            current = current.prev;
        }
        
        sb.append("]");
        return sb.toString();
    }
    
    // Iterator for forward traversal
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            private Node<T> current = head;
            
            @Override
            public boolean hasNext() {
                return current != null;
            }
            
            @Override
            public T next() {
                if (!hasNext()) {
                    throw new IllegalStateException("No more elements");
                }
                T data = current.data;
                current = current.next;
                return data;
            }
        };
    }
    
    // Iterator for reverse traversal
    public Iterator<T> reverseIterator() {
        return new Iterator<T>() {
            private Node<T> current = tail;
            
            @Override
            public boolean hasNext() {
                return current != null;
            }
            
            @Override
            public T next() {
                if (!hasNext()) {
                    throw new IllegalStateException("No more elements");
                }
                T data = current.data;
                current = current.prev;
                return data;
            }
        };
    }
    
    // Simple Iterator interface (since we're not importing)
    public interface Iterator<E> {
        boolean hasNext();
        E next();
    }
    
    // Main method for testing
    public static void main(String[] args) {
        DoublyLinkedList<Integer> list = new DoublyLinkedList<>();
        
        // Test basic operations
        System.out.println("=== Testing Doubly Linked List ===");
        
        // Adding elements
        list.add(1);
        list.add(2);
        list.add(3);
        list.addFirst(0);
        list.addLast(4);
        
        System.out.println("List: " + list);
        System.out.println("Size: " + list.size());
        
        // Getting elements
        System.out.println("First: " + list.getFirst());
        System.out.println("Last: " + list.getLast());
        System.out.println("At index 2: " + list.get(2));
        
        // Inserting at specific index
        list.add(2, 99);
        System.out.println("After insert at index 2: " + list);
        
        // Searching
        System.out.println("Contains 99: " + list.contains(99));
        System.out.println("Index of 99: " + list.indexOf(99));
        
        // Removing elements
        System.out.println("Removed first: " + list.removeFirst());
        System.out.println("Removed last: " + list.removeLast());
        System.out.println("After removals: " + list);
        
        // Remove by value
        list.remove(Integer.valueOf(99));
        System.out.println("After removing 99: " + list);
        
        // Reverse display
        System.out.println("Reverse: " + list.toStringReverse());
        
        // Iterator test
        System.out.print("Forward iterator: ");
        Iterator<Integer> iter = list.iterator();
        while (iter.hasNext()) {
            System.out.print(iter.next() + " ");
        }
        System.out.println();
        
        System.out.print("Reverse iterator: ");
        Iterator<Integer> reverseIter = list.reverseIterator();
        while (reverseIter.hasNext()) {
            System.out.print(reverseIter.next() + " ");
        }
        System.out.println();
        
        // Array conversion
        Object[] array = list.toArray();
        System.out.print("As array: ");
        for (Object obj : array) {
            System.out.print(obj + " ");
        }
        System.out.println();
        
        // Clear test
        list.clear();
        System.out.println("After clear - Size: " + list.size() + ", Empty: " + list.isEmpty());
    }
}
