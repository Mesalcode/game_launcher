class CallManager{
   List<Call> calls = new ArrayList<Call>();
   void addCall(Call toAdd){calls.add(toAdd);}
   void removeCall(Call toRemove){calls.remove(toRemove);}
   Call[] getCalls(){return calls.toArray(new Call[calls.size()]);}
}
